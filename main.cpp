#include <cstdio>
#include "message.h"
#include "add.h"
#include "sub.h"
int main() { std::printf(MESSAGE); std::printf("2 + 3 = %d, twice(4) = %d, 5 - 3 = %d\n", add(2, 3), twice(4), sub(5, 3)); return 0; }
