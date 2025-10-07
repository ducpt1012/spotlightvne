# Hướng dẫn sử dụng bản đồ HCMCmap

## Giới thiệu
Dự án này là bản sao ngoại tuyến của trang https://spotlightvne.github.io/HCMCmap/. Toàn bộ mã nguồn, dữ liệu TopoJSON/TSV và các thư viện phụ thuộc đã được tải về cục bộ để bạn có thể chạy trang ở chế độ offline (trừ lớp nền bản đồ trực tuyến, xem thêm phần ghi chú).

Kho lưu trữ GitHub gốc của dự án (đang được đồng bộ với thư mục này) nằm tại:  
https://github.com/ducpt1012/spotlightvne

## Cấu trúc thư mục
- `HCMCmap/index.html`: Trang chính của ứng dụng.
- `HCMCmap/Data/`: Chứa các tệp dữ liệu `Wards.json`, `Districts.json`, `Provinces.json` và `Data.tsv`.
- `HCMCmap/assets/`: Chứa các thư viện và tài nguyên tĩnh đã được tải về (Tailwind, Leaflet, Font Awesome, hình ảnh, phông chữ...).

## Cách chạy trên máy cục bộ
1. Mở terminal tại thư mục gốc của repository.
2. Chạy máy chủ tĩnh, ví dụ bằng Python:
   ```bash
   cd HCMCmap
   python3 -m http.server 8080
   ```
3. Mở trình duyệt tới địa chỉ `http://localhost:8080/index.html`.
4. Kiểm tra bảng điều khiển (DevTools) để bảo đảm không còn lỗi tải dữ liệu.

## Ghi chú
- Khi máy không có Internet, lớp nền bản đồ (tile layer) sẽ tự động chuyển sang hình nền trống (`assets/images/blank-tile.png`). Nếu muốn hiển thị bản đồ nền ngoại tuyến, bạn cần tự chuẩn bị và cấu hình bộ tile offline phù hợp.
- Cảnh báo màu vàng về `cdn.tailwindcss.com` chỉ nhắc rằng bản build CDN không phù hợp cho môi trường production; điều này không ảnh hưởng tới việc chạy thử offline.
- Bạn có thể chỉnh sửa code và tải lại trang để xem thay đổi ngay lập tức.
