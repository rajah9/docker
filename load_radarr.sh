# pull and start Radarr

docker create --name=radarr --restart=unless-stopped -p 7878:7878 \
-e PUID=1000 -e PGID=1000 \
-v /docker/radarr/config:/config -v /docker/radarr/movies:/movies \
-v /docker/radarr/downloads:/downloads linuxserver/radarr
echo "starting radarr."

# docker run -it --net=container:vpn -d linuxserver/radarr
docker start radarr

sleep 3s
echo "Creating some directories within the container"
docker exec -it radarr mkdir -p /docker/radarr/config
docker exec -it radarr mkdir -p /docker/radarr/downloads
docker exec -it radarr mkdir -p /docker/radarr/tv

echo "Setting the permissions"
docker exec -it radarr chmod u=rwx,g=rwx,o=rwx /docker/radarr/config
docker exec -it radarr chmod u=rwx,g=rwx,o=rwx /docker/radarr/downloads
docker exec -it radarr chmod u=rwx,g=rwx,o=rwx /docker/radarr/tv
docker exec -it radarr ls -lah /docker/radarr

echo "Please test radarr at http://127.0.0.1:7878/"
echo "Done."
