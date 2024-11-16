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

mosquitto_pub -h localhost -p 1883 -t homed/fd/custom/gwt360sysmon -m "{\"cpuidle\":$cpuidle,\"cpuuse\":$cpuuse,\"freemem\":$freemem_k}" -u "usermqtt" -P "***"

