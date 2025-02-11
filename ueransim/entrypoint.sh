#!/bin/bash
# tshark -i eth0 -w /ueransim/logs/ueransim_eth0.pcap -f "not (arp or tcp or udp) or (tcp port 5001)" &
# ./nr-ue -c ./config/uecfg1.yaml &
# sleep 10
# ip rule add from 10.60.0.0/24 table 1
# ip rule add from 10.61.0.0/24 table 2
# ip route add 10.60.0.0/24 dev uesimtun0 scope link table 1
# ip mptcp limits set subflow 2 add_addr_accepted 2
# ./nr-ue -c ./config/uecfg2.yaml &
# sleep 120 &&
# ip route add 10.61.0.0/24 dev uesimtun1 scope link table 2
# ip1=$(ip -f inet addr show uesimtun0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')
# ip2=$(ip -f inet addr show uesimtun1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')
# ip mptcp endpoint add $ip2 dev uesimtun0 signal
# ip mptcp endpoint add $ip1 dev uesimtun1 signal
# route add -net 10.101.200.0/24 gw $ip1
# route add -net 10.102.200.0/24 gw $ip2

# iperf3 -c 10.101.200.30 -i 1 -m -p 5001
# iperf3 -s -m -p 5001 -i 1

route add -net 10.101.200.0/24 gw 10.100.200.40
./nr-ue -c ./config/uecfg1.yaml &
./nr-ue -c ./config/uecfg2.yaml



#  [WARN][NRF][Token] Certificate verify: x509: certificate signed by unknown authority (possibly because of "x509: invalid signature: parent certificate cannot sign this kind of certificate" while trying to verify candidate authority certificate "NRF")
