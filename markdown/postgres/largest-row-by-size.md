# Largest Row By Size

Here is how to select the PK of the row with the largest row size.

```sql
SELECT <pk>, pg_column_size(t.*) AS row_size 
FROM <table> AS t 
ORDER BY pg_column_size(t.*) DESC 
LIMIT 1;
```

Output is something like

```plain

       pk        | row_size
------------------------+----------
        1        |   112766
 ```
