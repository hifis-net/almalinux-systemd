# Systemd AlmaLinux Container Images For Ansible and Podman

Systemd AlmaLinux Container Images for testing roles with Molecule and Podman.
Supported AlmaLinux versions:

* `10`
* `9`
* `8`

## Available Images

Images are built weekly via GitHub Actions and can be downloaded from the
GitHub Package Registry.

These tags are available. They are updated on changes to the `main` branch
and are automatically rebuilt once a week.

* `ghcr.io/hifis-net/almalinux-systemd:10`
* `ghcr.io/hifis-net/almalinux-systemd:9`
* `ghcr.io/hifis-net/almalinux-systemd:8`

## How to Use

* [Install Podman](https://podman.io/getting-started/installation)
* Run the container via Podman:

  ```bash
  podman run -it --systemd=true --privileged ghcr.io/hifis-net/almalinux-systemd:10
  ```

## Authors

This project is maintained by [HIFIS](https://www.hifis.net).
It is built upon https://github.com/geerlingguy/docker-rockylinux9-ansible.
