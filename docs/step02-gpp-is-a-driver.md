# Step 02 — `g++` is just a "driver": see which tools it calls

## Goal
In Step 01, errors came from `cc1plus`, `ld`, `collect2`... even though we only typed `g++`.
This step uses the `-v` (verbose) flag to **see** which programs g++ runs, and in what order.

## Changes in this commit
- **No code changes.** `main.cpp` stays the same.
- Only this doc file and one line in the README.

## Concepts
`g++` does not translate code by itself. It is a **driver**: it parses your arguments, then calls the tools one by one:

```
main.cpp ──[cc1plus.exe]──▶ xxx.s ──[as.exe]──▶ xxx.o ──[collect2.exe → ld]──▶ main.exe
           preprocess +    (assembly) assemble   (object)       link
           compile
```

| Tool | Job | Input → Output |
|---|---|---|
| `cc1plus.exe` | **Preprocess + compile** C++ (both done inside one tool) | `.cpp` → `.s` (assembly) |
| `as.exe` | **Assemble**: assembly → machine code | `.s` → `.o` (object file) |
| `collect2.exe` | Wrapper that calls `ld.exe` to **link** | `.o` + libraries → `.exe` |

The intermediate `.s` and `.o` files are created in the **Temp** folder (`C:\Users\...\AppData\Local\Temp\ccXXXX.s`)
and **deleted automatically** when the build finishes. That is why you normally never see them.

## Do it by hand (PowerShell, in the repo root)

### 1. See everything
```powershell
g++ -v main.cpp -o main.exe
```
Expect: about 47 lines. The important ones (starting with a single space — these are the commands actually executed):
```
 c:/mingw64/.../cc1plus.exe -quiet -v ... main.cpp ... -o C:\Users\...\Temp\ccTGNYTw.s
 c:/mingw64/.../as.exe -v -o C:\Users\...\Temp\cclAHDmL.o C:\Users\...\Temp\ccTGNYTw.s
 c:/mingw64/.../collect2.exe ... -o main.exe ... crt2.o crtbegin.o ... C:\Users\...\Temp\cclAHDmL.o -lstdc++ -lmingw32 ... crtend.o
```
(The `ccXXXX` names are random and change on every run.)

Also notice:
- The line `GNU C++17 ...` → by default g++ 12 compiles as **C++17**.
- The block `#include <...> search starts here:` → the directories g++ searches for headers (used in a later step about `#include`).
- The `.s` output is passed to `as`, and the `.o` output of `as` is passed to `collect2` — exactly as in the diagram.
- The linker receives many things we **did not write**: `crt2.o`, `crtbegin.o`, `-lstdc++`, `-lmsvcrt`, `-lkernel32`...
  These are the C runtime and standard libraries. `crt2.o` is what calls your `main()` (and looks for `WinMain` when there is no `main` — the Step 01 error).

### 2. Filter down to the 3 main commands
```powershell
g++ -v main.cpp -o main.exe 2>&1 | Select-String "cc1plus.exe -|as.exe -|collect2.exe -"
```
Expect: exactly 3 (very long) lines, in the order `cc1plus.exe` → `as.exe` → `collect2.exe`.

> Why `2>&1`? All `-v` output goes to **stderr**, not stdout.
> Without `2>&1`, `Select-String` receives nothing.

### 3. Print the commands without running them: `-###`
```powershell
del main.exe
g++ -### main.cpp -o main.exe
ls main.exe
```
Expect: the 3 commands are printed (arguments wrapped in double quotes), but `ls main.exe` reports **file not found**
→ `-###` is only a dry run, nothing is built. Run `g++ main.cpp -o main.exe` again to get the exe back.

## Errors you may hit at this step

| What you do | Message | Meaning |
|---|---|---|
| Typing `-V` (uppercase) instead of `-v` | `g++.exe: error: unrecognized command-line option '-V'` | Reported by the **driver** `g++.exe` itself; no tool was called yet. Flags are case-sensitive |
| `g++ -v main.cpp -o main.exe > log.txt` | `log.txt` is **empty**, text still shows on screen | The output goes to stderr. Use `2> log.txt` |
| Using `-###` and then running `.\main.exe` | `.\main.exe : The term '.\main.exe' is not recognized...` (if you deleted the exe) | `-###` does not create any file |
| Red `NativeCommandError` text when using `2>&1` in Windows PowerShell 5.1 | Not a build error | PowerShell 5.1 treats every stderr line as an "error record". The build still succeeded |

👉 Question for the next step: the `.s` and `.o` files get deleted — how can we keep them to look inside?
