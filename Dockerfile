ARG VERSION=2019.05.08
FROM getsentry/jekyll-base:builder-${VERSION} AS builder
FROM getsentry/jekyll-base:runtime-${VERSION} AS runtime
CMD ["/bin/bash", "-c", "sed \"s/listen 80/listen ${PORT:-80}/\" /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
