FROM nginx
COPY index.html  /usr/share/nginx/html/index.html

# Expose port 8080 for the API
EXPOSE 8080