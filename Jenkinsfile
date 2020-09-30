pipeline {
   agent any
   stages {
        stage ('Setting up AWS Creds') {
            steps {
               withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'akshay1234', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                     echo "Hello world!"
                     sh "aws s3 ls"
                   }
               }
          }
      }
 }
