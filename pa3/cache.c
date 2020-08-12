// Created by Biyun Wu on 7/29/20.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "cache.h"

// Direct-mapped cache is a special n-way cache with assoc=1. Fully associative cache has only 1 set.
NWCache initNWCache(unsigned long long setsNum, unsigned long long assoc){
    Set *cache = (Set *) malloc(setsNum * sizeof(Set));
    unsigned long long i, j;
    for (i=0; i<setsNum; i++){
        Block *temp = NULL;
        for (j=0; j < assoc; j++){
            Block *b = (Block *) malloc(sizeof(Block));
            b->v = 0;
            b->tag = 0;
            b->next = temp;
            if (j==0) cache[i].tail = b;
            if (j == (assoc - 1)) cache[i].head = b;
            temp = b;
        }
    }
    return cache;
}

void freeNWCache(NWCache cache, unsigned long long setsNum){
    unsigned long long i;
    for (i=0; i<setsNum; i++){
        Block *prev = NULL, *ptr = cache[i].head;
        while (ptr != NULL){ // Free linked list.
            prev = ptr;
            ptr = ptr->next;
            free(prev);
        }
    }
    free(cache);
}

void moveBlockToTail(Set *set, Block *prev, Block *ptr){
    if (ptr->next == NULL) return; // ptr is the tail.
    if (prev == NULL){             // ptr is the head.
        set->head = ptr->next;
    } else {
        prev->next = ptr->next;
    }
    ptr->next = NULL;
    set->tail->next = ptr;
    set->tail = ptr;
}

void writeToSet(Set *set, unsigned long long tag){
   // Write data to the 1st block, then put the head to the tail.
   set->head->v = 1;
   set->head->tag = tag;
    moveBlockToTail(set, NULL, set->head);
}

// Policy: FIFO -> 0, LRU -> 1.
int readBlockInSet(Set *set, unsigned long long tag, int policy){
    Block *prev = NULL, *ptr = set->head;
    while (ptr != NULL){
        if (ptr->v != 0 && ptr->tag == tag) {
            // Policy: LRU. If found, put "ptr" (the most recently used block) to the end of the linked list.
            if (policy) moveBlockToTail(set, prev, ptr); // Put "ptr" to the end.
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

unsigned long long getBinaryMaskForSetIndex(unsigned setBits){
    unsigned long long mask = ~(0ULL);      // 111111111.......1111111111        If setBits = 4.
    mask <<= setBits;                       // 111111111.......1111110000
    return ~mask;                           // 000000000.......0000001111
}

void updateCache(int found, char mode, Set *set, unsigned long long setIdx, unsigned long long tag, Record *record){
    if (found){     // hit
        (record->hits)++;
    } else {        // miss
        (record->misses)++;
        (record->reads)++;                   // Fetch data from memory.
        writeToSet(set+setIdx, tag);    //Update cache. // writeToSet(&(set[setIdx]), tag);
    }
    // If mode='R', do nothing. Data is already available in cache.
    if (mode == 'W') (record->writes)++;
}

int error(char *str){
    printf("%s\n", str);
    return -1;
}