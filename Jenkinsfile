pipeline {
    agent any
    stages {
        stage ('Init') {
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
}