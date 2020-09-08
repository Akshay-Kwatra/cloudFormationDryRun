def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_credentials']]

pipeline {
   agent any
   
   options {
      withCredentials(awsCredentials)
   }
   stages {
        stage ('Setting up AWS Creds') {
            steps {
                   withAwsCli(credentialsId: 'aws_credentials', defaultRegion: 'us-east-1') {
                      sh ''' aws cloudformation validate-template --template-body template.yaml'
                             aws cloudformation create-change-set --stack-name my-application --change-set-name my-change-set --template-body file://template.yaml --change-set-type CREATE'
                             aws cloudformation describe-change-set --change-set-name my-change-set --stack-name my-application | jq '.Changes'| tee cfn_plan.json'''
                       }
                    }
                 }
             }
        }
