# PGPASSWORD

To pass a password to `psql` without using the iteractive promp use the `PGPASSWORD` environment variable.

```bash
PGPASSWORD=password psql --host localhost --port 5432 --username admin -d public -f script.sql
```
