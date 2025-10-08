# Hướng dẫn sử dụng bản đồ HCMCmap

## 📸 Screenshots & Demo

### 🗺️ Giao diện chính
Ứng dụng bản đồ HCMC với giao diện tương tác:
- Bản đồ Leaflet.js với khả năng zoom, pan
- Overlay các ranh giới quận/huyện, phường/xã
- Hiển thị dữ liệu thống kê theo vùng địa lý
- Giao diện responsive với Tailwind CSS

### 🚀 Server Console Output
```bash
🚀 HCMC Map Server is running on http://localhost:3000
📍 Main app: http://localhost:3000/
🔍 Health check: http://localhost:3000/api/health
📊 Data API: http://localhost:3000/api/data/{wards|districts|provinces|data}
```

### 🔌 API Examples
**Health Check:**
```bash
$ curl http://localhost:3000/api/health
{
  "status": "OK",
  "message": "HCMC Map Server is running",
  "timestamp": "2025-10-08T08:45:00.000Z"
}
```

**Data Endpoints:**
```bash
$ curl http://localhost:3000/api/data/wards      # Dữ liệu phường/xã
$ curl http://localhost:3000/api/data/districts  # Dữ liệu quận/huyện  
$ curl http://localhost:3000/api/data/provinces  # Dữ liệu tỉnh/thành phố
$ curl http://localhost:3000/api/data/data       # File dữ liệu TSV
```

## Giới thiệu
Dự án này là bản sao ngoại tuyến của trang https://spotlightvne.github.io/HCMCmap/. Toàn bộ mã nguồn, dữ liệu TopoJSON/TSV và các thư viện phụ thuộc đã được tải về cục bộ để bạn có thể chạy trang ở chế độ offline (trừ lớp nền bản đồ trực tuyến, xem thêm phần ghi chú).

Kho lưu trữ GitHub gốc của dự án (đang được đồng bộ với thư mục này) nằm tại:  
https://github.com/ducpt1012/spotlightvne

## Cấu trúc thư mục
- `HCMCmap/index.html`: Trang chính của ứng dụng.
- `HCMCmap/Data/`: Chứa các tệp dữ liệu `Wards.json`, `Districts.json`, `Provinces.json` và `Data.tsv`.
- `HCMCmap/assets/`: Chứa các thư viện và tài nguyên tĩnh đã được tải về (Tailwind, Leaflet, Font Awesome, hình ảnh, phông chữ...).

## Cách chạy trên máy cục bộ

### Phương pháp 1: Sử dụng Node.js Server (Khuyến nghị)
1. Cài đặt Node.js dependencies:
   ```bash
   npm install
   ```
2. Chạy server:
   ```bash
   npm start
   ```
   Hoặc để development với auto-reload:
   ```bash
   npm run dev
   ```
3. Mở trình duyệt tới địa chỉ `http://localhost:3000`.

### Phương pháp 2: Sử dụng Python Server (Cũ)
1. Mở terminal tại thư mục gốc của repository.
2. Chạy máy chủ tĩnh, ví dụ bằng Python:
   ```bash
   cd HCMCmap
   python3 -m http.server 8080
   ```
3. Mở trình duyệt tới địa chỉ `http://localhost:8080/index.html`.

### Kiểm tra
4. Kiểm tra bảng điều khiển (DevTools) để bảo đảm không còn lỗi tải dữ liệu.
5. Truy cập API endpoints (chỉ với Node.js server):
   - Health check: `http://localhost:3000/api/health`
   - Data API: `http://localhost:3000/api/data/wards` (hoặc districts, provinces, data)

## Node.js Server Features
Server Node.js cung cấp:
- ✅ Static file serving cho tất cả assets
- ✅ RESTful API endpoints cho dữ liệu bản đồ
- ✅ CORS support
- ✅ Error handling
- ✅ Health check endpoint
- ✅ Development mode với auto-reload

Chi tiết API documentation: [API_DOCS.md](./API_DOCS.md)

## Ghi chú
- Khi máy không có Internet, lớp nền bản đồ (tile layer) sẽ tự động chuyển sang hình nền trống (`assets/images/blank-tile.png`). Nếu muốn hiển thị bản đồ nền ngoại tuyến, bạn cần tự chuẩn bị và cấu hình bộ tile offline phù hợp.
- Cảnh báo màu vàng về `cdn.tailwindcss.com` chỉ nhắc rằng bản build CDN không phù hợp cho môi trường production; điều này không ảnh hưởng tới việc chạy thử offline.
- Bạn có thể chỉnh sửa code và tải lại trang để xem thay đổi ngay lập tức.
- Node.js server cung cấp API endpoints để truy xuất dữ liệu một cách có cấu trúc hơn so với Python server.

## 🌐 Demo & Testing

### Live Demo URLs (khi server đang chạy)
- **Main App**: [http://localhost:3000](http://localhost:3000)
- **Health Check**: [http://localhost:3000/api/health](http://localhost:3000/api/health)
- **API Docs**: [API_DOCS.md](./API_DOCS.md)

### Quick Test Commands
```bash
# Khởi động server
npm start

# Test health endpoint
curl http://localhost:3000/api/health

# Test data endpoints
curl http://localhost:3000/api/data/wards | head -20
curl http://localhost:3000/api/data/districts | head -20

# Mở ứng dụng
open http://localhost:3000
```

### Screenshots & Documentation
- **Features & Screenshots**: [FEATURES.md](./FEATURES.md)
- **Screenshots Summary**: [screenshots/SUMMARY.md](./screenshots/SUMMARY.md)
- **API Documentation**: [API_DOCS.md](./API_DOCS.md)  
- **Screenshots Examples**: [screenshots/README.md](./screenshots/README.md)

---

*🎯 Bản sao offline của [SpotlightVNE HCMC Map](https://spotlightvne.github.io/HCMCmap/)*
