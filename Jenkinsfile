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
        stage ('deploy') {
            steps {
                sh 'sudo cp packages_$(BUILD_NUMBER).ZIP /home/ec2-user/newvolume'
            }
    
        }
        
    }
}