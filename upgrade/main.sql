SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME__ = &&1

SET SERVEROUTPUT ON

PROMPT Username: &&USER_NAME__
connect &&USER_NAME__/oracle 
PROMPT 
PROMPT Create tables and insert start values
@lab3/main.sql &&USER_NAME__
PROMPT
PROMPT Drop start values, insert new values and create all data view
@lab3_check/main.sql &&USER_NAME__
PROMPT

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME__
SPOOL OFF
