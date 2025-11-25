# NiosII-FixedToFloat-Assembly
# Chuyển đổi số thực Q16.16 sang IEEE 754 (Nios II Assembly)


* **`FixedToFloat_Single.s`**: 
  * Chỉ chuyển đổi **1 số duy nhất** (khai báo cứng trong code).
  * Mục đích: Để test và hiểu thuật toán tách bit, tính số mũ.

* **`FixedToFloat_Array.s`**: 
  * Chuyển đổi **một mảng (array)** gồm nhiều số liên tiếp.
  * Sử dụng vòng lặp và con trỏ bộ nhớ để duyệt qua từng phần tử và ghi kết quả lại vào mảng đích.

## Ngôn ngữ & Kỹ thuật

* **Ngôn ngữ:** Nios II Assembly.
* **Input:** Số Fixed-Point Q16.16 (16 bit nguyên, 16 bit thập phân).
* **Output:** Số Floating-Point chuẩn IEEE 754 (32-bit).
* **Kỹ thuật:** Xử lý bit (Shift, And, Or), rẽ nhánh (Branch), vòng lặp (Loop).
