FROM registry.gitlab.com/paddy-hack/devuan/slim:latest

# gluster 3.8.8 from main

#RUN apt-get update && \
#    DEBIAN_FRONTEND=noninteractive apt-get -y -qq install glusterfs-server glusterfs-client procps kmod

# gluster 4.5.1 from backports

RUN echo 'deb http://deb.devuan.org/merged ascii-backports main' >> /etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -t stable-backports -y -qq install glusterfs-server glusterfs-client procps kmod

#ENTRYPOINT ["/usr/sbin/glusterd", "--no-daemon"] 

COPY ./starup.sh /
ENTRYPOINT ["/bin/sh", "/startup.sh"] 
