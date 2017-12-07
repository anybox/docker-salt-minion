From debian:stretch

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

ADD saltstack.asc /root/saltstack.asc
RUN apt update && apt install -y gnupg2 && apt-key add /root/saltstack.asc
ADD saltstack.list /etc/apt/sources.list.d/salstack.list

RUN apt update && apt install -y salt-minion dumb-init
VOLUME ['/etc/salt']

CMD ["/usr/bin/dumb-init", "/usr/bin/salt-minion"]
