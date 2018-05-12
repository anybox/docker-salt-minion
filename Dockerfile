FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

ADD saltstack.asc /root/saltstack.asc

RUN apt update \
    && apt install -y \
        gnupg2 \
        # to download files (likes docker-compose)
        curl \
        dumb-init \
        apt-transport-https \
        # to format and prepare btrfs volumes
        btrfs-tools \
        # to reload systemd unit on the host
        systemd \
        # to use git.latest state
        git \
    && apt-key add /root/saltstack.asc \
    # get docker client
    && curl -o docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-17.12.1-ce.tgz \
    && tar -xzf docker.tgz \
    && mv docker/docker /usr/bin/docker \
    && chmod +x /usr/bin/docker \
    && rm -rf docker*

ADD saltstack.list /etc/apt/sources.list.d/salstack.list

RUN apt update \
    && apt install -y \
        salt-minion

VOLUME ['/etc/salt']

CMD ["/usr/bin/dumb-init", "/usr/bin/salt-minion"]
