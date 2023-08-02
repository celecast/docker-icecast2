FROM ubuntu:focal

LABEL maintainer="Kirill Plotnikov <init@pltnk.dev>" \
      github="https://github.com/pltnk/docker-icecast2"

# install icecast2 and enable its autostart
RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/start.sh"]

EXPOSE 8000
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc