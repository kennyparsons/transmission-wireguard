FROM debian:buster-slim
COPY setup/ /tmp
COPY entrypoint.sh /
RUN echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/backports.list && apt-get update && apt-get install -y linux-headers-"$(uname -r)" wireguard wireguard-tools iproute2 curl && chmod +x /entrypoint.sh
EXPOSE 51820/udp 9091
VOLUME /etc/wireguard /data
CMD ["/entrypoint.sh"]