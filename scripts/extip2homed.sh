#!/bin/sh

# external ip
ext_ip=`curl 2ip.ru`

echo $ext_ip
#ext_ip="23"

mosquitto_pub -h localhost -p 1883 -t homed/fd/custom/extip -m "{\"externalip\":\"$ext_ip\"}" -u "usermqtt" -P "***"

