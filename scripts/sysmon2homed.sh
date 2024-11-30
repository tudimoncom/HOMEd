#!/bin/sh
# Mini System Monitor для HOMEd - запрашивает инфу о CPU, RAM, ROM и обновляет
# custom sensor в HOMEd установленом на OpenWRT
# Автор tudimon.com

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
dskf=`df -m |grep /dev/root`
#echo $dskf

diskused=$(echo $dskf | cut -d " " -f 3)
#echo $diskused
diskfree=$(echo $dskf | cut -d " " -f 4)
#echo $diskfree
diskusedpers=$(echo $dskf | cut -d " " -f 5 | sed 's/%//') 
#echo $diskusedpers

mosquitto_pub -h localhost -p 1883 -t homed/fd/custom/gwt360sysmon -m "{\"cpuidle\":$cpuidle,\"cpuuse\":$cpuuse,\"freemem\":$freemem_k,\"diskused\":$diskused,\"diskfree\":$diskfree,\"diskusedpers\":$diskusedpers}" -u "homed" -P "pass_mqtt_homed"

