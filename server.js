const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files from HCMCmap directory
app.use(express.static(path.join(__dirname, 'HCMCmap')));

// API Routes
app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    message: 'HCMC Map Server is running',
    timestamp: new Date().toISOString()
  });
});

// API endpoint to get map data
app.get('/api/data/:type', (req, res) => {
  const { type } = req.params;
  const dataPath = path.join(__dirname, 'HCMCmap', 'Data');
  
  try {
    let fileName;
    switch(type.toLowerCase()) {
      case 'wards':
        fileName = 'Wards.json';
        break;
      case 'districts':
        fileName = 'Districts.json';
        break;
      case 'provinces':
        fileName = 'Provinces.json';
        break;
      case 'data':
        fileName = 'Data.tsv';
        break;
      default:
        return res.status(400).json({ error: 'Invalid data type' });
    }
    
    const filePath = path.join(dataPath, fileName);
    res.sendFile(filePath);
  } catch (error) {
    res.status(500).json({ error: 'Error reading data file' });
  }
});

// Serve the main page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'HCMCmap', 'index.html'));
});

// Handle 404
app.use((req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

// Error handling middleware
app.use((error, req, res, next) => {
  console.error('Server error:', error);
  res.status(500).json({ error: 'Internal server error' });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 HCMC Map Server is running on http://localhost:${PORT}`);
  console.log(`📍 Main app: http://localhost:${PORT}/`);
  console.log(`🔍 Health check: http://localhost:${PORT}/api/health`);
  console.log(`📊 Data API: http://localhost:${PORT}/api/data/{wards|districts|provinces|data}`);
});

module.exports = app;