#!/bin/bash

sudo service rpcbind start
sudo service nfs-common start

sudo chmod -R g+w /home/user

[[ -d /mnt/yocto ]] || sudo mkdir /mnt/yocto

echo $(whoami) > /etc/temp
echo "yes" >> /etc/temp

cat << 'EOF' > /home/user/.bashrc
#!/bin/bash

alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
EOF

bash
