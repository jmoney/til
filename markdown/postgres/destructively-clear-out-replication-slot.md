# Destructively Clear Out Replication Slot

> This is not to  be done in a production environment.

```sql
SELECT slot_name FROM pg_replication_slots WHERE slot_name = 'slot_name'; -- ensure slot eists
SELECT pg_drop_replication_slot('slot_name'); -- Drop slot
SELECT slot_name FROM pg_replication_slots WHERE slot_name = 'slot_name';  -- ensure slot does not exists
-- Wait for some specified amount of time for WAL files to clear
SELECT pg_create_logical_replication_slot('slot_name', 'wal2json'); -- create new logical slot and hookup wal2json plugin
SELECT slot_name FROM pg_replication_slots WHERE slot_name = 'slot_name'; -- ensure slot eists
```

The above is useful for clearing out WAL files in RDS if the WAL reader fell behind and we just want to get the wal reader to the end of the WAL.  Usually waiting 5 to 10 minutes is good enough to clear out all the obsolete WAL files.  Running the query in [Disk Space Queries](./disk-space-queries.md) should be a good gauge if the WAL files are deleted.
