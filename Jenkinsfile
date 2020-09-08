def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_credentials']]

pipeline {
   agent any
   
   options {
      withCredentials(awsCredentials)
   }
   stages {
        stage ('Setting up AWS Creds') {
            steps {
                script {
                sh './cloudformation_tester.sh'
           }
        }
     }
  }
}
