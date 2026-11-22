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
9. [#define, #ifdef, -D](docs/step09-define.md) — the preprocessor replaces and removes text
10. [Your own header and -I](docs/step10-include-path.md) — `"..."` vs `<...>`, include search path
11. [Separate compilation](docs/step11-separate-compilation.md) — `add.cpp`, declaration vs definition, link 2 objects
12. [Declaration in a header](docs/step12-header-declaration.md) — `add.h`, why `add.cpp` includes its own header
13. [ODR, inline, #pragma once](docs/step13-odr-inline-pragma-once.md) — definitions in headers, `multiple definition` vs `redefinition`
14. [Name mangling and extern "C"](docs/step14-name-mangling-extern-c.md) — `_Z3addii`, `c++filt`, linking a C file
15. [Static library](docs/step15-static-library.md) — `ar rcs libmath.a`, `-L. -lmath`, only needed members are linked
16. [Link order](docs/step16-link-order.md) — `ld` reads left to right, `-Wl,-Map`, `--start-group`
17. [Dynamic library (DLL)](docs/step17-dynamic-library-dll.md) — `-shared`, import/export tables, "DLL not found" at load time
