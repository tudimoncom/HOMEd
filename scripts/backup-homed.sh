#!/bin/sh
# Скрипт для бэкапа (архивации конфигурации) HOMEd в OpenWRT
# Автор Вадим Печорин https://t.me/homed_chat/207669
# Форк tudimon.com

# Указываем папку куда бэкапить и сколько дней хранить
BACKUP_DIR="/backups"
BACKUP_DAYS=7

# создаем подпапку с именем = текущая дата
BACKUP_DIR_TIMESTAMP="${BACKUP_DIR}/`date +%F`"
mkdir -p ${BACKUP_DIR_TIMESTAMP}

# бэкапим
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_mosquitto-etc.tar.gz /etc/mosquitto
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_homed-etc.tar.gz /etc/homed
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_homed-opt.tar.gz /opt/homed-*
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_homed-bin.tar.gz /usr/bin/homed-*
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_homed-share.tar.gz /usr/share/homed-*
tar -czf ${BACKUP_DIR_TIMESTAMP}/`date +%F-%H%M`_root.tar.gz /root

# удаляем архивы и папки старше BACKUP_DAYS
find ${BACKUP_DIR}/* -type f -name "*.tar.gz" -mtime +${BACKUP_DAYS} -exec rm {} \;
find ${BACKUP_DIR}/* -type d -exec rmdir {} \;
