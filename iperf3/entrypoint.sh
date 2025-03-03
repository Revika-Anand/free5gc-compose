#!/bin/bash

# upf1=$(dig @10.102.200.50 +noall +answer upf1.free5gc.org A | awk '{ print $5 }')
# upf2=$(dig @10.102.200.50 +noall +answer upf2.free5gc.org A | awk '{ print $5 }')

# ip rule add from 10.101.200.30 table 1
# ip rule add from 10.102.200.30 table 2
# ip route add 10.102.200.0/24 dev eth0 scope link table 2
# ip route add 10.101.200.0/24 dev eth1 scope link table 1
# ip route add default via 10.101.200.20 dev eth1 table 1
# ip route add default via 10.102.200.20 dev eth0 table 2
# ip mptcp limits set subflow 2 add_addr_accepted 2
# ip mptcp endpoint add 10.102.200.30 dev eth0 signal
# ip mptcp endpoint add 10.101.200.30 dev eth1 signal
# route add -net 10.60.0.0/24 gw 10.101.200.20
# route add -net 10.61.0.0/24 gw 10.102.200.20


route add -net 10.60.0.0/24 gw 10.102.200.40
route add -net 10.61.0.0/24 gw 10.102.200.40
route add -net 10.101.200.0/24 gw 10.102.200.40
route add -net 10.100.200.0/24 gw 10.102.200.40
tail -f /dev/null
# iperf3 -s -p 5001 -i 1 &
# iperf3 -s -p 5002 -i 1 &
# iperf3 -s -p 5003 -i 1 &
# iperf3 -s -p 5004 -i 1 &
# iperf3 -s -p 5005 -i 1 &
# iperf3 -s -p 5006 -i 1 &
# iperf3 -s -p 5007 -i 1 &
# iperf3 -s -p 5008 -i 1 &
# iperf3 -s -p 5009 -i 1 &
# iperf3 -s -p 5010 -i 1
