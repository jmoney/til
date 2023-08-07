# Active WAL Readers on Slot

```sql
SELECT psa.usename,
       psa.application_name,
       psa.client_addr,
       psa.datname,
       prs.slot_name,
       psa.state,
       psa.wait_event,
       prs.restart_lsn,
       prs.confirmed_flush_lsn
FROM pg_replication_slots prs
JOIN pg_stat_activity psa ON prs.active_pid = psa.pid
WHERE prs.slot_name = 'kinesis';
```
