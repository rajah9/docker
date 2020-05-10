# Load NordVPN

# docker pull bubuntux/nordvpn
# docker run -ti --cap-add=NET_ADMIN --device /dev/net/tun --name vpn \

            -e CONNECT=us -e TECHNOLOGY=NordLynx -d bubuntux/nordvpn

