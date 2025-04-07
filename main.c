#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

int mul(int a, int b) {
    return a * b;
}


int main() {
    int a = 5, b = 7;
    //printf("The sum of %d and %d is: %d\n", a, b, add(a, b));
    printf("The mul of %d and %d is: %d\n", a, b, mul(a, b));

    return 0;
}
