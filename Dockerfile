FROM qnib/alpn-nginx

EXPOSE 8080
ADD etc/supervisord.d/check-update.ini /etc/supervisord.d/
ADD opt/qnib/check-update/bin/start.sh /opt/qnib/check-update/bin/
ADD etc/consul-templates/nginx/default.conf.ctmpl /etc/consul-templates/nginx/
ADD opt/qnib/nginx/bin/check.sh /opt/qnib/nginx/bin/
ENV READY_FILE=/usr/share/nginx/html/ready.html \
    READY_DELAY=20
HEALTHCHECK --interval=2s --retries=30 --timeout=1s \
  CMD /opt/qnib/nginx/bin/check.sh
