#!/bin/bash

for puerto in 8080 8081 8082 8083
do
    curl -s -o /dev/null -w "Puerto $puerto: %{http_code}\n" http://localhost:$puerto
done

sudo docker ps

sudo docker network inspect red-proyecto --format '{{.Name}}'
sudo docker volume inspect volumen-web --format '{{.Name}}'

sudo docker run --rm --network red-proyecto alpine:latest ping -c 4 nginx-red-proyecto

systemctl is-active cron
sudo crontab -u adminsys -l
sudo tail -n 15 /var/log/proyecto/reporte_sistema.log
