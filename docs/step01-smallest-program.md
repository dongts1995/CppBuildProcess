# Step 01 — The smallest C++ program

## Goal
Build your first `.exe` with **a single command**, without knowing yet what happens inside.
The following steps will take this command apart.

## Changes in this commit
- `main.cpp`: one line — `int main() { return 0; }`
- `.gitignore`: ignore `*.exe` files (build output, never committed)

## Concepts
- `main` is the **entry point** of the program.
- `return 0;` → this value becomes the **exit code** returned to the operating system.
  `0` = success, non-zero = failure (by convention).
- `g++ main.cpp -o main.exe` actually does 4 things in a row:
  **preprocess → compile → assemble → link**. For now we treat it as a black box.

## Do it by hand (PowerShell, in the repo root)

```powershell
g++ --version
```
Expect: first line like `g++.exe (MinGW-W64 x86_64-...) 12.1.0` (your version may differ).

```powershell
g++ main.cpp -o main.exe
```
Expect: **no output at all**. In the compiler world, silence = success.
Afterwards `ls` shows a new `main.exe` file.

```powershell
.\main.exe
echo $LASTEXITCODE
```
Expect: the program prints nothing; the `echo` line prints `0`.
<img width="966" height="182" alt="image" src="https://github.com/user-attachments/assets/ea5313af-908d-4f6d-900e-69fc465cf7dc" />


### Extra experiment
Change `return 0;` to `return 7;`, rebuild, run again → `$LASTEXITCODE` prints `7`.
(Remember to change it back to `0` afterwards.)

## Errors you may hit at this step

| What you do | Error message | Meaning |
|---|---|---|
| g++ not installed / not on PATH | `g++ : The term 'g++' is not recognized...` | PowerShell cannot find g++ |
| Typo in the file name: `g++ mian.cpp ...` | `cc1plus.exe: fatal error: mian.cpp: No such file or directory` | `cc1plus` is the **actual compiler** inside g++ — the first hint that g++ is just a "driver" calling other tools |
| Missing `;`: `return 0 }` | `main.cpp:1:22: error: expected ';' before '}' token` | A **compile** (syntax) error. Format is `file:line:column` |
| Misspelled `int mian()` | `ld.exe: ... undefined reference to 'WinMain'` + `collect2.exe: error: ld returned 1 exit status` | A **link** error! The code is valid so it compiles, but the linker (`ld`) cannot find the entry point. MinGW mentions `WinMain` instead of `main` because the Windows runtime looks for `main`, and falls back to `WinMain` |
| Rebuilding while `main.exe` is still running | `ld.exe: cannot open output file main.exe: Permission denied` | Windows locks a running executable |

👉 Notice: a single `g++` command, yet the errors come from **different tools** (`cc1plus`, `ld`, `collect2`).
That is the topic of the next steps.
