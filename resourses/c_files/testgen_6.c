extern int __VERIFIER_nondet_int();
#include "testgen.h"
int main( ) {
    int x = __VERIFIER_nondet_int();
    int y = __VERIFIER_nondet_int();
    while (1) {
        if (x >= 5 || y == 0 && (x + y) % 2 == 1){
            y ++;
        }
        if (x + y == 100000 || x + y == - 5000){
            break;
        }
         x++;

    }
    return 0;
}