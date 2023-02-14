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
                sh 'zip packages.zip *'
            }
        }
        stage ('deploy') {
            steps {
                sh 'sudo cp packages.ZIP /home/ec2-user/newvolume'
            }
    
        }
        
    }
}
