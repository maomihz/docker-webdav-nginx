FROM alpine:3.20

ARG DEBIAN_FRONTEND=noninteractive

RUN apk --no-cache add nginx \
      nginx-mod-http-dav-ext \
      nginx-mod-http-fancyindex && \
    mkdir -p "/srv" && \
    rm /etc/nginx/http.d/default.conf

EXPOSE 80
VOLUME [ "/srv" ]

COPY nginx.conf /etc/nginx/
COPY webdav.conf /etc/nginx/http.d/
CMD ["nginx", "-g", "daemon off;"]
