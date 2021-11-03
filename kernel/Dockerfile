# -------------------------------- Base Image -------------------------------- #

# Based on my C/C++ Dev Environment

FROM gabrieleara/dev_environment:cpp

# -------------------- Frequently Used Development Tools --------------------- #

# Development tools typically needed for building the Linux kernel itself
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
    && apt-get -y install \
    git \
    build-essential \
    module-assistant \
    libncurses-dev \
    gawk \
    flex \
    bison \
    openssl \
    libssl-dev \
    dkms \
    libelf-dev \
    libudev-dev \
    libpci-dev \
    libiberty-dev \
    autoconf \
    bc \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

# TODO: copy some scripting tools useful for kernel development only

ENV NO_AT_BRIDGE=1

# Qemu-KVM, needed for testing kernels inside a VM
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
    && apt-get -y install \
    iptables \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libvirt-daemon-system \
    qemu-kvm \
    virtinst \
    virt-viewer \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    packagekit-gtk3-module \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
# python-gi \
# python-ipaddr \

# TODO: copy some more tools useful to running stuff inside Qemu-KVM

COPY ./start.sh /start.sh
COPY ./startup-scripts /opt/startup-scripts

ENTRYPOINT ["/start.sh"]
CMD ["/bin/sh", "-c", "while sleep 1000; do :; done"]
