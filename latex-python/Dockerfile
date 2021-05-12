# -------------------------------- Base Image -------------------------------- #

# Based on my LaTeX Dev Environment, see that other image for details

FROM gabrieleara/dev_environment:latex

# -------------------- Frequently Used Development Tools --------------------- #

# This image contains miniconda and some basic tools that are useful for data
# handldling and visualization

# Additional dependencies for miniconda and other libraries
RUN export DEBIAN_FRONTEND=noninteractive && apt update \
    && apt -y install \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    git \
    libgtk2.0-dev \
    && apt -y autoremove \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/*

# Miniconda path
ENV PATH /opt/conda/bin:$PATH

# Leave these args here to better use the Docker build cache
ARG CONDA_VERSION=4.7.12
ARG CONDA_HASH=a23fcffe97690d3bbcd34cda798c3a3318e0f35d863c5d4aca3fc983fe8450b7

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -O miniconda.sh \
    && echo "${CONDA_HASH}  miniconda.sh" > miniconda.hash \
    && if ! sha256sum --status --check miniconda.hash; then exit 1; fi \
    && mkdir -p /opt \
    && bin/bash miniconda.sh -b -p /opt/conda \
    && rm miniconda.sh miniconda.hash \
    && opt/conda/bin/conda clean -tipsy \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.zshrc \
    && echo "conda activate base" >> ~/.zshrc \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && /opt/conda/bin/conda clean -afy

# This is fundamental for later using this in a VSCode Dev Container
RUN chown -R 1000:1000 /opt/conda

# Packages that are useful for data management and plotting
RUN /opt/conda/bin/conda update -n base -c defaults conda \
    && opt/conda/bin/conda install -y \
    numpy \
    pandas \
    matplotlib \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && /opt/conda/bin/conda clean -afy
