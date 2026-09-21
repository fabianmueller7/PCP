#include <stdio.h>

void printNumbersGoto(int n) {

    int i = 0;

    loop:
        if( n >= i) {
            printf("%d ", i++);
            goto loop;
        }
    printf("\n");
}

void printNumbersFor(int n) {
    for(int i = 0; n >= i; i++) {
        printf("%d ", i);
    }
    printf("\n");
}

void printNumbersRecursiveFunction(int n) {

    if( n > 0) {
        printNumbersRecursiveFunction(n-1);
        printf("%d ", n);
    } else {
        printf("%d ", n);
    }
}

void printReverseNumbersRecursiveFunction(int n) {
        if( n > 0) {
            printf("%d ", n);
            printReverseNumbersRecursiveFunction(n-1);
        } else {
            printf("%d ", n);
        }
}


int main(void) {
    printf("printNumbersGoto(7)\n");
    printNumbersGoto(7);
    printf("printNumbersFor(7)\n");
    printNumbersFor(7);
    printf("printNumbersRecursiveFunction(7)\n");
    printNumbersRecursiveFunction(7);
    printf("\n");
    printf("printReverseNumbersRecursiveFunction(7)\n");
    printReverseNumbersRecursiveFunction(7);
    return 0;

}