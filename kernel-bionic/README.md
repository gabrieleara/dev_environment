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

The content of this directory should not be necessary if the prebuilt image is
used. If using the Dockerfile to build the container from scratch, include the
content of this directory in the `.devcontainer` directory in your project.

Even when using the prebuild image like mentioned before, you can add scripts
that are run during the container initialziation by placing them inside the
'/opt/startup-scripts` folder inside the container.

To run arbitrary commands inside this container, use the `docker run` with the
`--cmd` option to pass the command and parameters. This is necessary because for
reasons that I don't want to elaborate at this moment the container must use a
custom entry point. To get a live shell use `--cmd bash`.
