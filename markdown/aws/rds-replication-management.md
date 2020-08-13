# RDS Replication Management

RDS provides an `rds_replication` role that is required for doing replication on RDS in postgres.  This role does **NOT** have the `REPLICATION` priviledge required to muck with the WAL readers.  So there must be some internal to RDS implementation that allows the replciation management.  For instance, if you log into a postgres instance with a user with the `rds_replication` role you cannnot execute the `pg_replication_slot_advance` stored procedure to move the lsn for the slot around.

* [Systems Administration](https://www.postgresql.org/docs/12/functions-admin.html)

The master user provided by RDS does not even have this role or `SUPERUSER` to grant this role.  They have `rds_superuser` which does not have the ability to grant `REPLICATION`.

* [Master User Accounts](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.MasterAccounts.html)