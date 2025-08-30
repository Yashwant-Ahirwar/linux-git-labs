FROM alpine:3.20
RUN apk add --no-cache bash iproute2
COPY check-8080.sh /usr/local/bin/check-8080.sh
RUN chmod +x /usr/local/bin/check-8080.sh
ENTRYPOINT ["/usr/local/bin/check-8080.sh"]
