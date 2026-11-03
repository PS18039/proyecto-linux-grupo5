# Proyecto Linux - Grupo 5

## Universidad de El Salvador

**Carrera:** Ingeniería en Desarrollo de Software  
**Asignatura:** Introducción al Software Libre  
**Proyecto:** Administración de servidor Linux y despliegue web con Docker  
**Sistema operativo:** Debian 13  
**Nombre del servidor:** servidor-grupo5  

## 1. Descripción del proyecto

En este proyecto trabajamos con una máquina virtual utilizando Debian 13

Realizamos diferentes configuraciones del sistema, como la creación de usuarios, grupos, permisos y carpetas. También utilizamos scripts Bash, Cron, Git, GitHub y Docker

Además, creamos una página web sencilla para el Grupo 5 y utilizamos Nginx para mostrarla mediante contenedores Docker

Al finalizar, realizamos varias pruebas para comprobar que los servicios estuvieran funcionando correctamente

## 2. Objetivo general

Configurar un servidor Linux con Debian 13 y utilizar herramientas de software libre para administrar el sistema, automatizar tareas y ejecutar servicios web con Docker

## 3. Integrantes del grupo

| Integrante | Carné | Fases asignadas |
|---|---|---|
| Ronald Oswaldo Pérez Santos | PS18039 | Fases 1 y 3: Administración de Debian y Git |
| Josué Emanuel Zúniga Ramírez | ZR19012 | Fase 5: Servidor web Nginx |
| Kenia Yamileth Murillo Gutiérrez | MG25049 | Fase 6: Dockerfile e imagen personalizada |
| Kevin Daniel Hernández Belloso | HH25003 | Fase 7: Redes y volúmenes Docker |

**Fases 2 y 4:** Configuración de Bash, Cron y Docker, como parte del trabajo general del proyecto

**Fase 8:** Integración y pruebas finales realizadas como parte del trabajo de todo el Grupo 5

## 4. Herramientas utilizadas

- Debian 13
- VirtualBox
- Bash
- Cron
- Git
- GitHub
- Docker
- Nginx
- HTML y CSS
- Alpine Linux

## 5. Desarrollo del proyecto

### Fase 1. Administración del servidor Debian

**Responsable: Ronald Oswaldo Pérez Santos**

Primero instalamos Debian 13 en una máquina virtual utilizando VirtualBox

Configuramos el nombre del servidor como `servidor-grupo5`

Después creamos los siguientes usuarios:

- `adminsys`
- `tecnico`
- `visitante`

También creamos los grupos:

- `soporte`
- `web`

Organizamos las carpetas del proyecto dentro de `/proyecto/`

**Estructura de carpetas del servidor:**

```text
/proyecto/
├── datos/
├── web/
├── scripts/
└── capturas/
```

Asignamos los permisos necesarios a los usuarios y grupos. También configuramos SGID para que los archivos nuevos conservaran el grupo correspondiente

**Comandos utilizados para verificar:**

```bash
hostnamectl
id adminsys
id tecnico
id visitante
sudo ls -ld /proyecto /proyecto/*
```

### Fase 2. Automatización con Bash y Cron

**Responsabilidad: Trabajo general del proyecto**

En esta fase creamos un script llamado `reporte_sistema.sh`

El script permite consultar información básica del servidor, como:

- Fecha y hora.
- Nombre del servidor
- Usuarios conectados
- Espacio disponible en disco
- Memoria RAM
- Contenedores Docker activos

**Ubicación del script:**

```text
/proyecto/scripts/reporte_sistema.sh
```

Para ejecutarlo utilizamos:

```bash
sudo bash /proyecto/scripts/reporte_sistema.sh
```

También configuramos Cron para ejecutar el reporte automáticamente cada 30 minutos

**Tarea programada:**

```cron
*/30 * * * * /bin/bash /proyecto/scripts/reporte_sistema.sh >> /var/log/proyecto/reporte_sistema.log 2>&1
```

