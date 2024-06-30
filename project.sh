#!/bin/bash
project_path="$PWD/zbx"
folders=("/config/var/lib/zabbix/alertscripts" "/config/var/lib/zabbix/externalscripts" "/config/var/lib/zabbix/dbscripts" "/config/var/lib/zabbix/export" "/config/var/lib/zabbix/modules" "/config/var/lib/zabbix/enc" "/config/var/lib/zabbix/ssh_keys" "/config/var/lib/zabbix/mibs" "/config/var/lib/zabbix/snmptraps" "/config/etc/ssl/nginx" "/config/usr/share/zabbix/modules" "/config/etc/zabbix/zabbix_agentd.d" "/zbxproxy/env_vars" "/zbxproxy/conf/usr/lib/zabbix/externalscripts" "/zbxproxy/conf/var/lib/zabbix/modules" "/zbxproxy/conf/var/lib/zabbix/enc" "/zbxproxy/conf/var/lib/zabbix/ssh_keys" "/zbxproxy/conf/var/lib/zabbix/ssl/certs" "/zbxproxy/conf/var/lib/zabbix/ssl/keys" "/zbxproxy/conf/var/lib/zabbix/ssl/ssl_ca" "/zbxproxy/conf/var/lib/zabbix/snmptraps" "/zbxproxy/conf/var/lib/zabbix/mibs" "/db/data" "/els" "/nginx/data" "/nginx/letsencrypt" "/grafana/plugins" "/grafana/config" "/kibana" "/logs")
mkdir -p "$project_path" || echo "$project_path is not creatd" 
for folder in "${folders[@]}"; do
  mkdir -p "$project_path$folder" || echo "$project_path$folder is not creatd"
done

project_path="$PWD/zbx/els"
files=("env_zbxelastic")
for file in "${files[@]}"; do
  touch "$project_path/$file" || echo "$project_path/$file is not creatd"
done

project_path="$PWD/zbx/env_vars"
files=("env_zbxsrv" "env_db" "env_web" "env_agent2" "env_java" "env_webservice" "env_snmp" ".db_user" ".db_password")
mkdir -p "$project_path" || echo "$project_path is not creatd"
for file in "${files[@]}"; do
  touch "$project_path/$file" || echo "$project_path$file is not creatd"
  if [ "$file" = ".db_user" ] || [ "$file" = ".db_password" ]; then
    echo "zabbix" > "$project_path/$file"
  fi
done

project_path="$PWD/zbx/zbxproxy/env_vars"
files=("env_zbxproxy")
for file in "${files[@]}"; do
   touch "$project_path/$file" || echo "$project_path/$file is not creatd"
done

project_path="$PWD/zbx/grafana/config"
files=("grafana.ini" ".grafana_db_user" ".grafana_db_pass" "env_grafana")
for file in "${files[@]}"; do
  touch "$project_path/$file" || echo "$project_path/$file is not creatd"
  if [ "$file" = ".grafana_db_user" ]; then
    echo "admin" > "$project_path/$file"
  elif [ "$file" = ".grafana_db_pass" ]; then
    echo "supergrafana" > "$project_path/$file"
  fi
done

project_path="$PWD/zbx/swarm/"
folders=("config/var/lib/zabbix/alertscripts" "/config/var/lib/zabbix/externalscripts" "/config/var/lib/zabbix/dbscripts" "/config/var/lib/zabbix/export" "/config/var/lib/zabbix/modules" "/config/var/lib/zabbix/enc" "/config/var/lib/zabbix/ssh_keys" "/config/var/lib/zabbix/mibs" "/config/var/lib/zabbix/snmptraps" "/config/etc/ssl/nginx" "/config/usr/share/zabbix/modules" "/config/etc/zabbix/zabbix_agentd.d" "/db/data" "/els" "/nginx/data" "/nginx/letsencrypt" "/grafana/plugins" "/kibana" "/logs")
mkdir -p "$project_path" || echo "project_path is not creatd"
for folder in "${folders[@]}"; do
  mkdir -p "$project_path$folder" || echo "$project_path$folder is not creatd"
done

project_path="$PWD/zbx/swarm/env_vars"
files=("env_zbxsrv" "env_db" "env_web" "env_agent2" "env_java" "env_webservice" "env_snmp" ".db_user" ".db_password")
mkdir -p "$project_path" || echo "$project_path is not creatd"
for file in "${files[@]}"; do
  touch "$project_path/$file" || echo "project_path/$file is not creatd"
  if [ "$file" = ".db_user" ] || [ "$file" = ".db_password" ]; then
    echo "zabbix" > "$project_path/$file"
  fi
done
