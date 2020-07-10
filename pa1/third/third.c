#include <stdio.h>

// Unsigned short: [0, 65535].
// Binary representation for unsigned short int: [0000000000000000, 1111111111111111] (16 bits).

// Return a num with its nth bit is 1, other bits are all 0.
unsigned short getBinary(int n){
    return 1 << n;
}

// Return the value of the nth bit, either 0 or 1.
unsigned short get (unsigned short decimal, int n){
    unsigned short bool = decimal & getBinary(n);
    // bool: 000000100000. The nth bit is 1.
    // bool: 000000000000. The nth bit is 0.
    return bool ? 1 : 0;
}

// Flip the nth bit, then return the decimal value.
unsigned short complement (unsigned short decimal, int n){
    unsigned short checker = getBinary(n);
    return decimal ^ checker;
}

unsigned short set (unsigned short decimal, int n, int num){
    unsigned short checker = getBinary(n);
    unsigned short bool = decimal & checker;
    return bool ? ((num == 0) ? (decimal ^ checker) : decimal)   // bool: 000000100000. The nth bit is 1.
                : ((num == 0) ? decimal : (decimal ^ checker));  // bool: 000000000000. The nth bit is 0.
}

int main(int argc, char* argv[]) {
    // Check command line arguments.
    if (argc < 2){
        return -1;
    }

    // Open file.
    FILE *file = fopen(argv[1], "r");

    // Read the first line, which contains the given decimal number.
    unsigned short decimal;
    fscanf(file, "%hu\n", &decimal);

    char str[10];
    int n, num;
    while (fscanf(file, "%s\t%d\t%d\n", str, &n, &num) != EOF){
        // Test only.
        // printf("%s\t%d\t%d\n", str, n, num);

        if (str[0] == 's'){ // set
            // Set the nth bit to `num`, then print the decimal value.
            decimal = set(decimal, n, num);
            printf("%hu\n", decimal);
        } else if (str[0] == 'g'){ // get
            // Print the nth bit.
            printf("%hu\n", get(decimal, n));
        } else if (str[0] == 'c'){ // comp
            // Get the complement for the nth bit: either 1 or 0. Then, print the decimal value.
            decimal = complement(decimal, n);
            printf("%hu\n", decimal);
        }
    }

    fclose(file);
    return 0;
}
