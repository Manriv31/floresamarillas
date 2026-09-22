FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY carta.js /usr/share/nginx/html/carta.js

# Coolify: en "Ports Exposes" pon 80
EXPOSE 80 3000

HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:80/health >/dev/null || wget -qO- http://127.0.0.1:3000/health >/dev/null || exit 1
