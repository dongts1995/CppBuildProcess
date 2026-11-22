# Step 01 — Chương trình C++ nhỏ nhất

## Mục tiêu
Build được file `.exe` đầu tiên bằng **một lệnh duy nhất**, chưa cần biết bên trong
có những giai đoạn nào. Các step sau sẽ "mổ xẻ" lệnh này ra.

## Thay đổi trong commit này
- `main.cpp`: 1 dòng — `int main() { return 0; }`
- `.gitignore`: bỏ qua file `*.exe` (sản phẩm build, không commit)

## Kiến thức
- `main` là **điểm vào** (entry point) của chương trình.
- `return 0;` → giá trị này thành **exit code** gửi về cho hệ điều hành.
  `0` = thành công, khác 0 = lỗi (quy ước).
- `g++ main.cpp -o main.exe` thực ra làm 4 việc liên tiếp:
  **preprocess → compile → assemble → link**. Hiện tại ta coi nó là hộp đen.

## Tự làm bằng tay (PowerShell, tại thư mục gốc repo)

```powershell
g++ --version
```
Expect: dòng đầu dạng `g++.exe (MinGW-W64 x86_64-...) 12.1.0` (version có thể khác).

```powershell
g++ main.cpp -o main.exe
```
Expect: **không in gì cả**. Trong thế giới compiler, im lặng = thành công.
Sau đó `ls` sẽ thấy file `main.exe` mới xuất hiện.

```powershell
.\main.exe
echo $LASTEXITCODE
```
Expect: chương trình không in gì; dòng `echo` in ra `0`.

### Thử nghiệm thêm
Sửa `return 0;` thành `return 7;`, build lại, chạy lại → `$LASTEXITCODE` in `7`.
(Nhớ sửa về `0` sau khi thử.)

## Các lỗi có thể gặp ở step này

| Bạn làm gì | Thông báo lỗi | Ý nghĩa |
|---|---|---|
| Chưa cài / chưa thêm g++ vào PATH | `g++ : The term 'g++' is not recognized...` | PowerShell không tìm thấy g++ |
| Gõ sai tên file: `g++ mian.cpp ...` | `cc1plus.exe: fatal error: mian.cpp: No such file or directory` | `cc1plus` là **compiler thật sự** bên trong g++ — gợi ý đầu tiên rằng g++ chỉ là "driver" gọi các tool khác |
| Quên dấu `;`: `return 0 }` | `main.cpp:1:22: error: expected ';' before '}' token` | Lỗi **compile** (cú pháp). Định dạng `file:dòng:cột` |
| Viết sai tên `int mian()` | `ld.exe: ... undefined reference to 'WinMain'` + `collect2.exe: error: ld returned 1 exit status` | Lỗi **link**! Code hợp lệ nên compile qua, nhưng linker (`ld`) không tìm thấy điểm vào. MinGW báo `WinMain` thay vì `main` vì runtime Windows tìm `main`, không có thì tìm `WinMain` |
| Chạy `.\main.exe` khi exe đang mở ở chỗ khác rồi build lại | `ld.exe: cannot open output file main.exe: Permission denied` | Windows khoá file đang chạy |

👉 Để ý: chỉ một lệnh `g++` nhưng lỗi đến từ **các tool khác nhau** (`cc1plus`, `ld`, `collect2`).
Đó chính là chủ đề của các step tiếp theo.
