# Send Command SSM

## Run command over instnces via multiple tags

```bash
aws ssm send-command --document-name "AWS-RunShellScript" --parameters 'commands=["echo hello,world"]' --targets Key=tag:tagA,Values=foo Key=tag:tagB,Values=Bar Key=tag:tabC,Values=Baz
```

Notice the space between the "Values" and the "Key" in the `--targets` option.
