Все связанное с HOMEd

/scripts/sysmon2homed.sh - 
скрипт который запрашивает у OpenWRT (установлен на шлюзе умного дома МТС с OpenWRT) свободную память ОЗУ, загрузку процессора, занятое/свободное место и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)

/scripts/extip2homed.sh - 
скрипт который запрашивает у 2ip.ru внешний ip адрес и потом пихает эти значения в custom сенсор HOMEd (используется mosquitto_pub и mqtt)

/scripts/backup-homed.sh - скрипт, который архивирует конфигурацию HOMEd на OpenWRT в папку на том же устройстве и удалять старые копии.

/scripts/homed2narodmon.sh - скрипт заправшивает значение датчиков в HOMEd на OpenWRT, а потом публикует значения на сервис Народный Мониторинг (narodmon.ru)
