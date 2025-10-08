#!/bin/bash

# Script to take screenshots and generate content for README

echo "📸 Creating screenshot placeholders and documentation..."

# Create screenshots directory if not exists
mkdir -p screenshots

# Create placeholder for main app screenshot
cat > screenshots/main-app.md << 'EOF'
# Main Application Screenshot

![HCMC Map Application](main-app.png)

**Description**: The main HCMC map interface showing:
- Interactive Leaflet.js map
- District/Ward boundaries overlay
- Data visualization controls
- VnExpress branding
- Responsive design with Tailwind CSS

**URL**: http://localhost:3000/
EOF

# Create placeholder for API response screenshots
cat > screenshots/api-health.md << 'EOF'
# API Health Check Response

```bash
curl http://localhost:3000/api/health
```

**Response**:
```json
{
  "status": "OK",
  "message": "HCMC Map Server is running",
  "timestamp": "2025-10-08T08:45:00.000Z"
}
```
EOF

cat > screenshots/api-data.md << 'EOF'
# API Data Endpoints

## Wards Data
```bash
curl http://localhost:3000/api/data/wards
```

## Districts Data  
```bash
curl http://localhost:3000/api/data/districts
```

## Provinces Data
```bash
curl http://localhost:3000/api/data/provinces
```

## TSV Data
```bash
curl http://localhost:3000/api/data/data
```

**Response**: Returns TopoJSON or TSV data for map visualization
EOF

echo "✅ Screenshot documentation created in screenshots/ directory"
echo "📝 Ready to update README.md"