Para revisar la tarea y sus registros:

```bash
sudo crontab -u adminsys -l
sudo tail -n 20 /var/log/proyecto/reporte_sistema.log
```

Durante las pruebas comprobamos que el reporte se ejecutaba y que los resultados se guardaban en el archivo de registro

### Fase 3. Git y GitHub

**Responsable: Ronald Oswaldo Pérez Santos**

Utilizamos Git para guardar los cambios realizados durante el proyecto y GitHub para compartir los archivos entre los integrantes

**Repositorio del proyecto:**

https://github.com/PS18039/proyecto-linux-grupo5

La rama principal utilizada fue `main`

Para organizar el trabajo creamos ramas, realizamos commits y utilizamos Pull Requests para integrar los cambios al repositorio principal

**Comandos básicos utilizados:**

```bash
git clone git@github.com:PS18039/proyecto-linux-grupo5.git
cd proyecto-linux-grupo5
git status
git branch -a
git log --oneline
```

Cada integrante tenía una parte asignada para trabajar y subir sus archivos correspondientes

### Fase 4. Instalación de Docker

**Responsabilidad: Trabajo general del proyecto**

En esta fase instalamos Docker en nuestro servidor Debian 13

Verificamos que el servicio estuviera activo y agregamos los usuarios `adminsys` y `tecnico` al grupo Docker

También realizamos una prueba inicial con la imagen `hello-world`

**Comandos de verificación:**

```bash
docker --version
sudo systemctl status docker
id adminsys
id tecnico
sudo docker ps -a
```

Con estas pruebas comprobamos que Docker estaba instalado y funcionando

### Fase 5. Servidor web Nginx

**Responsable: Josué Emanuel Zúniga Ramírez**

En esta fase trabajamos con Nginx para publicar una página web sencilla del proyecto

La página contiene información del Grupo 5, la universidad y los integrantes

El archivo principal se encuentra en:

```text
/proyecto/web/index.html
```

Se utilizó un contenedor Docker con una carpeta compartida para mostrar la página web

**Datos del servicio:**

- Contenedor: `nginx-grupo5`
- Puerto: `8080`
- Servicio: Nginx

**Comandos de verificación:**

```bash
sudo docker ps --filter name=nginx-grupo5
curl -I http://localhost:8080
sudo docker logs --tail 20 nginx-grupo5
```

Comprobamos que la página se podía visualizar desde el navegador y que el servicio respondía correctamente

### Fase 6. Dockerfile e imagen personalizada

**Responsable: Kenia Yamileth Murillo Gutiérrez**

En esta fase se creó un Dockerfile para construir una imagen personalizada utilizando Nginx

El Dockerfile permite copiar los archivos de nuestra página web dentro de la imagen

**Contenido del Dockerfile:**

```dockerfile
FROM nginx:latest

COPY web/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

**Datos del servicio:**

- Imagen: `servidor-grupo5`
- Contenedor: `servidor-grupo5-web`
- Puerto: `8081`

**Comandos de verificación:**

```bash
sudo docker images servidor-grupo5
sudo docker ps --filter name=servidor-grupo5-web
curl -I http://localhost:8081
```

Se comprobó que la imagen personalizada permitía ejecutar la página web correctamente

Los archivos de esta fase se encuentran en la carpeta `fase6-dockerfile/` del repositorio

### Fase 7. Redes y volúmenes Docker

**Responsable: Kevin Daniel Hernández Belloso**

En esta fase configuramos una red y un volumen utilizando Docker

La red permite que los contenedores puedan comunicarse entre sí

**Datos de la red:**

- Red: `red-proyecto`
- Contenedor: `nginx-red-proyecto`
- Puerto: `8082`

También utilizamos un volumen para guardar los archivos de una página web

**Datos del volumen:**

- Volumen: `volumen-web`
- Contenedor: `nginx-volumen-web`
- Puerto: `8083`

**Comandos de verificación:**

```bash
sudo docker network ls
sudo docker network inspect red-proyecto

