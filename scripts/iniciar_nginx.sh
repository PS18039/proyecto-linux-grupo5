DIR="$(cd "$(dirname "$0")" && pwd)"

sudo mkdir -p /proyecto/web
sudo cp "$DIR/../web/index.html" /proyecto/web/index.html

sudo setfacl -m u:101:rx /proyecto/web
sudo setfacl -m u:101:r /proyecto/web/index.html

sudo docker rm -f nginx-grupo5 2>/dev/null

sudo docker run -d \
  --name nginx-grupo5 \
  -p 8080:80 \
  -v /proyecto/web:/usr/share/nginx/html:ro \
  nginx:latest

sleep 2
curl -I http://localhost:8080
