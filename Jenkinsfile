@Library('github.com/releaseworks/jenkinslib')

pipeline {
   agent any
   stages {
        stage ('Setting up AWS Creds') {
            steps {
                       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws_credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                       AWS("--region=us-east-1 aws cloudformation validate-template --template-body template.yaml")
                        } 
                    }
                 }
             }
        }
