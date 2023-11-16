# Getting Ubuntu 20.04 image as a work station
FROM ubuntu:focal as ubuntu-station

# Setting env variables
ARG ARG_HOME_DIR=${HOME_DIR}
ARG UID=1000
ARG GID=1000
ARG USERNAME=dummyuser

ENV DEBIAN_FRONTEND=noninteractive

# Configuring user and group specifics
RUN groupadd -g $GID -o $USERNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $USERNAME
RUN echo "$USERNAME:pass" | chpasswd


# Installing packages
RUN apt-get update                                               && \
    apt-get upgrade -y                                           && \
    apt-get install -y git build-essential python3 python3-pip      \
    neovim sudo libcurl4-openssl-dev libssl-dev curl locate         \
    libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential       \
    libgmp-dev zlib1g-dev libffi-dev openssh-server libldns-dev     \
    wget net-tools make

# Adding the same user as the images is built with
USER ${USER_NAME}
WORKDIR /${HOME_DIR}
