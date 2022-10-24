#!/bin/bash
#...Author: Mbimunyui Emmanuel
#...Date: OCT. 23th 2022

###This script will installed Docker on centOS7....

#### you must be root to run this file

if [ $USER = root ]
then
	
	clear
	echo "uninstallin old docker if available"
### Removing old docker...
	sudo yum install yum-utils -y
	sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
				  
##### Setting up Docker repository
	
	echo ""
	echo "Setting up docker repository"
	sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
   
####Installing the latest version of docker
echo " "
echo "Installing the latest version of docker"

	sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
	
	echo "Stating docker"
	sleep 3
	sudo systemctl start docker
echo ""
echo "testing docker"
sudo docker run hello-world
else 
echo "you are not root"
fi