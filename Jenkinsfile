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
        
        stage('SSH transfer') {
 script {
  sshPublisher(
   continueOnError: false, failOnError: true,
   publishers: [
    sshPublisherDesc(
     configName: "ansible",
     verbose: true,
     transfers: [
      sshTransfer(
       sourceFiles: "packages_$(BUILD_NUMBER).zip",
       
       remoteDirectory: "/home/ec2-user/ansible_workspace",
       
      )
     ])
   ])
 }
}
       
        
    }
}
