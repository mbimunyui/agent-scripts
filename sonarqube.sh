if [ $USER != root ]
then

        sudo yum update -y
        echo " installing java "
        sleep 3
        sudo yum install java-11-openjdk-devel -y
        sudo yum install java-11-openjdk -y      

    echo " installing wget ..."
        sleep 3
        sudo yum install wget -y
   clear
        echo "installing unzip..."
        sleep 3
        sudo yum install unzip -y
     clear
    cd /opt
        echo "downloaing sonarsource.."
        sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip 
        sudo unzip /opt/sonarqube-9.3.0.51899.zip
        sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
        cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
         ./sonar.sh start 
        if [ $? -eq 0 ]
        then
                echo "sonarqube install successfully"
        else
                echo "something went wrong"
        fi
else
        echo "You need to run this script as a regular user"
fi
