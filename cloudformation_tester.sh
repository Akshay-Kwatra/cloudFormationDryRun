aws cloudformation validate-template --template-body template.yaml
aws cloudformation create-change-set --stack-name my-application --change-set-name my-change-set --template-body file://template.yaml --change-set-type CREATE
aws cloudformation describe-change-set --change-set-name my-change-set --stack-name my-application | jq '.Changes'| tee cfn_plan.json
