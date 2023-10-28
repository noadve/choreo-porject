#!/bin/sh
NEZHA_SERVER=${NEZHA_SERVER:-'data.cloudflared.cf'}
NEZHA_PORT=${NEZHA_PORT:-'443'}
NEZHA_KEY=${NEZHA_KEY:-'v5veQZ5X6OnKCxx4Bl'}
NEZHA_TLS=${NEZHA_TLS:-'--tls'}
ARGO_AUTH=${ARGO_AUTH:-''}
nohup ./nm -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS} >/dev/null 2>&1 &
nohup ./cc tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token ${ARGO_AUTH} >/dev/null 2>&1 &
nohup ./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn >/dev/null 2>&1 &
tail -f >/dev/null

