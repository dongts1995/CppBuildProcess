#include <cstdio>
#ifdef VERBOSE
#define MESSAGE "Hello (verbose build)\n"
#else
#define MESSAGE "Hello\n"
#endif
int main() { std::printf(MESSAGE); return 0; }
