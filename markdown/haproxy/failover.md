# Failover

HAProxy has failover!

```
backend mybackend
    server s1 10.0.0.101:80 check
    server s2 10.0.0.102:80 check
    server s3 10.0.0.103:80 check backup
    server s4 10.0.0.104:80 check backup
 ```

 In the above config `s1` and `s2` are the primary servers.  They have the `check` keyword turned on which turns on healthchecking.  If both fail then `s3` is pulled into rotation.  If `s3` fails then it will pull `s4` into rotation.  Finally, if `s4` fails it will return a http status code `503 SERVICE UNAVAILABLE`.

## Reference

* [HAProxy Failover](https://www.haproxy.com/blog/failover-and-worst-case-management-with-haproxy/)