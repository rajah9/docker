# Set up ufs

sudo ufw status verbose
sudo ufw enable
sudo ufw allow http
sudo ufw allow 8080/tcp

sudo ufw allow 9090/tcp # for sabnzbd
sudo ufw allow 6789/tcp # for nzbget
sudo ufw allow 32400/tcp # for plex

sudo ufw allow ssh
sudo ufw status verbose
