# Static site image built on nginx
FROM nginx:1.27-alpine

# Remove default nginx content before copying the static site.
RUN rm -rf /usr/share/nginx/html/*

# Copy the repository (filtered by .dockerignore) into the web root.
COPY . /usr/share/nginx/html

# Surface favicons from repository root for legacy paths.
RUN cp /usr/share/nginx/html/favicon.ico /usr/share/nginx/html/public/favicon.ico || true \
 && cp /usr/share/nginx/html/favicon-180x180.png /usr/share/nginx/html/public/favicon-180x180.png || true \
 && cp /usr/share/nginx/html/favicon-192x192.png /usr/share/nginx/html/public/favicon-192x192.png || true \
 && cp /usr/share/nginx/html/favicon-512x512.png /usr/share/nginx/html/public/favicon-512x512.png || true

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
