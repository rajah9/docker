# initialize docker with volumes
docker volume create mymediavol
docker volume create myconfigvol

# initialize network
docker network create \
  --driver=bridge \
  --subnet=172.28.5.0/16 \
  mynet

docker container create --name myMediaBox -it \
 --restart=always \
 --mount source=mymediavol,target=/media \
 --mount source=myconfigvol,target=/etc \
 --network mynet \
 busybox

# docker run -it -v /media --name mymediavol ubuntu bash

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

# Changing permissions for /media and below
cd /media
mkdir incomplete
mkdir complete
cd complete
mkdir tv
mkdir movies
cd /media
chmod -R 755 .

