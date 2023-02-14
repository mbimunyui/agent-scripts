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
        
        
       
        
    }
}
