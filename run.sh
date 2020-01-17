#!/bin/sh
#
# --privileged for access to /dev
# persistent storage for
# /etc/glusterfs: configs
# /var/lib/glusterd: volumes
# /var/log/glusterfs: logs
# /tank/brick1 ,,, : brick(s) -- gluster will cry about them in /, force it
#
sudo docker run -d \
    --name devuan-gluster \
    --privileged=true \
    --net=host \
    --restart unless-stopped \
    -v /etc/glusterfs:/etc/glusterfs:z \
    -v /tank/gluster_var:/var/lib/glusterd:z \
    -v /tank/gluster_logs:/var/log/glusterfs:z \
    -v /tank/brick1:/brick1 \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /dev/:/dev \
    devuan-gluster-4.1.5
