
#!/bin/bash

# Proyecto ISL135 - Grupo 5
# Fase 2: Reporte de informacion del sistema

echo "======================================"
echo "     REPORTE DEL SISTEMA - GRUPO 5"
echo "======================================"

echo "Fecha y hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Nombre del servidor: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)"

echo ""
echo "--- ESPACIO DISPONIBLE EN DISCO ---"
df -h /

echo ""
echo "--- MEMORIA RAM DISPONIBLE ---"
free -h

echo ""
echo "--- CONTENEDORES DOCKER ACTIVOS ---"
if command -v docker >/dev/null 2>&1; then
    if docker info >/dev/null 2>&1; then
        docker ps -q | wc -l
    else
        echo "No se pudo consultar Docker"
    fi
else
    echo "Docker no esta instalado"
fi

echo ""
echo "======================================"
echo "        FIN DEL REPORTE"
echo "======================================"
