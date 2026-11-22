# CppBuildProcess

Learning the C++ build process through small commits. Each step has one file in [docs/](docs/).
Toolchain: MinGW-w64 g++ on Windows (PowerShell).

## Steps
1. [The smallest program](docs/step01-smallest-program.md) — build with a single `g++` command
2. [g++ is a driver](docs/step02-gpp-is-a-driver.md) — `g++ -v` reveals the tools `cc1plus`, `as`, `collect2`
3. [Keep intermediate files](docs/step03-save-temps.md) — `-save-temps` keeps `.ii`, `.s`, `.o`
