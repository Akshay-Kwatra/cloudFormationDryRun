pipeline {
   agent any
   stages {
      
        stage ('Setting up AWS Creds') {
            steps {
               withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                     echo "Hello world!"
                     sh "who"
                     sh "aws --version"
                     sh "aws cloudformation validate-template --region us-east-1 --template-body file://template.yaml"
                     sh "aws cloudformation create-change-set --region us-east-1 --stack-name my-application --change-set-name my-change-set --template-body file://template.yaml --change-set-type CREATE"
                     sh "aws cloudformation describe-change-set --region us-east-1 --change-set-name my-change-set --stack-name my-application | jq '.Changes'| tee cfn_plan.json"
                   }
               }
          }
      }
 }
