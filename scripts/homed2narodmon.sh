#!/bin/sh
# Скрипт заправшивает значение датчиков в HOMEd, а потом публикует значения на 
# сервис Народный Мониторинг (narodmon.ru)
# Автор tudimon.com

#### предустановки ####

SERVER="narodmon.ru"
PORT="8283"

# MAC адрес прибора (тут нужно указать свой адрес, т.к. сервис разбирает поступающие 
# показания по мак-адресу и заносит в нужный прибор на основании этого параметра)
DEVICE_MAC="FFFFFFFFFF"

# идентификаторы прибора (датчиков)
SENSOR_ID_1="Tulitsa"
SENSOR_ID_2="Hulitsa"

#### считываем значения в HOMEd ####

# В файле /opt/homed-zigbee/options.json нужно добавить опцию "retain":true для нашего сенсора
# https://t.me/homed_chat/151492
# так же нужно устаровить пакет jq - Lightweight and flexible command-line JSON processor

# читаем значение сенсора из MQTT
thulitsa=`mosquitto_sub -h localhost -p 1883 -t homed/fd/zigbee/TH_ulitsa -C 1 -u "homed" -P "pass_homed"`
#echo $thulitsa

# вычленяем значения
tul=$(echo $thulitsa | jq '.temperature')
hul=$(echo $thulitsa | jq '.humidity')
#echo $tul
#echo $hul

# значения датчиков
sensor_value_1=$tul
sensor_value_2=$hul

#### отправляем значения в NarodMon ####

mes1=$(echo "http://narodmon.ru/get?ID=$DEVICE_MAC&$SENSOR_ID_1=$sensor_value_1&$SENSOR_ID_2=$sensor_value_2")
#echo $mes1
curl $mes1
