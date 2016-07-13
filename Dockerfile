FROM qnib/alpn-nginx

ADD etc/supervisord.d/check-update.ini /etc/supervisord.d/
ADD opt/qnib/check-update/bin/start.sh /opt/qnib/check-update/bin/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
EXPOSE 80
ENV READY_FILE=/usr/share/nginx/html/ready.html \
    READY_DELAY=10
HEALTHCHECK --interval=2s --retries=15 --timeout=1s \
  CMD curl -sf http://localhost/ready.html || exit 1
