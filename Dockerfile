ARG NGINX_VERSION

FROM golang:1.18.5-alpine AS sprig-builder

COPY sprig /sprig

WORKDIR /sprig

ENV GO111MODULE on

RUN go build -o sprig sprig/cmd/sprig


FROM nginx:${NGINX_VERSION}

COPY --from=sprig-builder /sprig/sprig /bin/sprig
RUN chmod +x /bin/sprig

COPY 30-sprig-on-templates.sh /docker-entrypoint.d
COPY 40-write-env-js.sh /docker-entrypoint.d
COPY default.conf.tmpl /etc/nginx/templates/default.conf.tmpl