# pull and start Couch Potato

docker create --name=couchpotato --restart unless-stopped \
-p 5050:5050 \
--network mynet \
-e TZ=America/New_York \
-e PUID=1000 -e PGID=1000 \
-e UMASK_SET=022 \
-v /etc:/config \
-v /media/complete/movies:/movies \
-v /media/complete:/downloads \
 linuxserver/couchpotato
echo "starting couchpotato."

# docker run -it --net=container:vpn -d linuxserver/sonarr
docker start couchpotato

echo "Please test couchpotato at http://127.0.0.1:5050/"
echo "Done."
