# rpi-build
Docker environment to build meta-raspberrypi with yocto

## Quick Start

Requirement: `docker`, `docker compose`

1. git clone

```bash
git clone https://github.com/kyoush/rpi-build.git # this repo
git submodule update --init # clone submodule
```

2. Start Docker

```bash
docker compose up -d # build docker
docker exec -it yocto-builder bash # dive docker container, enjoy!
```

3. Mount NFS server (Yocto cache)

```bash
$ sudo service rpcbind start # for nfs mount
$ sudo service nfs-common start # for nfs mount
$ sudo mkdir /mnt/yocto
$ sudo mount <host>:<path> /mnt/yocto # for yocto cache
```

4. bake image

```bash
$ source poky/oe-init-build-env build
$ bitbake core-image-base
```

5. write image to SD card

```bash
$ sudo bmaptool copy core-image-base-raspberrypi5.rootfs.wic.bz2 /dev/mmcblk0
```

## Issue

- ホストPC上でapparmorが有効化されていると、permissionエラーでビルドできない。

`WORKAROUND`: \
カーネルコマンドラインオプションに、`apparmor=0`を追加する。\
GRUB例。`/etc/default/grub`

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash apparmor=0"
```

grubの設定を更新して、再起動する

```bash
sudo grub-update
reboot
```

```bash
sudo aa-status # 無効化されているかどうか確認できる
```
