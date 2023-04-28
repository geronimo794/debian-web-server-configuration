#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh






# Install docker
# apt-get install \
#     ca-certificates \
#     curl \
#     gnupg
# install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# chmod a+r /etc/apt/keyrings/docker.gpg

# # Add repo to sourcelist
# echo \
# "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
# "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
# tee /etc/apt/sources.list.d/docker.list > /dev/null

# # Do repo update
# apt-get update

# # Install docker
# apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# # Test docker container
# docker run hello-world