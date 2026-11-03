# Proyecto Linux - Grupo 5

## Universidad de El Salvador

**Facultad:** Multidisciplinaria de Occidente  
**Carrera:** Ingeniería en Desarrollo de Software  
**Asignatura:** Introducción al Software Libre  
**Proyecto:** Administración de servidor Linux y despliegue web con Docker  
**Sistema operativo:** Debian 13  
**Hostname:** servidor-grupo5  
**Fecha de entrega:** 3 de noviembre de 2026

## Descripción del proyecto

En este proyecto se realizó la configuración de un servidor Linux utilizando Debian 13 en una máquina virtual de VirtualBox.

Se trabajó con usuarios, grupos, permisos, scripts Bash, tareas programadas con Cron, control de versiones con Git y GitHub, y contenedores Docker.

También se creó una página web básica del Grupo 5 utilizando HTML y Nginx, la cual se publicó mediante cuatro contenedores con diferentes configuraciones.

Finalmente, se realizaron pruebas para comprobar el funcionamiento de los servicios, las redes, los volúmenes y la automatización del sistema.

## Objetivo general

Configurar y administrar un servidor Debian 13 utilizando herramientas de software libre para automatizar tareas, controlar versiones y publicar servicios web mediante contenedores Docker.

## Integrantes y responsabilidades

| Integrante | Carné | Responsabilidad |
|---|---|---|
| Kenia Yamileth Murillo Gutiérrez | MG25049 |   |
| Josué Emanuel Zúniga Ramírez | ZR19012 |   |
| Ronald Oswaldo Pérez Santos | PS18039 | Fases 1 y 3: Debian, usuarios, permisos y Git |
| Kevin Daniel Hernández Belloso | HH25003 |   |

**Fase 8:** Integración, pruebas y verificación final del proyecto.

## Herramientas utilizadas

- Debian 13
- VirtualBox
- Bash
- Cron
- Git y GitHub
- Docker
- Nginx
- HTML y CSS
- Alpine Linux

## Fase 1. Administración del servidor Debian

Se configuró el servidor con el nombre `servidor-grupo5`.

Se crearon los usuarios `adminsys`, `tecnico` y `visitante`, junto con los grupos `soporte` y `web`.

También se crearon los directorios necesarios para organizar los archivos del proyecto.

### Estructura del servidor

```text
/proyecto/
├── datos/
├── web/
├── scripts/
├── capturas/
├── docker/
├── docs/
├── evidencias/
├── Dockerfile
└── README.md
```

### Permisos

- `adminsys`: permisos de administrador mediante sudo.
- `tecnico`: pertenece al grupo soporte.
- `visitante`: pertenece al grupo web.
- `datos`, `scripts` y `capturas`: grupo soporte.
- `web`: grupo web.

Se configuraron permisos SGID para conservar los grupos correspondientes.

### Comandos de verificación

```bash
hostnamectl
id adminsys
id tecnico
id visitante
sudo ls -ld /proyecto /proyecto/*
```

## Fase 2. Automatización con Bash y Cron

Se creó el archivo `reporte_sistema.sh`, ubicado en:

```text
/proyecto/scripts/reporte_sistema.sh
```

Este script muestra:

- Fecha y hora.
- Nombre del servidor.
- Usuarios conectados.
- Espacio disponible en disco.
- Memoria RAM disponible.
- Cantidad de contenedores Docker activos.

### Ejecutar el reporte

```bash
sudo bash /proyecto/scripts/reporte_sistema.sh
```

### Automatización con Cron

Se configuró una tarea para ejecutar el reporte cada 30 minutos.

```cron
*/30 * * * * /bin/bash /proyecto/scripts/reporte_sistema.sh >> /var/log/proyecto/reporte_sistema.log 2>&1
```

### Consultar los registros

```bash
sudo crontab -u adminsys -l
sudo tail -n 20 /var/log/proyecto/reporte_sistema.log
```

Durante las pruebas se comprobó que Cron funcionaba y que el archivo de registro se actualizaba.

## Fase 3. Git y GitHub

Se utilizó Git para guardar los cambios realizados durante el desarrollo y GitHub para almacenar los archivos del proyecto.

**Repositorio:**

https://github.com/PS18039/proyecto-linux-grupo5

**Rama principal:** `main`

### Procedimiento de colaboración

1. Clonar el repositorio.
2. Crear una rama para la fase correspondiente.
3. Agregar los archivos y realizar las pruebas.
4. Guardar los cambios mediante commits.
5. Subir la rama a GitHub.
6. Crear un Pull Request.
7. Revisar e integrar los cambios a `main`.

### Ramas utilizadas

```text
feature/administracion-debian
feature/bash-cron
```

### Comandos básicos

```bash
git clone git@github.com:PS18039/proyecto-linux-grupo5.git
cd proyecto-linux-grupo5
git status
git branch -a
git log --oneline
```

## Fase 4. Instalación de Docker

Se instaló Docker en Debian 13 y se verificó que el servicio estuviera funcionando.

Los usuarios `adminsys` y `tecnico` fueron agregados al grupo `docker`.

También se realizó la prueba inicial utilizando la imagen `hello-world`.

### Comandos de verificación

