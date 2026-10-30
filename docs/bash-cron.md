# Fase 2 Script Bash y Cron

## Proyecto final de Software Libre
Grupo 5

## Objetivo
Crear un script que muestre informacion del servidor Debian
y programarlo para que se ejecute cada 30 minutos.

## Script utilizado
El archivo se llama reporte_sistema.sh y esta guardado
en /proyecto/scripts/.

El script muestra:
- Fecha y hora
- Nombre del servidor
- Usuarios conectados
- Espacio disponible en disco
- Memoria RAM
- Contenedores Docker activos

## Prueba del script
Para ejecutarlo utilizamos:

sudo -u adminsys bash /proyecto/scripts/reporte_sistema.sh

## Configuracion de Cron
La tarea se agrego al usuario adminsys con:

sudo -u adminsys crontab -e

Se utilizo la siguiente programacion:

*/30 * * * * /bin/bash /proyecto/scripts/reporte_sistema.sh >> /var/log/proyecto/reporte_sistema.log 2>&1

Esto permite ejecutar el reporte cada 30 minutos.

## Archivo de registro
Los resultados se guardan en:

/var/log/proyecto/reporte_sistema.log

## Pruebas realizadas
- Se verifico la sintaxis del script.
- Se ejecuto manualmente.
- Se comprobaron las metricas del servidor.
- Se verifico que el servicio Cron esta activo.
- Se comprobo que el reporte se guarda en el archivo de registro.

## Resultado
El script funciona correctamente de forma manual.
Queda pendiente confirmar una ejecucion automatica de Cron.
