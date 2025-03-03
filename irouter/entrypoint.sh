#!bin/sh
route add -net 10.101.200.0/24 gw 10.101.200.40
route add -net 10.102.200.0/24 gw 10.102.200.40
route add -net 10.60.0.0/24 gw 10.101.200.40
route add -net 10.61.0.0/24 gw 10.100.200.40
tail -f /dev/null
