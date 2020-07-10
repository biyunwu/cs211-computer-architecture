#include <stdio.h>
#include <stdlib.h>

/**
One-shot Learning: W = [[(X^T)*X]^(-1)]*(X^T)*Y
------------------------------------------------------------------------------------------------------------------------
Matrix:     X: matrix | X^T: transpose | (X^T)*X : tranTimesMatrix | [(X^T)*X,I]: augmented  | [(X^T)*X]^(-1): inverse
Dimension:  r*(c+1)   | (c+1)*r        | (c+1)*(c+1)               | (c+1)*[2*(c+1)]         | (c+1)*(c+1)
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
Matrix:      [[(X^T)*X]^(-1)]*(X^T): invTimTran  |  Y: priceVector
Dimension:   (c+1)*r                             |  r*1
------------------------------------------------------------------------------------------------------------------------
`inverse` is the right half of `augmented` after Gauss elimination operations executed on `augmented`.
 **/

// Numbers of attributes(# of columns - 1) and rows.
int c, r;
double **matrix, **transpose, **augmented, **inverse, **invTimTran;
// Vector size: r. Weights size: c+1.
double *priceVector, *weights;

void allocate2dArray(double ***arr, int m, int n){
    *arr = (double **) calloc(m, sizeof(double *));
    int i, j;
    for (i = 0; i < m; i++){
        (*arr)[i] = (double *) calloc(n, sizeof(double));
    }
}

void writeDataToMatrices (FILE **df){
    // Read each row and write to matrix.
    int m = 0, n;
    while (m < r){
        // Price (the 0th entry) and attributes (1 to c-1) data entries.
        for (n = 0; n < c; n++){
            fscanf(*df, "%lf,", &(matrix[m][n]));
        }
        // Last attribute: the (c)th entry in the row.
        fscanf(*df, "%lf\n", &(matrix[m][c]));
        m++;
    }

    // Adjust matrices.
    for (m = 0; m < r; m++){
        // Copy the first column to the price vector.
        priceVector[m] = matrix[m][0];
        // Change the matrix's first column entries to 1.
        matrix[m][0] = 1;
    }
}

void generateTranspose(double ***source, double ***tran){
    // Transpose size: (c+1)*r.
    int i, j;
    for (i = 0; i < r; i++){
        for (j = 0; j < c + 1; j++){
            (*tran)[j][i] = (*source)[i][j];
        }
    }
}

// Dimension for matrix multiplication: (m*n)*(n*y) = m*y -> result matrix
void matrixTimesMatrix(double ***ma_1, double ***ma_2, int m, int n, int y, double ***result) {
    int i, j, k;
    for (i=0; i<m; i++){
        for (j=0; j<y; j++){
            for (k=0; k<n; k++){
                (*result)[i][j] += (((*ma_1)[i][k]) * ((*ma_2)[k][j]));
            }
        }
    }
}

// Source matrix dimension: m*m. Augmented matrix [(X^T)*X, Identity matrix] dimension: m*(2m)
void fillMatrixWithIdentity(double ***aug, int m) {
    int i, j;
    for (i=0; i<m; i++){
        for (j=m; j<2*m; j++){
            (*aug)[i][j] = (i == j-m) ? 1 : 0;
        }
    }
}

// `aug` matrix dimension: m*(2m)
void gaussElimination(double ***aug, int m) {
    int k, i, j, n;
    // Clean the lower triangle of the left part of `aug`.
    for (k=0; k<m; k++){
        for (i=k; i<m; i++){
            // Divisors are diagonal entries of the left half of `(*aug)`
            double divisor = (*aug)[i][k];
            if (divisor != 0 && divisor != 1){
                for (j=0; j<2*m; j++){
                    (*aug)[i][j] = ((*aug)[i][j])/divisor;
                }
            }
        }

        // r_1 - r_n -> r_n, 1 <= n < m. Make all entries under pivots to be 0.
        for (i=k+1; i<m; i++){
            for (j=0; j<2*m; j++){
                (*aug)[i][j] = (*aug)[k][j] - (*aug)[i][j];
            }
        }
    }

    // Clean the upper triangle of the left half of `aug`.
    // Starts from the first row.
    for (j=m-1; j>=0; j--){  // j: column index.
        for (i=0; i<j; i++){ // i: row index.
            double multiFactor = (*aug)[i][j];
            for (n=0; n<2*m; n++){
                (*aug)[i][n] -= (multiFactor * ((*aug)[j][n]));
            }
        }
    }
}

// The right half of the augmented matrix is the inverse.
void copyToInverse(double ***aug, double ***inv, int rowSize, int colSize) {
    int i, j;
    for (i=0; i<rowSize; i++){
        for (j=0; j<colSize; j++){
            (*inv)[i][j] = (*aug)[i][j + colSize];
        }
    }
}

void matrixTimesVector(double ***ma, int m, int n, double **vec, double **desVec){
    int i, j;
    for (i=0; i<m; i++){
        for (j=0; j<n; j++){
            (*desVec)[i] += (((*ma)[i][j]) * ((*vec)[j]));
        }
    }
}

void free2dArray(double **arr, int m){
    int i;
    for (i=0; i<m; i++){
        free(arr[i]);
    }
}

void init() {
    // Allocate memory.
    allocate2dArray(&matrix, r, c+1);
    allocate2dArray(&transpose, c+1, r);
    allocate2dArray(&augmented, c+1, 2*(c+1));
    allocate2dArray(&inverse, c+1, c+1);
    allocate2dArray(&invTimTran, c+1, r);
    priceVector = (double *) calloc(r, sizeof(double));
    weights = (double *) calloc((c+1), sizeof(double));
}

void freeMemory() {
    free2dArray(matrix, r);
    free2dArray(transpose, c + 1);
    free2dArray(augmented, c+1);
    free2dArray(inverse, c+1);
    free2dArray(invTimTran, c+1);
    free(priceVector);
    free(weights);
}

int main(int argc, char* argv[]) {
    // Check command line arguments.
    if (argc < 3){
        return -1;
    }

    // Open file with training data.
    FILE *df = fopen(argv[1], "r");

    // Get the size of the matrix.
    fscanf(df, "%d\n", &c);
    fscanf(df, "%d\n", &r);

    init();
    writeDataToMatrices(&df);
    fclose(df);
    generateTranspose(&matrix, &transpose);

    // (X^T)*X. Store the result to the left part of `augmented`.
    matrixTimesMatrix(&transpose, &matrix, c+1, r, c+1, &augmented);
    // Augmented matrix: [tranTimesMatrix, Identity matrix]. Dimension: (c+1)*2(c+1)
    fillMatrixWithIdentity(&augmented, c + 1);

    gaussElimination(&augmented, c + 1);
    copyToInverse(&augmented, &inverse, c+1, c+1);
    matrixTimesMatrix(&inverse, &transpose, c+1, c+1, r, &invTimTran);
    matrixTimesVector(&invTimTran, c+1, r, &priceVector, &weights);

    // Open file with test data.
    FILE *td = fopen(argv[2], "r");
    int dataCount;
    fscanf(td, "%d\n", &dataCount);
    int i, j;
    double temp;
    for (i=0; i<dataCount; i++) {
        double estimatedValue = weights[0];
        for (j=1; j<c+1; j++){
            fscanf(td, "%lf,", &temp);
            estimatedValue += ((weights[j]) * temp);
        }
        printf("%0.0lf\n", estimatedValue); // Round to the nearest integer.
    }

    fclose(td);

    freeMemory();
    return 0;
}
