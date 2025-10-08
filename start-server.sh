#!/bin/bash

# Script to start HCMC Map Node.js Server

echo "🚀 Starting HCMC Map Node.js Server..."
echo "📍 Server will be available at: http://localhost:3000"
echo "🔍 Health check: http://localhost:3000/api/health"
echo ""

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Start the server
npm start