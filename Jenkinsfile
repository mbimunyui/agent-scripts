pipeline {
    agent any
    stages {
        stage ('Inits') {
            steps {
                echo 'Starting archieve'
            }
        }
        stage('Build'){
            steps {
                sh 'zip packages_$(BUILD_NUMBER).zip *'
            }
        }
        stage('Deploy'){
            steps {
                sh 'cp packages_$(BUILD_NUMBER).zip /home/ec2-user/newvolume'
            }
        }
        
        
    }
}
