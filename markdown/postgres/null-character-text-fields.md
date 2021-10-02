# NULL Character Text Fields

Postgres does not support the NULL character being inserted into text fields.  They need to be preprocessed before being inserted into the table or staged in a blob column, which does support NULL characters, and filtered before writing into the text field.  A trigger can be used for the second one but makes the table schema complex having to manage that across many text fields.

## References

* [SQL SYNTAX STRING UESCAPE](https://www.postgresql.org/docs/9.1/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS-UESCAPE)
