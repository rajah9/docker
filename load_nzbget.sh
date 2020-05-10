
# Script to pull and start NZBget
docker pull linuxserver/nzbget

echo "Creating NZBget container."
docker create \
  --name=nzbget \
  --network=mynet \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/New_York \
  -p 6789:6789 \
  -v /docker/nzbget/config:/config \
  -v /media/complete:/downloads \
  -v /media/incomplete:/intermediate \
  --restart unless-stopped \
  linuxserver/nzbget

# docker run -it --net=container:vpn -d linuxserver/nzbget
docker start nzbget

sleep 3s
echo "checking ports."
docker port nzbget
echo "container address of nzbget:"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nzbget
echo "place the above IP address in the Host field in sonarr for Nzbget."
echo "Done."

echo "Creating dirs and setting permissions"
docker exec -it nzbget mkdir -p /docker/nzbget/config
docker exec -it nzbget mkdir -p /docker/nzbget/queue
docker exec -it nzbget mkdir -p /usr/local/share/nzbget
docker exec -it nzbget mkdir -p /usr/local/etc
docker exec -it nzbget mkdir -p /docker/nzbget/scripts
docker exec -it nzbget mkdir -p /usr/local/share/nzbget/webui
docker exec -it nzbget mkdir -p /etc/ssl/certs
docker exec -it nzbget chmod u=rwx,g=rwx,o=rwx /docker/nzbget/config
docker exec -it nzbget ls -lah /docker/nzbget/

echo "Done."

