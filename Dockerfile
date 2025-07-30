ARG VERSION=8

FROM almalinux:${VERSION}
LABEL maintainer="HIFIS (https://www.hifis.net)"
ENV container=podman

# Install systemd -- See https://hub.docker.com/_/centos/
RUN rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install requirements.
ARG VERSION
RUN dnf -y install rpm dnf-plugins-core \
 && dnf -y update \
 && dnf -y install \
      epel-release \
      initscripts \
      sudo \
      which \
      hostname \
      libyaml \
 && if [ "${VERSION}" = "8" ] || [ "${VERSION}" = "9" ]; then \
      dnf -y install python3.12; \
    elif [ "${VERSION}" = "10" ]; then \
      dnf -y install python3; \
    else \
      echo "Unsupported VERSION: ${VERSION}" && exit 1; \
    fi \
 && dnf clean all

# Disable requiretty.
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

CMD ["/usr/lib/systemd/systemd"]
