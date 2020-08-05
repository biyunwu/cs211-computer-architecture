/*
 * Created by Biyun Wu on 7/29/20.
 *
 * Direct mapped cache has setsNum sets. Every set has only 1 block.
 * A fully associative cache has only 1 set which contains all blocks.
 * A n-way cache is an array of sets. And every Set has a linked list with n blocks.
 */

#ifndef PA3_FIRST_H
#define PA3_FIRST_H

// Cache block definition
typedef struct Block{
    int v;                  // valid: 1, invalid: 0.
    unsigned long long tag;
    struct Block *next;
} Block;

// Cache set definition
typedef struct Set{
    Block *head;
    Block *tail;
} Set, *NwCache;

// For keeping record.
typedef struct Record{
    unsigned long long reads, writes, hits, misses;
} Record;

Set* initSet (unsigned long long assoc);
void freeSet(Set *setPointer);
NwCache initNWCache(unsigned long long setsNum, unsigned long long assoc);
void freeNWCache(NwCache cache, unsigned long long setsNum);
int readBlockInSet(Set *set, unsigned long long tag, int policy);
void writeToSet(Set *set, unsigned long long tag);
unsigned long long getDecAddress(char *hexAddress);
unsigned long long getBinaryMaskForSetIndex(unsigned setBits);
void updateCache(int found, char mode, Set *set, unsigned long long setIdx, unsigned long long tag, Record *record);
int error(char *str);

#endif //PA3_FIRST_H