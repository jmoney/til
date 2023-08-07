# Wal2Json Next LSN

Wal2Json can be configured to emit the **next lsn**.  This is particularly helpful with coupled with logging and your processor is stuck processing a particcular
lsn.  If the next lsn is logged during processing and the processor is stuck for whatever reasion the next lsn will tell you the next lsn to set in postgres such that the problematic transaction is skipped.

To enable add `-o include_lsn=true` as config to wal2json.  The default value is false as of wal2json 2.3.
