#!/bin/sh
#
# all this does is create /dev/fuse if not already exists
#

[ -c /dev/fuse ] || mknod /dev/fuse c 10 229
exec /usr/sbin/glusterd --no-daemon