sudo docker volume ls
sudo docker volume inspect volumen-web

curl -I http://localhost:8082
curl -I http://localhost:8083
```

Durante las pruebas comprobamos que la red, el volumen y los contenedores funcionaban correctamente

### Fase 8. Integración y pruebas finales

**Responsables: Todos los integrantes del Grupo 5**

En esta última fase realizamos las pruebas generales del proyecto para comprobar que las configuraciones funcionaran correctamente

Revisamos los contenedores Docker, los servicios web, la red, el volumen y la tarea programada con Cron

**Prueba de comunicación entre contenedores:**

```bash
sudo docker run --rm --network red-proyecto alpine:latest ping -c 4 nginx-red-proyecto
```

**Resultado obtenido:**

Se enviaron 4 paquetes y se recibieron los 4 correctamente, sin pérdida de paquetes

También comprobamos los cuatro puertos utilizados en el proyecto

```bash
for puerto in 8080 8081 8082 8083
do
    curl -s -o /dev/null -w "Puerto $puerto: %{http_code}\n" http://localhost:$puerto
done
```

**Resultados de las pruebas:**

| Puerto | Servicio | Resultado |
|---|---|---|
| 8080 | Nginx con carpeta compartida | HTTP 200 |
| 8081 | Nginx con Dockerfile | HTTP 200 |
| 8082 | Nginx con red personalizada | HTTP 200 |
| 8083 | Nginx con volumen | HTTP 200 |

Los cuatro servicios respondieron correctamente

**Contenedores utilizados:**

```text
nginx-grupo5
servidor-grupo5-web
nginx-red-proyecto
nginx-volumen-web
```

Para verificar los contenedores utilizamos:

```bash
sudo docker ps
```

También revisamos que Cron continuara funcionando y que el reporte del sistema se guardara en el archivo correspondiente

El script utilizado para estas pruebas se encuentra en:

```text
scripts/pruebas_finales.sh
```

## 6. Evidencias del proyecto

Durante el desarrollo guardamos capturas de pantalla para demostrar las configuraciones y pruebas realizadas

Las evidencias corresponden a:

- Instalación y configuración de Debian
- Usuarios, grupos y permisos
- Ejecución del script Bash
- Configuración de Cron
- Uso de Git y GitHub
- Instalación de Docker
- Página web con Nginx
- Dockerfile e imagen personalizada
- Redes y volúmenes Docker
- Comunicación entre contenedores
- Funcionamiento de los cuatro puertos

Las capturas se incluyen en el informe final y en las carpetas de evidencias disponibles en el repositorio

## 7. Resultados obtenidos

Al finalizar el proyecto logramos configurar un servidor Debian 13 y utilizar diferentes herramientas de software libre

También conseguimos ejecutar un script Bash, automatizarlo mediante Cron y utilizar Git y GitHub para guardar los avances

Con Docker y Nginx configuramos cuatro servicios web que funcionaron correctamente durante las pruebas

Además, comprobamos la comunicación entre contenedores y el funcionamiento de una red y un volumen

## 8. Conclusión

Con este proyecto pusimos en práctica varios temas vistos en la asignatura de Introducción al Software Libre

Aprendimos a configurar usuarios y permisos en Linux, utilizar scripts Bash, programar tareas con Cron y trabajar con Git y GitHub

También aprendimos a utilizar Docker para ejecutar contenedores y publicar una página web con Nginx

Las pruebas finales nos permitieron comprobar que las configuraciones realizadas funcionaban correctamente

## 9. Estado final del proyecto

**Proyecto configurado y probado en Debian 13.**

Se completaron las ocho fases del proyecto y se verificó el funcionamiento de los cuatro servicios web

Los archivos de las fases desarrolladas se integraron al repositorio de GitHub mediante commits y Pull Requests
