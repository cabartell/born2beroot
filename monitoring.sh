#!/bin/bash
fdisk=$(df -H /home/ --output=avail | grep "[0-9]")
udisk=$(df -m /home/ --output=used | grep "[0-9]")
uram=$(free -m | grep ^Mem | tr -s ' ' | cut -d ' ' -f 3)
fram=$(free -m | grep ^Mem | tr -s ' ' | cut -d ' ' -f 4)
tram=$(free -m | grep ^Mem | tr -s ' ' | cut -d ' ' -f 2)
pram=$(free | grep ^Mem | awk '{print $3/$2 * 100}' | cut -c 1)
pdisk=$(df /home/ --output=pcent | grep "[0-9]")
arch=$(uname -a)
pcpu=$(nproc)
vCPU=$(grep ^processor /proc/cpuinfo | wc -l)
cpu_load=$(top -bn1 | grep ^%Cpu | awk '{print $2 + $4 + $6 + $10 + $12 + $14 + $16}')"%"
last_boot=$(who -b | awk '{print $3 " " $4}')
lvm_use=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
wall -n "       #Architecture: $arch
        #CPU physical: $pcpu
        #vCPU: $(grep ^processor /proc/cpuinfo | wc -l)
        #Memory Usage: $uram/${fram}MB ($pram"%")
        #Disk Usage: $udisk/${fdisk//[[:blank:]]/}b (${pdisk//[[:blank:]]/})
        #CPU Load: $cpu_load
        #Last boot: $last_boot
        #LVM use: $lvm_use
        #Connexions TCP: $(cat /proc/net/sockstat | grep ^TCP | awk '{print $3}')" ESTABLISHED"
        #User Log: $(users | wc -w)
        #Network: $(cat /proc/net/arp | grep "[0-9]" | awk '{print "IP " $1 " (" $4 ")"}')
        #Sudo: $(cat /var/log/sudo/log | grep -c COMMAND) cmd"
