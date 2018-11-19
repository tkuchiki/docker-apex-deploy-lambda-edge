FROM golang:1.11.2-alpine AS build

ENV GO111MODULE="on"

RUN apk update && apk add --no-cache git mercurial make perl gcc musl-dev && mkdir -p /go/src/github.com/apex
RUN git clone https://github.com/apex/apex /go/src/github.com/apex/apex

WORKDIR /go/src/github.com/apex/apex
RUN perl -i -ne '/(APEX_FUNCTION_NAME|LAMBDA_FUNCTION_NAME)/ or print' function/function.go
RUN cd cmd/apex && go build

FROM alpine:3.8

COPY --from=build /go/src/github.com/apex/apex/cmd/apex/apex /usr/local/bin/apex

RUN apk add --no-cache ca-certificates && update-ca-certificates && mkdir -p /opt/apex
WORKDIR /opt/apex
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    SSL_CERT_DIR=/etc/ssl/certs

CMD ["version"]
ENTRYPOINT ["/usr/local/bin/apex"]
