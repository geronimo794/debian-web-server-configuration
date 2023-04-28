#!/bin/bash

# Install docker by recomended install recomendation
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker run hello-world