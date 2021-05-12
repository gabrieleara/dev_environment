# Docker Development Environments

A set of Docker environments with my typical development configurations.

For info about these containers refer to the original [GitHub
repo](https://github.com/gabrieleara/dev_environment).

# Brief Description

This repo contains some Docker environments that I typically use for development
and day to day operations on projects and papers.

Each branch corresponds to a different image tag for the
`gabrieleara/dev_environment` image on
[DockerHub](https://hub.docker.com/r/gabrieleara/dev_environment).

In each branch you will find a dedicated directory with:
 - the `Dockerfile` used to build the image;
 - the `devcontainer.json` that I typically use as base for [VSCode Dev
   Containers](https://code.visualstudio.com/docs/remote/create-dev-container);
 - other optional resources that depend on the environment in question
   (Makefiles, and other stuff).
