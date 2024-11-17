[b]Все связанное с HOMEd[/b]

/scripts/sysmon2homed.sh - 
Скрипт который запрашивает у OpenWRT (установлен на шлюзе умного дома МТС с OpenWRT) свободную память ОЗУ, загрузку процессора и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)

/scripts/extip2homed.sh - 
Скрипт который запрашивает у 2ip.ru внешний ip адрес и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)
