# Dynamic References CFN

Cloudformation can resolve properties from certain resources via [dynamic reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/dynamic-references.html) syntax.  Example is

```json
"{{resolve:secretsmanager:MyRDSSecret:SecretString:username}}"
```
