# What privileges are assigned to a user

```sql
SELECT grantee
      ,table_catalog
      ,table_schema
      ,table_name
      ,string_agg(privilege_type, ', ' ORDER BY privilege_type) AS privileges
FROM information_schema.role_table_grants
WHERE grantee != 'postgres'
GROUP BY grantee, table_catalog, table_schema, table_name;
```

The above query will list all users, who are not postgres, and their assigned privileges.
