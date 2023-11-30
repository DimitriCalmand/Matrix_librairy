#include <stdio.h>
#include "Matrix.h"
int main()
{
    Matrix* x = Init_Matrix((int[]){3, 2}, 2, "range");
    x->Print(x);
    x->Free(x);
}
