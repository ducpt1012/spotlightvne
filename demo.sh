#!/bin/bash

# Demo script để test HCMC Map Node.js server

echo "🚀 HCMC Map Server Demo & Testing"
echo "=================================="
echo

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}1. Checking if server is running...${NC}"
if curl -s http://localhost:3000/api/health > /dev/null; then
    echo -e "${GREEN}✅ Server is running!${NC}"
else
    echo -e "${YELLOW}⚠️  Server not running. Starting server...${NC}"
    echo "Run: npm start (in another terminal)"
    exit 1
fi

echo
echo -e "${BLUE}2. Testing Health Check API...${NC}"
echo "GET http://localhost:3000/api/health"
curl -s http://localhost:3000/api/health | python3 -m json.tool
echo

echo
echo -e "${BLUE}3. Testing Data APIs...${NC}"

echo -e "${YELLOW}📊 Wards data (first 5 lines):${NC}"
curl -s http://localhost:3000/api/data/wards | head -5
echo "..."

echo
echo -e "${YELLOW}📊 Districts data (first 5 lines):${NC}"
curl -s http://localhost:3000/api/data/districts | head -5
echo "..."

echo
echo -e "${YELLOW}📊 Provinces data (first 5 lines):${NC}"
curl -s http://localhost:3000/api/data/provinces | head -5
echo "..."

echo
echo -e "${YELLOW}📊 TSV data (first 3 lines):${NC}"
curl -s http://localhost:3000/api/data/data | head -3
echo "..."

echo
echo -e "${BLUE}4. Testing Main Application...${NC}"
echo "Opening main app in browser..."
if command -v open > /dev/null; then
    open http://localhost:3000
elif command -v xdg-open > /dev/null; then
    xdg-open http://localhost:3000
else
    echo "Please open http://localhost:3000 in your browser"
fi

echo
echo -e "${GREEN}🎉 Demo completed!${NC}"
echo "Main app: http://localhost:3000"
echo "API docs: See API_DOCS.md"