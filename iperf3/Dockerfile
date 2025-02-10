FROM ubuntu:24.04

LABEL name=ubuntu-mptcp

# dependencies for the script
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get dist-upgrade -y && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends iproute2 python3 curl tar sudo git \
		iputils-ping ethtool net-tools kmod tshark tcpdump apt-transport-https ca-certificates\
		iptables ebtables nftables vim psmisc bash-completion less jq tmux \
		wget mptcpize build-essential \
		&& \
	apt-get clean

WORKDIR /iperf-server

RUN git clone https://github.com/geliangtang/iperf.git && \
	cd iperf && \
	./configure && \
	make && \
	make install && \
	ldconfig

	# update-ca-certificates && \