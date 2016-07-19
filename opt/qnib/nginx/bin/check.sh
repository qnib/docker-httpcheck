#!/bin/bash

curl -sf http://localhost:${NGINX_HTTP_PORT}/ready.html || exit 1
