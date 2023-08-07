# Replication Lag Logical Slots

This query will calculate the number of bytes between the current LSN and the confirmed LSN reported by the slot.

```sql
SELECT slot_name,
    confirmed_flush_lsn,
    pg_current_wal_lsn(),
    (pg_current_wal_lsn() - confirmed_flush_lsn) AS lsn_distance
FROM pg_replication_slots;
```
