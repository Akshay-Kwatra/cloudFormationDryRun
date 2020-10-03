pipeline {
   agent any
   stages {
      
        stage ('Setting up AWS Creds') {
            steps {
               withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                     sh "aws cloudformation validate-template --template-body file://template.yaml --region us-east-1"
                     sh "aws cloudformation create-change-set --region us-east-1 --stack-name my-application --change-set-name my-change-set --template-body file://template.yaml --change-set-type CREATE"
                     sh "aws cloudformation describe-change-set --region us-east-1 --change-set-name my-change-set --stack-name my-application | jq '.Changes'| tee cfn_plan.json"
                   }
               }
          }
      
        stage ('Approval Stage') {
            steps {
               timeout(time: 2, unit: “HOURS”) {
                  input message: ‘Approve Deploy?’, ok: ‘Yes’
               }
           }
           
        }
       
      }
 }
