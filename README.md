Все связанное с HOMEd

/scripts/sysmon2homed.sh - 
Скрипт который запрашивает у OpenWRT (установлен на шлюзе умного дома МТС с OpenWRT) свободную память ОЗУ, загрузку процессора, занятое/свободное место и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)

/scripts/extip2homed.sh - 
Скрипт который запрашивает у 2ip.ru внешний ip адрес и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)
