# pull and start Sonarr

docker create --name=sonarr --restart=always -p 8989:8989 \
--network mynet \
-e PUID=1001 -e PGID=1001 -v /dev/rtc:/dev/rtc:ro \
-v /etc:/config \
-v /media/complete/tv:/tv \
-v /media/complete:/downloads \
 linuxserver/sonarr
echo "starting sonarr."

# docker run -it --net=container:vpn -d linuxserver/sonarr
docker start sonarr

echo "Please test sonarr at http://127.0.0.1:8989/"
echo "Done."
