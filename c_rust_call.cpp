#include "Inc/rust_add.h"

int main(void)
{
    unsigned char x = 3;
    unsigned char y = 13;
    unsigned char z;

    z = add(x,y);

    return z;

}