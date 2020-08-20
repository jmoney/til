# What user owns tables in a schema

Ever wonder what users own tables in a schema?  Well, this is how you do it in postgres

```sql
select t.table_name, t.table_type, c.relname, c.relowner, u.usename
from information_schema.tables t
join pg_catalog.pg_class c on (t.table_name = c.relname)
join pg_catalog.pg_user u on (c.relowner = u.usesysid)
where t.table_schema='public';
```

In the query above replace `public` with whatever schema is of interest.
