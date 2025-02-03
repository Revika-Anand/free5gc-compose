FROM alpine:3.15

LABEL description="Free5GC open source 5G Core Network" \
    version="Stage 3"

# Set working dir
WORKDIR /irouter

RUN apk update && \
    apk add tshark iproute2 iputils tcpdump net-tools curl
