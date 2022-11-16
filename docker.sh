#!/bin/bash
#...Author: Mbimunyui Emmanuel
#...Date: OCT. 23th 2022

###This script will installed Docker on centOS7....

#### you must be root to run this file

if [ $USER = root ]
then
	type=$(hostnamectl | grep "Operating System" | awk '{print $3}')
    #######...STARTING INSTALLATION FOR CENTOS.......
    if [ $type = "CentOS" ] || [ $type = "Oracle" ] || [$type = "Fedora" ]
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
	sleep 4
	clear
	
	###..Installing docker-compose...
		echo "Installing docker-compose...."
	sleep 3
	sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

		sudo chmod +x /usr/local/bin/docker-compose
		docker -v
		docker-compose --version

####...END INSTALLATION FOR CENTOS....

####...STARTING INSTALLATION FOR UBUNTU...
	elif [ $type = "Ubuntu" ] || [$type = "Debian" ]
	then
		echo "installing docker for ubuntu"
		sleep 3
		echo "updating your system....."
		sleep 3
		sudo apt-get update
		sudo apt-get install \
    	ca-certificates \
    	curl \
    	gnupg \
   		 lsb-release
		 clear
		 echo "adding docker official GPG key...."
		 sleep 3
		 sudo mkdir -p /etc/apt/keyrings
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		clear
		echo "setting up docker repository..."
		sleep 3
		echo \
 		 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  		$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		clear
		echo "Installing Docker Engine"
		sudo apt-get update
		sudo chmod a+r /etc/apt/keyrings/docker.gpg
		sudo apt-get update
		sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
		clear
		echo "testing docker with hello-world..."
		sleep 3
		
		
	

	else
		echo "Please make sure you are running CentOS, Oracle or Ubuntu...."
		sleep 6
		exit 1
	fi


else 
echo "you are not root"
fi