#!/bin/sh

# Free Memory
freemem=`free -h |grep Mem | awk -F ' ' '{print $4}'`
freemem_k=$(( $freemem / 1024 ))
#echo $freemem 
#echo $freemem_k

# CPU idle
cpuidle=`top -n1 | head -n2 |grep CPU | awk -F ' ' '{print $8}' | sed 's/%//'`
#echo $cpuidle 

# CPU use
cpuuse=$(( 100 - $cpuidle ))
#echo $cpuuse

# disk /dev/root
diskused=`df -m |grep /dev/root | awk -F ' ' '{print $3}' `
diskfree=`df -m |grep /dev/root | awk -F ' ' '{print $4}' `
diskusedpers=`df -m |grep /dev/root | awk -F ' ' '{print $5}' | sed 's/%//'`
#echo $diskused
#echo $diskfree
#echo $diskusedpers

mosquitto_pub -h localhost -p 1883 -t homed/fd/custom/gwt360sysmon -m "{\"cpuidle\":$cpuidle,\"cpuuse\":$cpuuse,\"freemem\":$freemem_k,\"diskused\":$diskused,\"diskfree\":$diskfree,\"diskusedpers\":$diskusedpers}" -u "usermqtt" -P "***"

