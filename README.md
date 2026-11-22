# CppBuildProcess

Learning the C++ build process through small commits. Each step has one file in [docs/](docs/).
Toolchain: MinGW-w64 g++ on Windows (PowerShell).

## Steps
1. [The smallest program](docs/step01-smallest-program.md) — build with a single `g++` command
2. [g++ is a driver](docs/step02-gpp-is-a-driver.md) — `g++ -v` reveals the tools `cc1plus`, `as`, `collect2`
3. [Keep intermediate files](docs/step03-save-temps.md) — `-save-temps` keeps `.ii`, `.s`, `.o`
4. [Run each stage by hand](docs/step04-stages-by-hand.md) — `-E`, `-S`, `-c`, then link
5. [Call the assembler yourself](docs/step05-as-by-hand.md) — `as main.s -o main.o`, no g++
6. [Call the linker yourself](docs/step06-ld-undefined-reference.md) — `ld`, symbols, relocations, `undefined reference`
7. [A complete ld command](docs/step07-ld-full-command.md) — `crt2.o`, `crtbegin.o`, libraries: `main.exe` without g++
8. [#include](docs/step08-include.md) — `<cstdio>` turns 2 lines into 1251, `-H` include tree
