pipeline {
   agent any
   stages {
        stage ('Setting up AWS Creds') {
            when{
                branch 'master'
            } 
            steps {
                withAWS(credentials: 'aws_credentials', region: 'us-east-1') {
                sh './cloudformation_tester.sh'
           }
        }
     }
  }
}
