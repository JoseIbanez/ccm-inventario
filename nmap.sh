#!/bin/sh

nmap -sP -n $2 > gonv/nmap-$1.txt
cat  gonv/nmap-$1.txt | grep report | awk '{print $5}' > gonv/ip-$1.lst

