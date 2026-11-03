# Fase 7: Redes y Volúmenes Docker
## Grupo 5 - Proyecto Linux

### 1. Red Personalizada
Se creó la red red-proyecto y se ejecutó un contenedor Nginx mapeado al puerto 8082:
- Comando de red: docker network create red-proyecto
- Comando de contenedor: docker run -d --name nginx-red --network red-proyecto -p 8082:80 nginx:latest

### 2. Volúmenes Persistentes
Se creó el volumen volumen-web y se desplegó un contenedor Nginx mapeado al puerto 8083:
- Comando de volumen: docker volume create volumen-web
- Comando de contenedor: docker run -d --name nginx-volumen -v volumen-web:/usr/share/nginx/html -p 8083:80 nginx:latest

### 3. Prueba de Conectividad
Se verificó la conectividad mediante un contenedor Alpine Linux ejecutando:
- docker run --rm --network red-proyecto alpine ping -c 4 nginx-red
- Resultado: 0% de pérdida de paquetes (conectividad exitosa entre contenedores).
