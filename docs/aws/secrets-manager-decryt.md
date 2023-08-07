# Secrets Manager Decrypt

Here is how to pretty print the json string stored in the `SecretString` field of the secrets manager

```bash
aws secretsmanager get-secret-value --secret-id ${SECRET_ARN} | jq .SecretString | tr -d '\\' | sed 's/^\"\(.*\)\"$/\1/' | jq .
```