```bash
docker --version
sudo systemctl status docker
id adminsys
id tecnico
sudo docker ps -a
```

## Fase 5. Servidor web con Nginx

Se creó una página web básica utilizando HTML y CSS.

El archivo principal se encuentra en:

```text
/proyecto/web/index.html
```

La página muestra información de la Universidad de El Salvador, el proyecto y los integrantes del Grupo 5.

Se ejecutó un contenedor Nginx utilizando la imagen oficial y una carpeta compartida.

**Contenedor:** `nginx-grupo5`  
**Puerto:** 8080

### Verificación

```bash
sudo docker ps --filter name=nginx-grupo5
curl -I http://localhost:8080
sudo docker logs --tail 20 nginx-grupo5
```

La página se comprobó desde el navegador y respondió correctamente.

## Fase 6. Imagen personalizada con Dockerfile

Se creó un Dockerfile para construir una imagen personalizada de Nginx.

### Contenido del Dockerfile

```dockerfile
FROM nginx:latest

COPY web/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

**Imagen personalizada:** `servidor-grupo5`  
**Contenedor:** `servidor-grupo5-web`  
**Puerto:** 8081

### Comandos de verificación

```bash
sudo docker images servidor-grupo5
sudo docker ps --filter name=servidor-grupo5-web
curl -I http://localhost:8081
```

Se comprobó que el servidor web funcionaba utilizando la imagen personalizada.

## Fase 7. Redes y volúmenes Docker

Se configuró una red personalizada para permitir la comunicación entre contenedores.

**Red:** `red-proyecto`  
**Contenedor:** `nginx-red-proyecto`  
**Puerto:** 8082

También se creó un volumen para almacenar los archivos del sitio web.

**Volumen:** `volumen-web`  
**Contenedor:** `nginx-volumen-web`  
**Puerto:** 8083

### Comandos de verificación

```bash
sudo docker network ls
sudo docker network inspect red-proyecto

sudo docker volume ls
sudo docker volume inspect volumen-web

curl -I http://localhost:8082
curl -I http://localhost:8083
```

Se comprobó que la red, el volumen y los servicios web funcionaban correctamente.

## Fase 8. Integración y pruebas finales

En esta fase se realizaron pruebas para verificar el funcionamiento de los servicios configurados.

### Prueba de conectividad

Se utilizó un contenedor Alpine Linux para comprobar la comunicación con Nginx dentro de la red personalizada.

```bash
sudo docker run --rm --network red-proyecto alpine:latest ping -c 4 nginx-red-proyecto
```

**Resultado:** 4 paquetes enviados, 4 recibidos y 0 % de pérdida.

### Verificación de los cuatro servicios web

```bash
for puerto in 8080 8081 8082 8083
do
    curl -s -o /dev/null -w "$puerto: %{http_code}\n" http://localhost:$puerto
done
```

### Resultados obtenidos

| Puerto | Servicio | Resultado |
|---|---|---|
| 8080 | Nginx con carpeta compartida | HTTP 200 |
| 8081 | Nginx con imagen personalizada | HTTP 200 |
| 8082 | Nginx con red personalizada | HTTP 200 |
| 8083 | Nginx con volumen Docker | HTTP 200 |

Los cuatro servicios respondieron correctamente durante las pruebas.

### Contenedores utilizados

```text
nginx-grupo5
servidor-grupo5-web
nginx-red-proyecto
nginx-volumen-web
```

Para consultar su estado:

```bash
sudo docker ps
```

También se verificó que Cron continuara ejecutando el reporte automático.

## Documentación y evidencias

El proyecto cuenta con documentación y capturas de las configuraciones realizadas.

Las evidencias incluyen:

- Configuración de Debian 13.
- Usuarios, grupos y permisos.
- Script Bash y ejecución automática con Cron.
- Ramas y commits de Git.
- Instalación de Docker.
- Página web funcionando con Nginx.
- Imagen personalizada con Dockerfile.
- Redes y volúmenes.
- Pruebas de conectividad.
- Verificación de los cuatro servicios web.

Las capturas se organizan en el informe final y en las carpetas de evidencias correspondientes del repositorio.

## Resultados del proyecto

Se logró configurar un servidor Debian 13 y utilizar diferentes herramientas de software libre para su administración.

El script Bash permitió consultar información del servidor y Cron permitió automatizar su ejecución.

También se configuraron cuatro servicios web mediante Docker y Nginx, los cuales respondieron correctamente durante las pruebas.

Se comprobó la comunicación entre contenedores y el funcionamiento de una red y un volumen personalizados.

## Conclusión

Este proyecto permitió aplicar los conocimientos adquiridos durante la asignatura de Introducción al Software Libre.

Se aprendió a administrar usuarios y permisos en Linux, automatizar tareas, utilizar Git y GitHub y trabajar con contenedores Docker.

También se comprendió cómo publicar una página web mediante Nginx y cómo comprobar que los servicios funcionan correctamente.

El proyecto permitió conocer de forma práctica cómo diferentes herramientas de software libre pueden utilizarse para administrar un servidor Linux.

## Estado del proyecto

**Configuración y pruebas técnicas completadas en Debian 13.**

Se verificó el funcionamiento de los cuatro servicios
