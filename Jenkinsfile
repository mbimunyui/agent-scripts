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
                sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible',
                    transfers: [ sshTransfer(flatten: false,
                                 remoteDirectory: './',
                                 sourceFiles: 'packages_$(BUILD_NUMBER).zip'
                    )])
                  ])
                   
                  // Execute commands
                  sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible',
                    transfers: [ sshTransfer(execCommand: command    )])])
                     
            }
            
            
        }
        
        
       
        
    }
}
