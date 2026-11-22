#include <cstdio>
#include "message.h"
#include "add.h"
int main() { std::printf(MESSAGE); std::printf("2 + 3 = %d, twice(4) = %d\n", add(2, 3), twice(4)); return 0; }
