# 🗺️ HCMC Map - Features & Screenshots

## ✨ Key Features

### 🌐 Web Application
- **Interactive Map**: Leaflet.js với zoom, pan, và các controls
- **Data Visualization**: Hiển thị ranh giới địa lý và dữ liệu thống kê
- **Responsive Design**: Tương thích mobile và desktop với Tailwind CSS
- **Offline Ready**: Tất cả assets được lưu cục bộ

### 🔧 Node.js Server
- **Static File Serving**: Phục vụ HTML, CSS, JS, images
- **RESTful API**: Endpoints cho dữ liệu TopoJSON và TSV
- **CORS Enabled**: Hỗ trợ cross-origin requests
- **Error Handling**: Xử lý lỗi có cấu trúc
- **Development Mode**: Auto-reload với nodemon

### 📊 Data Management
- **TopoJSON Format**: Dữ liệu địa lý tối ưu cho web
- **Multiple Levels**: Tỉnh/Thành phố, Quận/Huyện, Phường/Xã
- **Statistical Data**: File TSV với thông tin thống kê
- **API Access**: Truy cập dữ liệu qua HTTP endpoints

## 📸 Application Screenshots

### Main Interface
```
┌─────────────────────────────────────────────────────────────┐
│ 🗺️ HCMC Map - Interactive Visualization                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🏙️ Ho Chi Minh City Map                                    │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ ⊞ + -   🔍 Search   📍 Location   ⚙️ Settings      │    │
│  │                                                     │    │
│  │     ╭─────────╮    ╭──────────╮                    │    │
│  │     │District │    │ District │                    │    │
│  │     │   1     │    │    3     │                    │    │
│  │     ╰─────────╯    ╰──────────╯                    │    │
│  │                                                     │    │
│  │  ╭──────────╮   ╭─────────╮   ╭──────────╮        │    │
│  │  │District  │   │District │   │District  │        │    │
│  │  │    7     │   │    5    │   │    10    │        │    │
│  │  ╰──────────╯   ╰─────────╯   ╰──────────╯        │    │
│  │                                                     │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                             │
│  📊 Legend: [Population] [Area] [Density]                  │
│  🏢 VnExpress Logo                                          │
└─────────────────────────────────────────────────────────────┘
```

### Server Console
```bash
$ npm start

🚀 HCMC Map Server is running on http://localhost:3000
📍 Main app: http://localhost:3000/
🔍 Health check: http://localhost:3000/api/health
📊 Data API: http://localhost:3000/api/data/{wards|districts|provinces|data}

[Server Log]
GET / 200 15.234 ms - 2847
GET /assets/css/leaflet.css 200 2.345 ms - 12456
GET /assets/js/leaflet.js 200 4.567 ms - 145678
GET /Data/Wards.json 200 12.345 ms - 234567
GET /Data/Districts.json 200 8.901 ms - 156789
GET /assets/images/qtsc_logo_transparent.png 200 1.234 ms - 5678
```

### API Responses
```bash
# Health Check
$ curl http://localhost:3000/api/health
{
  "status": "OK",
  "message": "HCMC Map Server is running",
  "timestamp": "2025-10-08T08:45:23.456Z"
}

# Data Endpoint Example
$ curl http://localhost:3000/api/data/districts | head -10
{
  "type": "Topology",
  "objects": {
    "districts": {
      "type": "GeometryCollection",
      "geometries": [
        {
          "type": "Polygon",
          "properties": {
            "name": "Quận 1",
            ...
```

## 🚀 Quick Start Demo

1. **Clone & Setup**:
   ```bash
   git clone https://github.com/ducpt1012/spotlightvne.git
   cd spotlightvne
   npm install
   ```

2. **Start Server**:
   ```bash
   npm start
   # hoặc
   ./start-server.sh
   ```

3. **Test & Demo**:
   ```bash
   ./demo.sh
   ```

4. **Open Browser**: http://localhost:3000

## 🔗 Links & Resources

- **GitHub Repository**: https://github.com/ducpt1012/spotlightvne
- **API Documentation**: [API_DOCS.md](../API_DOCS.md)
- **Original Project**: https://spotlightvne.github.io/HCMCmap/
- **Leaflet.js**: https://leafletjs.com/
- **Tailwind CSS**: https://tailwindcss.com/