#!/bin/bash
route add -net 10.101.200.0/24 gw 10.100.200.40
# tshark -i eth0 -w /ueransim/logs/ueransim_eth0.pcap -f "not (arp or tcp or udp) or (tcp port 5001)" &
./nr-ue -c ./config/uecfg1.yaml -n 10
