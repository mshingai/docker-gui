ARG TAG="20.04"
FROM ubuntu:$TAG
ARG USER="user"

# Install sudo ubuntu-desktop
RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y sudo ubuntu-desktop

# User add, sudo setting
RUN useradd -m -G sudo $USER -s /bin/bash && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown ${USER}:$USER -R /home/$USER

# Container user, workdir setting
USER $USER
ENV HOME /home/$USER
WORKDIR /home/$USER