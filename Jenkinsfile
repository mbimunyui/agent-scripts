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
                sh 'zip packages_${currentBuild.number}.zip *'
            }
        }
        stage('Deploy'){
            steps {
                sh 'cp packages_${currentBuild.number}.zip /home/ec2-user/newvolume'
        
        
    }
}
