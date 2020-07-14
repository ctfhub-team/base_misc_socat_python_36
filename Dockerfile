FROM python:3.6-slim-stretch

LABEL Organization="CTFHUB" Author="Virink <virink@outlook.com>"

ENV LANG="C.UTF-8" COMMAND="./app.py"

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
    sed -i 's/# deb-src/deb-src/' /etc/apt/sources.list && \
    sed -i '/security/d' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get upgrade -y;

RUN apt-get install -y --no-install-recommends netbase tcpdump socat; \
    apt autoremove -y;

COPY _files /tmp

RUN mv /tmp/flag.sh /flag.sh && \
    mv /tmp/start.sh /start.sh && \
    chmod +x /start.sh && \
    # pwn home dir
    useradd -U -m ctf && \
    mkdir -p /home/ctf && \
    # pwn home dir permission
    chown -R root:ctf /home/ctf; \
    chmod -R 750 /home/ctf && \
    # clean
    apt-get clean && \
    # /var/lib/apt/lists/* 
    rm -rf /tmp/* /var/tmp/*;

WORKDIR /home/ctf

EXPOSE 10000

CMD ["/start.sh"]