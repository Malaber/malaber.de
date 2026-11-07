FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html favicon.svg 4041.jpg /usr/share/nginx/html/

EXPOSE 80
