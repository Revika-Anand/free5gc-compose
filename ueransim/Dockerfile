FROM gcc:9.4.0 AS builder

LABEL maintainer="Free5GC <support@free5gc.org>"

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update \
    && apt-get install libsctp-dev lksctp-tools iproute2 -y \
    && wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-x86_64.sh -O cmake_installer.sh \
    && chmod +x cmake_installer.sh \
    && ./cmake_installer.sh --skip-license \
    && git clone -b master -j `nproc` https://github.com/aligungr/UERANSIM \
    && cd ./UERANSIM \
    && make

# FROM bitnami/minideb:bullseye
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive

# Install runtime dependencies + ping
RUN apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y --no-install-recommends iproute2 python3 curl tar sudo git \
		iputils-ping ethtool net-tools tshark traceroute kmod tcpdump procps libsctp-dev apt-transport-https ca-certificates \
		iptables ebtables nftables vim psmisc bash-completion less jq tmux build-essential \
		wget mptcpize \
		&& \
	apt-get clean

# RUN apt-get update \
#     && apt-get install libsctp-dev lksctp-tools iproute2 iputils-ping procps psmisc -y \
#     && apt-get clean

WORKDIR /ueransim

RUN git clone https://github.com/geliangtang/iperf.git && \
	cd iperf && \
	./configure && \
	make && \
	make install && \
	ldconfig

RUN mkdir -p config/ binder/

COPY --from=builder /UERANSIM/build/nr-gnb .
COPY --from=builder /UERANSIM/build/nr-ue .
COPY --from=builder /UERANSIM/build/nr-cli .
COPY --from=builder /UERANSIM/build/nr-binder binder/
COPY --from=builder /UERANSIM/build/libdevbnd.so binder/

VOLUME [ "/ueransim/config" ]
