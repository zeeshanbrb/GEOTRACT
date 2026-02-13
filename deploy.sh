#!/bin/bash
# GeoTrack Analytics Frontend Deployment Script

echo "🚀 Deploying GeoTrack Analytics Frontend..."

# Check if backend URL is configured
if grep -q "baseUrl = ''" static/js/api-client.js; then
    echo "⚠️  Please configure backend URL in static/js/api-client.js"
    echo "   Change: this.baseUrl = '' to this.baseUrl = 'http://your-backend:8000'"
fi

# Start local server
echo "✓ Starting local development server..."
echo "📱 Frontend will be available at: http://localhost:8080"
echo "🔗 Backend should be running at: http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

python3 -m http.server 8080
