#include <stdio.h>
#include <stdlib.h>

int compareAscending (const void* x, const void* y){
    int a = *((int*) x);
    int b = *((int*) y);
    if (a == b) return 0;
    return a>b ? 1 : -1;
}

int compareDescending (const void* x, const void* y){
    int a = *((int*) x);
    int b = *((int*) y);
    if (a == b) return 0;
    return a<b ? 1 : -1;
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        return -1;
    }

    // Read file from command line argument.
    FILE *file;
    file = fopen(argv[1], "r");

    // Get the number of integers from the 1st line.
    int total;
    fscanf(file, "%d\n", &total);

    // Suppose all numbers may be odd/even.
    int odds[total], evens[total];
    int oddIdx = 0, evenIdx = 0;

    // Read integers in the 2nd line.
    int i, temp;
    for (i=0; i<total; i++){
        fscanf(file, "%d\t", &temp);
        if (temp % 2 == 0){
            evens[evenIdx] = temp;
            evenIdx++;
        } else {
            odds[oddIdx] = temp;
            oddIdx++;
        }
    }

    fclose(file);

    // oddIdx and evenIdx are also sizes of the arrays.
    qsort(odds, oddIdx, sizeof(int), compareAscending);
    qsort(evens, evenIdx, sizeof(int), compareDescending);

    for (int i=0; i<oddIdx; i++){
        printf("%d\t", odds[i]);
    }

    for (int i=0; i<evenIdx; i++){
        printf("%d\t", evens[i]);
    }

    printf("\n");
    return 0;
}
