# RDS Update Configurations

The user you get by default from RDS is an "admin" user but it is not **THE** admin user. To update configuration settings, like `wal_sender_timeout`, parameter groups must be used.  If a query is executed in the console to update the configuration a permission denied will be thrown.
