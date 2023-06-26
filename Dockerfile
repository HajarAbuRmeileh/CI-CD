FROM nginx
COPY index.html  /usr/share/nginx/html/index.html
COPY MyCode.py  /usr/share/nginx/code/MyCode.py
# Expose port 8080 for the API
EXPOSE 8080