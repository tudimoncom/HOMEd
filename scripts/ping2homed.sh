#!/bin/sh
# Скрипт выясняет доступен ли IP адрес посредством ping и обновляет
# custom sensor (который принимает значение on и off) в HOMEd установленом на OpenWRT
# Автор tudimon.com

# Кого пингуем
ip_target="192.168.0.11"

# пингуем
if ping -c 1 $ip_target &> /dev/null
then
  #echo "success"
  ip_status="on"
else
  #echo "not success"
  ip_status="off"
fi

#echo $ip_status

# пушим в mqtt homed
mosquitto_pub -h localhost -p 1883 -t homed/td/custom/telephone -m "{\"select\":\"$ip_status\"}" -u "homed" -P "pass_homed" 
