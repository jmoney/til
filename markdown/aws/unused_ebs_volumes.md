# Unused EBS Volumes

Using the AWS cli it is possible to grab all the unused AWS volumes in an account/region pair.

```bash
aws ec2 describe-volumes --filters Name=status,Values=available  | jq .
```

The above looks for all EBS volumes in the available state, but are not `in-use` or attached to an instance, and returns them all in JSON format.  There are several states to look up.

- creating: Currently being created and initialized
- available: Available for use but not currently in use
- in-use: Currently being used or attached to an ec2 instance.
- deleting: Currently being deleted
- deleted: Has been deleted and AWS will reap shortly
- error: Some error has occured with the volume
