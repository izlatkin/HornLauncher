extern int __VERIFIER_nondet_int();
#include "testgen.h"
//#include <printf.h>

//
// Created by Ilya Zlatkin on 05.07.2021.
//
//[2,0,-1],[10,4,5],[2,0,-1]
int main() {
    int x = __VERIFIER_nondet_int();
    int y = __VERIFIER_nondet_int();
    int z = __VERIFIER_nondet_int();
    while (1) {
        if (x + y >= 5)
            y ++;
        else
            x ++;
        if (y <= 5) {
            z++;
            y--;
        }else
        if (x > y)
            y ++; // this is unreachable
        else
            x = 0;
        if (z == 0)
            break ;
        //printf("%d\n",1);
    }
}