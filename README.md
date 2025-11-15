# Lab Server Setup Scripts

This repository contains scripts and notes I use to set up and manage my personal lab server.  
The goal is to make installation and container usage reproducible, simple, and well-documented.

=============================================================================

# install-docker.sh

A Bash script that automates the installation of Docker CE on Ubuntu/Pop!_OS systems.

## **What it does:**
- Updates system packages
- Installs prerequisites (`ca-certificates`, `curl`, `gnupg`, `lsb-release`)
- Adds Docker’s official GPG key and repository
- Installs Docker Engine, CLI, container runtime, and Compose plugin
- Adds the current user to the `docker` group (so Docker can be run without `sudo`)
- Runs a `hello-world` test container to verify installation

# install-docker.txt

A text reference file containing variations of Docker container usage. It documents the commands for opening and closing containers in different modes:

Root containers
- Persistent: open, exit, restart, delete
- Ephemeral: open, exit, auto-delete

User containers (example: clam)
- Persistent: open, exit, restart, delete
- Ephemeral: open, exit, auto-delete

This file serves as a quick cheat sheet for managing containers with different user modes and lifecycles.
