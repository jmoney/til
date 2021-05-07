# Base64

To `base64(sha1(string))` where the padding is removed AND base64 encoding the raw bytes and not the hex string run

```bash
echo -n foo | openssl dgst -binary -sha1 | openssl base64 -A | tr -d '='
```
