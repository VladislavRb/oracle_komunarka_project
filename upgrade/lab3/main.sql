SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME_ = &&1
connect &&USER_NAME_/oracle

SET SERVEROUTPUT ON

PROMPT Username: &&USER_NAME_
PROMPT
PROMPT Calling tables creating
@table_folder/create_product.sql &&USER_NAME_ 
@table_folder/create_nutritional_value.sql &&USER_NAME_ 
@table_folder/create_ingredients.sql &&USER_NAME_ 
@table_folder/create_box.sql &&USER_NAME_ 
@table_folder/create_storage.sql &&USER_NAME_ 
@table_folder/create_transport.sql &&USER_NAME_ 
@table_folder/create_customer.sql &&USER_NAME_ 
@table_folder/create_batch.sql &&USER_NAME_ 
@table_folder/create_batch_content.sql &&USER_NAME_ 
PROMPT
PROMPT Calling insert scripts
@insert_folder/insert_product.sql
@insert_folder/insert_nutritional_value.sql
@insert_folder/insert_ingredients.sql
@insert_folder/insert_box.sql
@insert_folder/insert_storage.sql
@insert_folder/insert_transport.sql
@insert_folder/insert_customer.sql
@insert_folder/insert_batch.sql
@insert_folder/insert_batch_content.sql
PROMPT

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME_
SPOOL OFF
