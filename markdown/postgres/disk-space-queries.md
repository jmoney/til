# Disk Space Queries

Here are a few queries to figure out what is consuming all the disk space in postgres

## WAL Files

```sql
select count(*) "#WAL files",
       round(sum(size) / 1024.0/1024.0/1024.0,3) as "Size (GB)",
       min(modification) "Oldest",
       max(modification) "Newest"
from pg_ls_waldir();
```

If the above query is showing substantial disk usage then run the following to determine what replication slot is behind

```sql
select *, pg_current_wal_flush_lsn() from pg_replication_slots;
```

## Really Large Tables

```sql
select nspname "Schema", relname "Table", reltuples "#Rows Est", pg_size_pretty(size) "Disk Space"
from (
    select n.nspname,c.relname,c.reltuples, pg_table_size(c.oid) size
    from pg_class c join pg_namespace n on n.oid = c.relnamespace where c.relkind = 'r'
) a
order by size desc;
```

The above will show how much disk is being consumed by tables.
