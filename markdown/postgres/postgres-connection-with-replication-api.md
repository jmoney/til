# Postgres Connection with Replication Api

If the connection has the replication api enabled then normal queries are blocked on the `WalSenderWaitForWAL` wait_event.

![PostgresWalWaitEvent](./PostgresWalWaitEvent.png)