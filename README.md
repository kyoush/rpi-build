# rpi-build
Docker environment to build meta-raspberrypi with yocto

## Quick Start

1. Start Docker

```
# docker compose up -d
# docker exec -it yocto-builder /bin/bash
```

1. Mount NFS server (Yocto cache)
```
$ sudo service rpcbind start
$ sudo service nfs-common start
$ sudo mkdir -p /mnt/yocto
$ sudo mount <nfsserverip>:<path> /mnt/yocto
```

2. prepare bitbake
```
$ cd ~/
$ git clone git://git.yoctoproject.org/poky
$ git clone git@github.com:agherzan/meta-raspberrypi.git
$ poky/oe-init-build-env
$ bitbake core-image-minimal
```
