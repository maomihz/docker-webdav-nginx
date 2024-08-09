FROM alpine:3.20

LABEL org.opencontainers.image.source="https://github.com/maomihz/docker-webdav-nginx"

RUN apk --no-cache add \
      nginx \
      nginx-mod-http-dav-ext \
      nginx-mod-http-fancyindex && \
    mkdir -p /srv && \
    rm -f /etc/nginx/http.d/default.conf

EXPOSE 80
VOLUME ["/srv"]

COPY nginx.conf /etc/nginx/nginx.conf
COPY webdav.conf /etc/nginx/http.d/
CMD ["nginx", "-g", "daemon off;"]
