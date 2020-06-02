SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME_ = &&1
connect &&USER_NAME_/oracle

SET SERVEROUTPUT ON

PROMPT Username: &&USER_NAME_
PROMPT
PROMPT Delete old data in tables
@delete_records.sql
PROMPT
PROMPT Create raw data table
@create_table_insert_data_from_google_table.sql
PROMPT
PROMPT Insert new data in tables from raw data
@insert_records.sql
PROMPT
PROMPT Create data view of tables
@create_data_view.sql
PROMPT
PROMPT Count data in tables
@count_num_records.sql
PROMPT

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME_
SPOOL OFF
