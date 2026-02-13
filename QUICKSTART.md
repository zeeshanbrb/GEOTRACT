# 🚀 Quick Start Guide

## Prerequisites

- Backend running at `http://localhost:8000`
- Modern web browser

## 1. Configure Backend URL

Edit `static/js/api-client.js`:

```javascript
this.baseUrl = "http://localhost:8000"; // Your backend URL
```

## 2. Start Frontend

### Option A: Python Server (Easiest)

```bash
./deploy.sh
# Or manually:
python3 -m http.server 8080
```

### Option B: Node.js

```bash
npx serve -p 8080
```

### Option C: PHP

```bash
php -S localhost:8080
```

## 3. Access the Application

Open your browser and navigate to:

- **Landing Page**: http://localhost:8080
- **Login**: http://localhost:8080/login.html
- **Dashboard**: http://localhost:8080/templates/dashboard/overview.html

## Default Login Credentials

```
Email: admin@geotrack.com
Password: Admin@123456
```

⚠️ **Change these in production!**

## 4. Production Deployment

### Nginx Configuration

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /var/www/geotrack-frontend;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /api/ {
        proxy_pass http://backend:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Apache Configuration

```apache
<VirtualHost *:80>
    ServerName yourdomain.com
    DocumentRoot /var/www/geotrack-frontend

    <Directory /var/www/geotrack-frontend>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ProxyPass /api/ http://backend:8000/api/
    ProxyPassReverse /api/ http://backend:8000/api/
</VirtualHost>
```

## Troubleshooting

### CORS Errors

Make sure backend CORS is configured:

```env
CORS_ORIGINS=http://localhost:8080,https://yourdomain.com
```

### API Connection Failed

1. Check backend is running: `curl http://localhost:8000/health`
2. Verify API URL in `api-client.js`
3. Check browser console for errors

### Pages Not Loading

1. Clear browser cache
2. Check file permissions
3. Verify all files are present

## Need Help?

- Check browser console (F12) for errors
- Review backend logs
- Ensure backend API is accessible
- Verify CORS configuration

---

Built with ❤️ for GeoTrack Analytics
