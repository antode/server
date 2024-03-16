#!/usr/bin/env bash

set -Eeuo pipefail;

printf '\n\nInstall packages...\n'
apt-get install --yes sudo openssh-server python3

useradd --groups sudo --shell /bin/bash --create-home admin
printf '\n\nUser created!\n\n'
passwd admin

sed --in-place='.backup' --regexp-extended "s/^.+PasswordAuthentication.+$/PasswordAuthentication yes/" /etc/ssh/sshd_config
printf '\n\nsshd_config changed!\n\n'

systemctl reload sshd.service
printf 'sshd.service reloaded!\n\n'

echo '# The loopback network interface
auto lo
iface lo inet loopback

auto enp6s0
iface enp6s0 inet static
    address 192.168.0.128
    network 192.168.0.0
    netmask 255.255.255.0
    broadcast 192.168.0.255
    gateway 192.168.0.1
    dns-nameservers 192.168.0.1 8.8.8.8' > /etc/network/interfaces
printf 'network/interfaces changed!\n\n'

systemctl restart networking.service
printf 'networking.service reloaded!\n\n'
