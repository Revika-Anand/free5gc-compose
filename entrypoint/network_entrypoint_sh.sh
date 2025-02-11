#!/bin/sh

con_name=${HOST}
env_var="${con_name}_NETWORK"
net=$(eval "echo \$$env_var")
echo ${net}
if [ ${net}="ground" ]
then
    int_name=$(ip -json address show   | jq -r '.[] | select(.addr_info[].broadcast == "10.101.200.255") | .ifname')
    echo $int_name
    ifconfig $int_name down
    # route add -net 10.101.200.0/24 gw 10.101.200.40
elif [ ${net}="satellite" ]
then
    int_name=$(ip -json address show   | jq -r '.[] | select(.addr_info[].broadcast == "10.100.200.255") | .ifname')
    echo $int_name
    ifconfig $int_name down
    # route add -net 10.100.200.0/24 gw 10.101.200.40
fi
