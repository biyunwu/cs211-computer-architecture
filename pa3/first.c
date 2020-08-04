// Created by Biyun Wu on 7/29/20.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "cache.h"
#define BITS 48

int main(int argc, char* argv[]) {
    if (argc != 6) return error("Invalid arguments! Example: $./first 32 4 fifo assoc:2 trace2.txt");
    // Read arguments: "$./first 32 4 fifo assoc:2 trace2.txt" OR "$./first 32 4 lru assoc:2 trace2.txt".
    // Policy: 1 -> First In First Out (fifo), 2 -> Least Recently Used (lru).
    // Associativity: 0 -> Fully associative cache, 1 -> Direct mapped cache, n>=2 -> n-way associative cache.
    int policy = -1, assoc = -1;
    unsigned long long cacheSize, blockSize;
    char *policyStr = argv[3], *assocStr = argv[4];
    // Get cache size and block size.
    cacheSize = strtol(argv[1], NULL, 10);
    if (cacheSize < 1) return error("Invalid cache size (the 1st argument)!");
    blockSize = strtol(argv[2], NULL, 10);
    if (blockSize < 1) return error("Invalid block size (the 2nd argument)!");
    // Get cache policy.
    if (strcmp("fifo", policyStr) == 0) policy = 0; // First In First Out.
    if (strcmp("lru", policyStr) == 0) policy = 1;  // Least Recently Used.
     if (policy < 0 || strlen(policyStr) > 4) return error("Error: cache policy is either \"fifo\" or \"lru\" (the 3rd argument)!");
    // Get associativity.
    if (strcmp("assoc", assocStr) == 0) assoc = 0;  // Fully associative cache.
    if (strcmp("direct", assocStr) == 0) assoc = 1; // Direct mapped cache.
    if (strlen(assocStr) > 6) {
        // Iterate int chars from the end to the front until encounter the semicolon.
        int res = 0, i = (int) strlen(assocStr) - 1, j = 0;
        while (i >= 6){
            // "assoc:234", the first number's index is 6.
            int temp = assocStr[i--] - '0';
            // The current char does not represent a number.
            if (temp < 0 || temp > 9) return error("Invalid associativity (the 4th argument)!");
            res += (int) (temp * pow(10, j++));
        }
        assoc = res;
    }
    if (assoc < 0) return error("Invalid associativity!");

    // Calculate lines/blocks, setsNum, offset bits and tag bits.
    unsigned long long blocksNum = cacheSize/blockSize;
    unsigned long long setsNum = (assoc == 0) ? 1 : (blocksNum / assoc); // Fully associative cache OR n-way cache.
    int offsetBits = (int)(log2((double)blockSize)); // log_2 (blockSize)
    int setBits = (int)(log2((double)setsNum));      // log_2 (setsNum)
    // Fully associative cache has 0 Set bit.
    int tagBits = (assoc == 0) ? (BITS - offsetBits) : (BITS - setBits - offsetBits);
    // Evaluate cache specs.
    if (setsNum < 1 || tagBits < 1) return error("Invalid setsNum/tagBits, cannot Set up cache based on arguments!");

    // Open trace file.
    char *filename = argv[5];           // Trace file to be read by the program.
    FILE *file;
    file = fopen(filename, "r");

    // For keeping records.
    Record *record = (Record *) malloc(sizeof(Record));
    record->reads = 0, record->writes = 0, record->hits = 0, record->misses = 0;
    // Hexadecimal address has (BITS/4 + 2 + 1) chars with leading "0x" (2) and '\0' (1) which indicates the end of the string.
    // Without the extra 1 bit for '\0', compiling rule "-fsanitize=address" would generate heap-buffer-overflow in running time.
    char c, *hexAddress = (char *) malloc((BITS/4 + 3) * sizeof(char));
    if (assoc == 0){ // Fully associative cache.
        FaCache fac = initFACache(blocksNum);
        // Read trace file line by line.
        while (fscanf(file, "%c\t%s\n", &c, hexAddress) != EOF && (c == 'R' || c == 'W')) {
            unsigned long long tag = getDecTag(getDecAddress(hexAddress), setBits, offsetBits);
            int found = readBlockInSet(fac, tag, policy); // found: 1, not found: 0.
            // Full associative map has only 1 set. The set index is always 0.
            updateCache(found, c, fac, 0, tag, record); // FA cache has only 1 set with index 0.
        }
        freeFACache(fac);   // Free cache.
    } else {   // N-way cache. Direct-mapped cache is a special n-way cache as assoc=1.
        NwCache nwCache = initNWCache(setsNum, assoc);
        while (fscanf(file, "%c\t%s\n", &c, hexAddress) != EOF && (c == 'R' || c == 'W')) {
            unsigned long long decAddress = getDecAddress(hexAddress);
            unsigned long long setIdx = getSetIndex(decAddress, setBits, offsetBits);
            unsigned long long tag = getDecTag(decAddress, setBits, offsetBits);
            int found = readBlockInSet(&(nwCache[setIdx]), tag, policy);
            updateCache(found, c, nwCache, setIdx, tag, record);
        }
        freeNWCache(nwCache, setsNum);
    }

    // Print result.
    printf("Memory reads: %lld\n", (record->reads));
    printf("Memory writes: %lld\n", (record->writes));
    printf("Cache hits: %lld\n", (record->hits));
    printf("Cache misses: %lld\n", (record->misses));
    
    fclose(file);
    free(hexAddress);
    free(record);
    return 0;
}