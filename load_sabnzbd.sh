# Script to pull and start sabnzbd
docker pull linuxserver/sabnzbd

echo "Creating sabnzbd container."
docker create \
  --name=sabnzbd \
  --network=mynet \
  -e PUID=1000 \
  -e PGID=1000 \
  -e America/New_York \
  -p 8080:8080 \
  -p 9090:9090 \
  -v /docker/sabnzbd/config:/config \
  -v /media/complete:/downloads \
  -v /media/incomplete:/incomplete-downloads \
  --restart unless-stopped \
  linuxserver/sabnzbd

# docker run -it --net=container:vpn -d linuxserver/sabnzbd
docker start sabnzbd

sleep 3s
echo "checking ports."
docker port sabnzbd

echo "Creating dirs and setting permissions"
docker exec -it sabnzbd mkdir -p /docker/sabnzbd/config
docker exec -it sabnzbd chmod u=rwx,g=rwx,o=rwx /docker/sabnzbd/config
docker exec -it sabnzbd ls -lah /docker/sabnzbd/

echo "Check SABnzbd access at localhost:8080"
echo "Tell sonarr to look at the following mynet port:"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sabnzbd

echo "Done."

