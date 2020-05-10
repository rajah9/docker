# initialize docker with volumes
docker volume create mymediavol
docker volume create myconfigvol
docker container create --name myMediaBox -it \
 --restart=always \
 --mount source=mymediavol,target=/media \
 --mount source=myconfigvol,target=/etc \
 busybox

# docker run -it -v /media --name mymediavol ubuntu bash

# initialize network
docker network create mynet

# Start the new container
docker container start myMediaBox

echo "volume /media created."

echo "type docker exec -it myMediaBox sh and enter these"

# Executed these inside the bash shell:
#   cd /media
#   mkdir incomplete
#   mkdir complete
#   mkdir complete/tv
#   mkdir complete/movies

