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

# UbunutuLabSetUp.sh

This repository documents the setup and configuration of my Ubuntu VM used for coursework and lab practice.
The VM is configured as a development and database environment with remote access enabled.
## Features
- **Remote Access**: XRDP + Remmina for full desktop sessions at 1920x1080 resolution.
- **Database**: MySQL Server installed and secured, with a dedicated coursework user.
- **GUI Tools**: MySQL Workbench for schema design and query practice.
- **Development Stack**:
  - Python3 + pip for scripting
  - Bash shell with custom aliases
  - VSCodium for coding and project work
- **Spice/QXL Integration**: Guest tools installed for improved VM graphics and responsiveness.

# system-report.sh

Generates a concise system information report. It prints OS details, uptime, CPU, RAM, disks, video card, host IP, gateway, DNS, logged-in users, disk space, process count, load averages, listening ports, and firewall status.
On laptops, it also reports battery health by comparing the current full charge to the design capacity. On desktops or virtual machines, it will indicate that no battery is detected.
