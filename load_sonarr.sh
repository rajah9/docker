# pull and start Sonarr

docker create --name=sonarr --restart=always -p 8989:8989 \
--network mynet \
-e PUID=1000 -e PGID=1000 \
-e TZ=America/New_York \
-e UMASK_SET=022 \
-v /etc:/config \
-v /media/complete/tv:/tv \
-v /media/complete:/downloads \
 linuxserver/sonarr
echo "starting sonarr."

# docker run -it --net=container:vpn -d linuxserver/sonarr
docker start sonarr

echo "Please test sonarr at http://127.0.0.1:8989/"
echo "Don't forget to ./load_nord."
