// Created by Biyun Wu on 7/29/20.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "cache.h"

Set* initSet (unsigned long long assoc){
    Set *setPointer = (Set *) malloc(sizeof(Set));
    int i;
    Block *temp = NULL;
    for (i=0; i < assoc; i++){
        Block *b = (Block *) malloc(sizeof(Block));
        b->v = 0;
        b->tag = 0;
        b->next = temp;
        if (i==0) setPointer->tail = b;
        if (i == (assoc - 1)) setPointer->head = b;
        temp = b;
    }
    return setPointer;
}

void freeSet(Set *setPointer){
    Block *prev = NULL, *ptr = setPointer->head;
    while (ptr != NULL){ // Free linked list.
        prev = ptr;
        ptr = ptr->next;
        free(prev);
    }
}

// Direct-mapped cache is a special n-way cache with assoc=1.
NwCache initNWCache(unsigned long long setsNum, unsigned long long assoc){
    Set *cache = (Set *) malloc(setsNum * sizeof(Set));
    int i;
    for (i=0; i<setsNum; i++){
        Set *setPointer = initSet(assoc);
        cache[i].head = setPointer->head;
        cache[i].tail = setPointer->tail;
        free(setPointer); // Free the old set struct (malloc()-ed in 'initSet()') to avoid memory leak.
    }
    return cache;
}

void freeNWCache(NwCache cache, unsigned long long setsNum){
    int i;
    for (i=0; i<setsNum; i++){
        freeSet(&(cache[i]));
    }
    free(cache);
}

FaCache initFACache (unsigned long long numOfBlocks){
    return initSet(numOfBlocks);
}

void freeFACache(FaCache cache){
    freeSet(cache);
}

void putBlockToEnd(Set *set, Block *prev, Block *ptr){
    Block *tail = set->tail;
    if (ptr == tail) return;
    if (prev == NULL){ // ptr = set->head
        set->head = ptr->next;
    } else {
        prev->next = ptr->next;
    }
    ptr->next = NULL;
    tail->next = ptr;
    set->tail = ptr;
}

void writeToSet(Set *set, unsigned long long tag){
    // Policy: FIFO -> 0, LRU -> 1.
    if (policy){ // Least Recently Used.
        Block *prev = NULL, *ptr = set->head, *nextPtr = ptr->next;
        while(nextPtr != NULL && nextPtr->v == 0){   // Find available (empty) block.
            prev = ptr;
            ptr = nextPtr;
            nextPtr = nextPtr->next;
        }
        ptr->v = 1;
        ptr->tag = tag;
        // Put to the end.
        putBlockToEnd(set, prev, ptr);
   } else {     // First In First Out.
       Block *head = set->head;
       // Write data to the 1st block.
        head->v = 1;
        head->tag = tag;
       if (head->next == NULL) return; // Direct-mapped cache has 1 block in every set.
       // Put the first block to the end of the linked list so the head is always the block to write new data.
        set->head = head->next;
        head->next = NULL;
        set->tail->next = head;
        set->tail = head;
    }
}

// Policy: FIFO -> 0, LRU -> 1.
int readBlockInSet(Set *set, unsigned long long tag, int policy){
    Block *prev = NULL, *ptr = set->head;
    while (ptr != NULL){
        if (ptr->v != 0 && ptr->tag == tag) {
            // Policy: LRU. If found, put "ptr" (the most recently used block) to the end of the linked list.
            if (policy){
                putBlockToEnd(set, prev, ptr); // Put "ptr" to the end.
            }
            return 1; // hit
        }
        prev = ptr;
        ptr = ptr->next;
    }
    return 0; // miss
}

unsigned long long getDecimal(char c) {
    switch (c) {
        case '0': return 0;
        case '1': return 1;
        case '2': return 2;
        case '3': return 3;
        case '4': return 4;
        case '5': return 5;
        case '6': return 6;
        case '7': return 7;
        case '8': return 8;
        case '9': return 9;
        case 'a': return 10;
        case 'b': return 11;
        case 'c': return 12;
        case 'd': return 13;
        case 'e': return 14;
        case 'f': return 15;
        default: return 0;
    }
}

unsigned long long getDecAddress(char *hexAddress){ // "0x...abc123".
    unsigned long long res = 0;
    int i = (int)strlen(hexAddress) - 1, j = 0;
    while (hexAddress[i] != 'x'){
        unsigned long long temp = getDecimal(hexAddress[i--]);
        res += temp * (unsigned long long)(pow(16, j++));
    }
    return res;
}

unsigned long long getBinaryMaskForSetIndex(int setBits){
    unsigned long long mask = ~(0ULL);      // 111111111.......1111111111        64 - setBits. setBits = 4.
    mask <<= (unsigned)setBits;             // 111111111.......1111110000
    return ~mask;                           // 000000000.......0000001111
}

unsigned long long getSetIndex(unsigned long long addressInDecimal, int setBits, int offsetBits){
    unsigned long long tagAndSetInDecimal = addressInDecimal >> (unsigned)offsetBits;
    unsigned long long binaryMask = getBinaryMaskForSetIndex(setBits); // ...0000001111  if setBits = 4.
    return tagAndSetInDecimal & binaryMask;
}

unsigned long long getDecTag(unsigned long long addressInDecimal, int setBits, int offsetBits){
    // Memory address structure: [0x [tag bits] [Set index bits] [block offset bits]]
    return addressInDecimal >> (unsigned)(setBits + offsetBits);
}

void updateCache(int found, char mode, Set *set, unsigned long long setIdx, unsigned long long tag, Record *record){
    if (found){     // hit
        (record->hits)++;
        // Data is available in cache, read does not invoke memory manipulation.
        if (mode == 'W') (record->writes)++;
    } else {        // miss
        (record->misses)++;
        if (mode == 'R'){  // Read
            (record->reads)++;    // Fetch data from memory.
            writeToSet(&(set[setIdx]), tag); //Update cache.
        } else {        // Write
            (record->reads)++;    // Fetch data from memory.
            writeToSet(&(set[setIdx]), tag); //Update cache.
            (record->writes)++;
        }
    }
}

int error(char *str){
    printf("%s\n", str);
    return -1;
}