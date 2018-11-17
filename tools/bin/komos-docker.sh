#!/usr/bin/bash
# Install on Debian 9/Ubuntu 18.04+

# ensure there are no older packages of docker
sudo apt-get remove docker \
     docker-engine docker.io

# Install dependency packages
sudo apt-get install \
     software-properties-common \
     ca-certificates \
     apt-transport-https

# Import official Docker gpg key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker-ce stable repository
# add deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
# to /etc/apt/sources.list
sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) \
 stable"

# Update apt index and install docker
sudo apt-get update
sudo apt-get install docker-ce

# Start and Enable Service to start on Boot
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl is-enabled docker

# Using Docker on Ubuntu 18.04
# sudo docker pull ubuntu:18.04

# Using Docker on Debian
# sudo docker pull debian:9

# Check images added
# sudo docker images

# Create a container from Docker image
# docker run -it --rm --name ubuntu-cont ubuntu:18.04 /bin/bash

: <<'END'
The options used are:

    -it : Get interactive shell session
    --rm : This instructs docker to delete container on exit
    --name: Used to specify the name of the container. The name given is ubuntu-cont
    ubuntu:18.04: This is the name of docker image we're creating a container from
    /bin/bash : Command to execute on the container

If you exit from container shell using exit command or ctrl+d
END

#######
# Use docker without sudo

sudo setfacl -m user:$USER:rw /var/run/docker.sock
