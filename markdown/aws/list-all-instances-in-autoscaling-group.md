# List All Instances in Autoscaling Group

```bash
(export NAME=ASG_NAME; aws --profile dev-admin --region us-east-1 autoscaling describe-auto-scaling-groups --auto-scaling-group-names ${NAME} | jq -r '.AutoScalingGroups[].Instances[].InstanceId')
```
