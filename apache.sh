#!/bin/bash
#..Date: OCT. 23th 2022
#...Author: Mbimunyui Emmanuel
#####.....This script will install and configure apache web server

#####.....It is advisable to update your system before installing apache

if [ $USER = root ]
then

echo -e "IT IS RECOMMEDED YOU UPDATE YOUR SYSTEM BEFOR INSTALLATION OF APACHE \n Do you want to update your system [y/n] "
read option
if [ $option = y ]
then
        sudo yum update
else
        echo -e  "you have chosen not to update you system, it is not a good idea. \n installation will still continue "
        sleep 3
fi

## installing apache
clear
echo "Starting installation for apache...."
        sleep 3
        sudo yum install httpd -y
        if [ $? -eq 0 ]
        then
                echo ""
                echo "apache installed with success"
                sleep 3
        else
                echo "apache failled to install"
                sleep 3
        fi
        clear
        echo "starting apache..."
        sleep 3
        sudo systemctl start httpd
        echo " "
        echo "enabling apache..."
        sleep 3
        sudo systemctl enable httpd
        echo " "
        echo "checking status for apache"
        sudo systemctl status httpd
        sleep 10
        clear
        echo "setting up connectivity"
        echo " "
        echo "Adding port 80 for http protocol...."
        sleep 5
        firewall-cmd --zone=public --permanent --add-port=80/tcp
        echo " "
        echo "Adding port 443 for https protocol....."
        sleep 5
        sudo firewall-cmd --permanent --add-port=443/tcp
        echo " "
        echo "Reloading firewall..."
        sleep 5
        sudo firewall-cmd --reload

echo "Installation Completed"
else
clear

echo "you are not root, this will be reported"
fi