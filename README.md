# Proyecto Linux - Grupo 5

## Universidad de El Salvador
**Asignatura:** Introducción al Software Libre  
**Proyecto:** Administración de servidor Linux y despliegue web con Docker  
**Sistema operativo:** Debian 13  
**Hostname:** servidor-grupo5  
**Fecha de entrega:** 3 de noviembre de 2026

## Objetivo

Configurar y administrar un servidor Debian utilizando usuarios,
grupos, permisos, scripts Bash, Git, GitHub y contenedores Docker
para implementar un servicio web funcional.

## Integrantes y responsabilidades

| Integrante | Carné | Responsabilidad |
|---|---|---|
| Ronald Oswaldo Pérez Santos | PS18039 | Fases 1 y 3: Debian, usuarios, permisos y Git |
| Josué Emanuel Zúniga Ramírez | ZR19012 |  |
| Kenia Yamileth Murillo Gutiérrez | MG25049 |  |
| Kevin Daniel Hernández Belloso | HH25003 |  |

**Fase 8:** Integración, pruebas, evidencias y presentación grupal.

## Fases del proyecto

1. Administración de usuarios, grupos y permisos Linux.
2. Automatización de reportes mediante Bash y Cron.
3. Control de versiones y colaboración mediante Git y GitHub.
4. Instalación y configuración de Docker.
5. Publicación de un sitio web con Nginx en el puerto 8080.
6. Construcción de una imagen personalizada con Dockerfile en el puerto 8081.
7. Configuración de redes y volúmenes Docker, puertos 8082 y 8083.
8. Integración, pruebas y documentación final.

## Estructura del servidor

```text
/proyecto/
├── datos/
├── web/
├── scripts/
├── capturas/
├── docs/
└── README.md
```

## Usuarios y grupos

- adminsys: administrador del servidor con privilegios sudo.
- tecnico: usuario perteneciente al grupo soporte.
- visitante: usuario perteneciente al grupo web.

Los directorios datos, scripts y capturas pertenecen al grupo
soporte. El directorio web pertenece al grupo web.

Los directorios protegidos utilizan permisos SGID para conservar
el grupo correspondiente en los nuevos archivos.

## Repositorio GitHub

Repositorio: https://github.com/PS18039/proyecto-linux-grupo5

Rama principal: main

### Procedimiento de colaboración

1. Clonar el repositorio en el equipo de cada integrante.
2. Crear una rama feature para desarrollar la fase asignada.
3. Realizar los cambios y las pruebas correspondientes.
4. Registrar los cambios mediante commits descriptivos.
5. Subir la rama a GitHub.
6. Crear un Pull Request dirigido a main.
7. Revisar y aprobar los cambios antes de integrarlos.

### Ramas sugeridas

- feature/administracion-debian
- feature/bash-cron
- feature/docker-nginx
- feature/dockerfile-redes-volumenes

### Comandos básicos de Git

```bash
git clone git@github.com:PS18039/proyecto-linux-grupo5.git
cd proyecto-linux-grupo5
git switch -c feature/nombre-de-la-fase
git add .
git commit -m "Descripción de los cambios"
git push -u origin feature/nombre-de-la-fase
```

## Documentación y evidencias

La carpeta docs contiene la documentación técnica.

Las evidencias de configuración, ejecución y pruebas se
incorporarán al repositorio conforme avance cada fase.

## Estado del proyecto

Proyecto en desarrollo. La integración y validación final
se realizarán cuando todas las fases estén completadas.
