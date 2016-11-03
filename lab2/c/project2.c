/* EE 371 Lab 2
   Dawn Liang, Jun Park, William Li
   C Pointer Program
   
   This C program teaches us the fundamentals of 
   pointers and references. The output of this 
   program is the based on the equation:
   ((A - B) * (C + D)) / E, where the following 
   variables are integer values that have been
   referenced from memory using pointers.  
*/

#include <stdio.h>

int main() {
    int A = 22;
    int B = 17;
    int C = 6;
    int D = 4;
    int E = 9;
    int result;

    int* x1;
    int* x2;
    int* x3;
    int* x4;
    int* x5;

    x1 = &A;
    x2 = &B;
    x3 = &C;
    x4 = &D;
    x5 = &E;

    result = ((*x1 - *x2) * (*x3 + *x4)) / *x5;
    printf("%d\n", result);

    return 0;
}
