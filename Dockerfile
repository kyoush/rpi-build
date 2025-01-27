# syntax=docker/dockerfile:1
FROM ubuntu:24.04
ENV DEBIAN_FRONTEND nointeractive
WORKDIR /src

RUN apt update && apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
RUN apt install -y neovim cifs-utils samba-client avahi-daemon sudo nfs-common nfs-kernel-server
RUN apt autoremove --purge -y

RUN locale-gen en_US.UTF-8
ENV LC_ALL	en_US.UTF-8
ENV LANG	en_US.UTF-8
ENV LANGUAGE	en_US.UTF-8

ARG USERNAME
# RUN useradd -aGsudo $USERNAME
RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /run/sendsigs.omit.d/rpcbind

USER $USERNAME
WORKDIR /home/$USERNAME

COPY services.sh /sbin/services.sh
CMD ["/sbin/services.sh"]
