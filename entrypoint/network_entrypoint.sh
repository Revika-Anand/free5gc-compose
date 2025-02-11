#!/bin/bash

con_name=$HOST
echo $con_name
env_var="${con_name^^}_NETWORK"
echo $env_var
net=${!env_var}
echo $net
if [[ "$net" == "ground" ]]; then
    int_name=$(ip -json address show   | jq '.[] | select(.addr_info[].broadcast == "10.101.200.255") | .ifname')
    ifconfig $int_name down
    route add -net 10.101.200.0/24 gw 10.101.200.40
elif [[ "$net" == "satellite" ]]; then
    int_name=$(ip -json address show   | jq '.[] | select(.addr_info[].broadcast == "$10.100.200.255") | .ifname')
    ifconfig $int_name down
    route add -net 10.100.200.0/24 gw 10.101.200.40
fi

# done
