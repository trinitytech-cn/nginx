#!/bin/sh

set -e

ME=$(basename $0)

ENV_JS_FILE=${ENV_JS_FILE:-/usr/share/nginx/html/__env.js}
ENV_JS_JSON=${ENV_JS_JSON:-{}}
ENV_JS_VAR=${ENV_JS_VAR:-__env}

if [[ "$ENV_JS_DISABLE" == "true" ]]; then
  echo >&3 "$ME: ENV_JS_DISABLE is true, skipping generation of $ENV_JS_FILE"
  exit 0
fi

echo "window.${ENV_JS_VAR} = JSON.parse('${ENV_JS_JSON}')" > ${ENV_JS_FILE}
echo >&3 "$ME: generated $ENV_JS_FILE"

exit 0
