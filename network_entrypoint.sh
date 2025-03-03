#!/bin/sh

con_name=${HOST}
env_var="${con_name}_NETWORK"
net=$(eval "echo \$$env_var")
echo ${net}
if [ "${net}" = "ground" ]
then
    int_name=$(ip -json address show   | jq -r '.[] | select(.addr_info[].broadcast == "10.101.200.255") | .ifname')
    echo $int_name
    echo "Satellite getting disabled"
    ifconfig $int_name down
    ip link delete $int_name
    route add -net 10.101.200.0/24 gw 10.100.200.40
    if [ "${con_name}" = "UPF1" -o "${con_name}" = "UPF2" ]
    then
        echo "Adding util route"
        route add -net 10.102.200.0/24 gw 10.100.200.40
    fi
elif [ "${net}" = "satellite" ]
then
    int_name=$(ip -json address show   | jq -r '.[] | select(.addr_info[].broadcast == "10.100.200.255") | .ifname')
    echo $int_name
    echo "Ground getting disabled"
    ifconfig $int_name down
    ip link delete $int_name
    route add -net 10.100.200.0/24 gw 10.101.200.40
    if [ "${con_name}" = "UPF1" -o "${con_name}" = "UPF2" ]
    then
        echo "Adding util route"
        route add -net 10.102.200.0/24 gw 10.101.200.40
    fi
fi
