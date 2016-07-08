FROM qnib/alpn-nginx

ENV READY_FILE=/usr/share/nginx/html/ready.html \
    READY_DELAY=45
ADD etc/supervisord.d/check-update.ini /etc/supervisord.d/
ADD opt/qnib/check-update/bin/start.sh /opt/qnib/check-update/bin/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
EXPOSE 80
HEALTHCHECK --interval=10s --retries=6 --timeout=3s \
  CMD curl -sf http://localhost/ready.html || exit 1
