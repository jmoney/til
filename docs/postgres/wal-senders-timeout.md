# WAL Sender Timeout

> wal_sender_timeout (integer)
Terminate replication connections that are inactive longer than the specified number of milliseconds. This is useful for the sending server to detect a standby crash or network outage. A value of zero disables the timeout mechanism. This parameter can only be set in the postgresql.conf file or on the server command line. The default value is 60 seconds.

The following will show what the current value is for the `wal_sender_timeout`.

```sql
SHOW wal_sender_timeout;
```

The following will update the current value for `wal_sender_timeout` to 0 which disables the timeout.

```sql
ALTER SYSTEM SET wal_sender_timeout TO 0;
```
