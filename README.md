# docker-httpcheck
Image that can be controlled via ENV to serve different endpoitns via NGINX


## Check the compose file

```
$ docker ps --format='{{.Names}}\t{{.Status}}'
good    Up About a minute (healthy)
fail    Up About a minute (unhealthy)
```
