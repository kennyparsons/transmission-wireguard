FROM debian:buster-slim
COPY setup/ /tmp
RUN echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/backports.list && apt-get update && apt-get install -y linux-headers-"$(uname -r)" wireguard wireguard-dkms wireguard-tools
EXPOSE 51280/udp 9091
VOLUME /etc/wireguard /data
CMD ["wg-quick up wg0"]