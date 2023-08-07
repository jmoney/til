# Postgres TLS

TThe protocol states you have to connect to it in plaintext first to ask postgres should it use TLS.  If postgres says “use tls” then it starts the tls handshake on the same port.  If no, it keeps going plaintext on the same port.  Basically, the same port for both plaintext/tls and postgres just tells the client what protocol to use.

## Example openssl command

Requires openssl >= 1.1.1

```bash
(export SERVER=<server>; export PORT=<port> ; openssl s_client -starttls postgres -connect ${SERVER}:${PORT} -showcerts)
```
