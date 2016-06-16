FROM qnib/alpn-nginx

ENV READY_FILE=/usr/share/nginx/html/ready.html \
    READY_DELAY=45
ADD etc/supervisord.d/check-update.ini /etc/supervisord.d/
ADD opt/qnib/check-update/bin/start.sh /opt/qnib/check-update/bin/
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/
