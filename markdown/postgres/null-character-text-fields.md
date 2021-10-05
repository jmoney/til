# Null Character Text Fields

Postgres does not support the NULL character being inserted into text fields.  They need to be preprocessed before being inserted into the table or a trigger that strips the `0x00` character which filters the column before writing into the text field.

## Preprocess

In Python it is simple to preprocess the text line to replace all NULL characters.

```python
writer = csv.DictWriter(f_out, fieldnames=fields)
for line in f_in:
    writer.writerow(line.replace(b'0x00', b'')) # strip any null bytes sequence in the stream file and write the row
```

Then a `COPY "table" FROM STDIN CSV HEADER` can be issued piping in the file written above to psql.

## Before Trigger

The following function and trigger are examples of how to pre-process the column before storing into the table.

```sql
CREATE OR REPLACE FUNCTION blob2text() RETURNS void AS $$
DECLARE
    i integer;
BEGIN
    --  find 0x00 and replace with space    
    i := position(E'\\000'::bytea in NEW.text_field);
    WHILE i > 0 LOOP
        NEW.text_field := set_byte(NEW.text_field, i-1, 20);
        i := position(E'\\000'::bytea in NEW.text_field);
    END LOOP

    NEW.text_field = encode(NEW.text_field, 'escape');

END; $$ LANGUAGE plpgsql; 
```

Then you would just need to create the trigger.

```sql
CREATE TRIGGER pre_process_null_character
    BEFORE INSERT OR UPDATE ON table
    FOR EACH ROW
    EXECUTE PROCEDURE blob2text();
```

## References

* [SQL SYNTAX STRING UESCAPE](https://www.postgresql.org/docs/9.1/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS-UESCAPE)
* [Stackoverflow](https://stackoverflow.com/questions/1347646/postgres-error-on-insert-error-invalid-byte-sequence-for-encoding-utf8-0x0)
