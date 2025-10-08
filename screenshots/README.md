# Screenshots cho HCMC Map Project

## 1. Giao diện chính ứng dụng
![Main App Interface](screenshots/main-app-placeholder.png)

*Giao diện chính của ứng dụng bản đồ HCMC với Leaflet.js*

## 2. Server khởi động thành công
```
🚀 HCMC Map Server is running on http://localhost:3000
📍 Main app: http://localhost:3000/
🔍 Health check: http://localhost:3000/api/health
📊 Data API: http://localhost:3000/api/data/{wards|districts|provinces|data}
```

## 3. API Response Examples

### Health Check
```bash
curl http://localhost:3000/api/health
```
```json
{
  "status": "OK",
  "message": "HCMC Map Server is running",
  "timestamp": "2025-10-08T08:45:00.000Z"
}
```

### Data API
```bash
curl http://localhost:3000/api/data/wards
```
*Returns: TopoJSON data for HCMC wards*

### Server Console
```
GET / 200 15.234 ms - 2847
GET /assets/css/leaflet.css 200 2.345 ms - 12456
GET /assets/js/leaflet.js 200 4.567 ms - 145678
GET /Data/Wards.json 200 12.345 ms - 234567
```