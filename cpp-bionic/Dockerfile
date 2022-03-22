# -------------------------------- Base Image -------------------------------- #

# Based on VSCode C++ Dev Container Ubuntu 20.04 Focal version

ARG VARIANT="bionic"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# -------------------- Frequently Used Development Tools --------------------- #

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
    && apt-get -y install \
    silversearcher-ag \
    expect \
    doxygen \
    graphviz \
    colordiff \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

# Function that I use to search for stuff in the project
RUN echo '\n\
    function search(){\n\
    if [ $# -lt 1 ]; then\n\
    ag\n\
    else\n\
    unbuffer ag --noheading "$@" | less -r\n\
    fi\n\
    }' >/tmp/searchfun.tmp \
    && cat /tmp/searchfun.tmp >> /home/vscode/.bashrc \
    && cat /tmp/searchfun.tmp >> /home/vscode/.zshrc \
    && rm -f /tmp/searchfun.tmp
