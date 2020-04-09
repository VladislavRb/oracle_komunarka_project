-- This file is main file to upgrade schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
-- Example of run: SQL> @main.sql MMF_120_0

SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

PROMPT Enter username
DEFINE USER_NAME = &&1
PROMPT Enter tablespace name
DEFINE TABLESPACE_NAME = &&2

SET SERVEROUTPUT ON
PROMPT Username to upgrade: &&USER_NAME

connect &&USER_NAME/oracle 
-- Run our scripts

PROMPT Calling create_tables started
@create_tables.sql &&USER_NAME &&TABLESPACE_NAME
PROMPT Calling create_tables finished

PROMPT Calling insert_values started
@insert_values.sql &&USER_NAME
PROMPT Calling insert_values finished

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME

SPOOL OFF