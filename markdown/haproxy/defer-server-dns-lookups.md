# Defer Server DNS lookups

By default, HAProxy on start up will resolve all server DNS entries before the process is ready for traffic.  To turn off this behavior add `init-addr none` to you server line.

```bash
backend my_backend
    server my_server www.example.com:80 init-addr none
```