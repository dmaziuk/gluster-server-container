# gluster-server-container

-- because official images want to talk to host's `systemd` and I want to run on alpine.

This is based on `devuan` image from http://registry.gitlab.com/paddy-hack/ and run 
options from `gluster/gluster-containers`.

## caveats

  * you need stuff in `/etc/glusterfs` or `glusterd` will fail to run with 255 and
    no usable error message. Apparently at least `glusterd.vol` needs to be there,
    dunno what else.

(TODO)

  * `/dev/fuse` and running with `-v /dev --privileged=true`. Do I need this?
  * `--net=host` vs exposing ports.
