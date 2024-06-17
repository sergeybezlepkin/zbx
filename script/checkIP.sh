#!/bin/bash
docker ps -qa | xargs -I {} sh -c 'id={}; name=$(docker inspect --format="{{.Name}}" $id); name=$(echo $name | sed "s/\///g"); ip=$(docker inspect -f '\''{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'\'' $id); ports=$(docker port $id | awk '\''{print $3}'\''); echo IP: $ip, DNS name: $name, Ports: $ports' | sort -t ',' -k4
exit
