FROM qnib/alpn-nginx

ADD etc/supervisord.d/check-update.ini /etc/supervisord.d/
ADD opt/qnib/check-update/bin/start.sh /opt/qnib/check-update/bin/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
ENV READY_FILE=/usr/share/nginx/html/ready.html \
    READY_DELAY=60
ADD opt/qnib/nginx/bin/check.sh /opt/qnib/nginx/bin/
HEALTHCHECK --interval=2s --retries=90 --timeout=1s \
  CMD /opt/qnib/nginx/bin/check.sh
