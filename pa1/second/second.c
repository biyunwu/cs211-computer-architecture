#include <stdio.h>
#include <stdlib.h>

#define HashSize 10000

// Integer node definition.
typedef struct node {
    int val;
    struct node *next;
} node;

// Linked list definition.
typedef struct list {
    node *head;
    node *tail;
} list;

// Array with linked lists, works as a hashtable.
list* lists;

void initHashTable(){
    // Initiate the array.
    lists = (list*) malloc(HashSize * sizeof(list));
    int i;
    for (i=0; i<HashSize; i++){
        lists[i].head = NULL;
        lists[i].tail = NULL;
    }
}

int search(int idx, int value){
    // Check whether linked list is empty.
    if (lists[idx].head == NULL){
        return 0;  // Not found.
    }

    // Get corresponding linked list.
    node* ptr = lists[idx].head;

    while (ptr != NULL){
        if ((ptr->val) == value){
            return 1; // Found.
        }
        ptr = ptr->next;
    }

    return 0; // Not found.
}

int insert(int idx, int value){
    // Get corresponding linked list.
    node* ptr = lists[idx].head;

    // Create a temp node for insertion.
    node* temp = (node*) malloc(sizeof(node));
    temp->val = value;
    temp->next = NULL;

    if (ptr == NULL){
        lists[idx].head = temp;
        lists[idx].tail = temp;
        return 1; // Inserted.
    }

    // Search the list.
    if (search(idx, value) == 1){
        // Found, means it is a duplicate.
        free(temp);
        return 0;
    }

    // Not found, insert to the front of the list.
    lists[idx].head = temp;
    temp->next = ptr;
    return 1; // Inserted.
}

int main(int argc, char* argv[]) {
    if (argc < 2){
        // No file name/path specified.
        return -1;
    }

    // Initialize hashtable; allocating memory.
    initHashTable();

    // Read file from command line.
    FILE *file;
    file = fopen(argv[1], "r");

    // Scan data line by line in the file.
    char c;
    int x;
    while (fscanf(file, "%c\t%d\n", &c, &x) != EOF){
        // Use absolute value to get the hashed index.
        int idx = abs(x) % HashSize;

        // Insert to hashtable.
        if (c=='i'){
            (insert(idx, x) == 1) ? printf("inserted\n") : printf("duplicate\n");
        }
        // Search in hashtable.
        if (c=='s'){
            (search(idx, x) == 1) ? printf("present\n") : printf("absent\n");
        }
    }

    fclose(file);

    // Free linked lists in the hashtable
    int i;
    for (i=0; i<HashSize; i++){
        node* ptr = lists[i].head;
        node* ptrNext;
        while (ptr != NULL){
            ptrNext = ptr->next;
            free(ptr);
            ptr = ptrNext;
        }
    }

    free(lists);

    return 0;
}
