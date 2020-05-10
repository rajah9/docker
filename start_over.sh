docker stop sonarr
docker stop nzbget
docker stop sabnzbd
docker stop vpn

# stop and remove volumes
docker container stop mymedia
docker container rm mymedia
docker volume rm mymediavol

# purge unused or dangling images
docker system prune -a
# docker rmi sonarr
# docker rmi nzbget
# docker rmi sabnzbd
# docker rmi vpn
docker images -f dangling=true
