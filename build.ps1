# Minimal incremental build: recompile a source only if its .o is missing or older than the source.
function Build-Object($compiler, $src, $obj) {
  if ((Test-Path $obj) -and (Get-Item $obj).LastWriteTime -ge (Get-Item $src).LastWriteTime) {
    Write-Host "up to date: $obj"; return
  }
  Write-Host "compiling:  $src"
  & $compiler -Iinclude -c $src -o $obj
  if ($LASTEXITCODE -ne 0) { exit 1 }
}
Build-Object g++ main.cpp main.o
Build-Object g++ add.cpp add.o
Build-Object gcc sub.c sub.o
Write-Host "linking:    main.exe"
g++ main.o add.o sub.o -o main.exe
if ($LASTEXITCODE -ne 0) { exit 1 }
