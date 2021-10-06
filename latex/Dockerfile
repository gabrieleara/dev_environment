# -------------------------------- Base Image -------------------------------- #

# Based on VSCode Dev Container Ubuntu 20.04 Focal version

ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# -------------------- Frequently Used Development Tools --------------------- #

# LaTeX Build Tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get -y install --install-recommends \
    make \
    texlive-full \
    biber \
    ghostscript \
    poppler-utils \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
