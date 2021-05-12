# Docker Development Environments

A set of Docker environments with my typical development configurations.

For info about these containers refer to the original [GitHub
repo](https://github.com/gabrieleara/dev_environment).

# Linux Kernel Development Environment

A Linux Kernel development docker container based on VSCode C++ Dev Container,
with some additional tools. Supports running Qemu-KVM inside the docker
container (assuming that you run it using the configuration in the
`devcontainer.json` file).

The correct link to prebuilt images for the linked Dockerfile is:
```
gabrieleara/dev_environment:kernel
```

The [devcontainer.json](devcontainer.json) file shows typical settings that I
use on dev containers that use the image provided by the linked Dockerfile.
