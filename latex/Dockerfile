# -------------------------------- Base Image -------------------------------- #

# Based on VSCode Dev Container Ubuntu 20.04 Focal version

ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# -------------------- Frequently Used Development Tools --------------------- #

# LaTeX Build Tools
RUN export DEBIAN_FRONTEND=noninteractive && apt update \
    && apt -y install --install-recommends \
    make \
    texlive-latex-extra \
    texlive-publishers \
    texlive-science \
    texlive-lang-all \
    texlive-xetex \
    texlive-bibtex-extra \
    biber \
    ghostscript \
    poppler-utils \
    && apt -y autoremove \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/*
