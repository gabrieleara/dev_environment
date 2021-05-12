#!/bin/bash

(
    set -e
    set -o pipefail

    # add the correct user perms
    sudo gpasswd -a root libvirt
    sudo gpasswd -a root kvm
    sudo chown root:kvm /dev/kvm

    # create the bridge for networking
    # ip link add name virt0 type bridge
    # ip link set dev virt0 up
    # bridge link
    # ip addr add dev virt0 172.20.0.1/16
    # iptables -t nat -A POSTROUTING -s 172.20.0.1/16 -j MASQUERADE

    # start the virtlogd daemon
    exec sudo virtlogd --daemon &
)
