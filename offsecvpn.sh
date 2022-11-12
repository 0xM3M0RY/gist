#!/bin/bash
offsecip=$(ip addr | grep tun0 | grep inet | grep 192.168.119. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

if [[ $offsecip == *"192.168.119."* ]]
then
   echo "$offsecip" 
else
   echo ""
fi

