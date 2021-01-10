FROM debian:buster-slim
COPY setup/ /tmp
RUN echo "deb http://deb.debian.org/debian buster-backports main" | sudo tee /etc/apt/sources.list.d/backports.list &&
  sudo apt update &&
  sudo apt-get install -y \
    linux-headers-"$(uname -r)" \
    wireguard \
    wireguard-dkms \
    wireguard-tools
EXPOSE 51280/udp 9091
VOLUME /etc/wireguard /data
CMD python /app/app.py