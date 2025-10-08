# HCMC Map Node.js Server API Documentation

## Tổng quan
Server Node.js này cung cấp cả static file serving và RESTful API cho ứng dụng bản đồ HCMC.

## Base URL
```
http://localhost:3000
```

## Endpoints

### 1. Trang chính
- **GET** `/`
- **Mô tả**: Trả về trang index.html của ứng dụng bản đồ
- **Response**: HTML page

### 2. Health Check
- **GET** `/api/health`
- **Mô tả**: Kiểm tra trạng thái server
- **Response**:
```json
{
  "status": "OK",
  "message": "HCMC Map Server is running",
  "timestamp": "2025-10-08T01:40:00.000Z"
}
```

### 3. Lấy dữ liệu bản đồ
- **GET** `/api/data/{type}`
- **Mô tả**: Lấy dữ liệu TopoJSON/TSV cho bản đồ
- **Parameters**:
  - `type`: Loại dữ liệu cần lấy
    - `wards` - Dữ liệu phường/xã (Wards.json)
    - `districts` - Dữ liệu quận/huyện (Districts.json) 
    - `provinces` - Dữ liệu tỉnh/thành phố (Provinces.json)
    - `data` - Dữ liệu thống kê (Data.tsv)

**Ví dụ**:
```bash
curl http://localhost:3000/api/data/wards
curl http://localhost:3000/api/data/districts
curl http://localhost:3000/api/data/provinces
curl http://localhost:3000/api/data/data
```

### 4. Static Files
- **GET** `/assets/*`
- **Mô tả**: Phục vụ các file tĩnh (CSS, JS, images, fonts)
- **Ví dụ**:
  - `/assets/css/leaflet.css`
  - `/assets/js/leaflet.js`
  - `/assets/images/qtsc_logo_transparent.png`

## Cách sử dụng

### Khởi động server
```bash
# Cài đặt dependencies (chỉ cần chạy 1 lần)
npm install

# Khởi động server
npm start

# Hoặc chạy development mode với auto-reload
npm run dev

# Hoặc sử dụng script tiện lợi
./start-server.sh
```

### Test API
```bash
# Health check
curl http://localhost:3000/api/health

# Lấy dữ liệu wards
curl http://localhost:3000/api/data/wards

# Mở ứng dụng trong browser
open http://localhost:3000
```

## Error Handling

### 400 Bad Request
```json
{
  "error": "Invalid data type"
}
```

### 404 Not Found
```json
{
  "error": "Route not found"
}
```

### 500 Internal Server Error
```json
{
  "error": "Internal server error"
}
```

## Cấu hình
- **Port**: 3000 (có thể thay đổi bằng biến môi trường `PORT`)
- **CORS**: Enabled cho tất cả origins
- **Static files**: Phục vụ từ thư mục `HCMCmap/`

## Mở rộng
Server này có thể dễ dàng mở rộng thêm:
- Authentication/Authorization
- Database integration
- Real-time features với WebSocket
- Caching mechanisms
- Rate limiting
- More RESTful endpoints