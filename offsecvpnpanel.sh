#!/bin/bash
offsecip=$(ip addr | grep tun0 | grep inet | grep 192.168.119. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)
if [[ $offsecip == *"192.168.119."* ]]
then
   gwip=$(ip route | grep tun0 | grep via | cut -d " " -f 3)
   ping=$(ping -c 1 $gwip -W 1 | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|' | cut -c1-4)
   echo "$offsecip"
else
   echo "Disconnected"
fi
