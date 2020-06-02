DEFINE USER_NAME = &&1
DEFINE TBS_LOCATION =  &&2

SET SERVEROUTPUT ON
DECLARE
    data_sql VARCHAR2(4000);
	index_sql VARCHAR2(4000);
    data_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_DATA';
    data_file_name VARCHAR2(500) := '&&TBS_LOCATION'||'\\'||data_tbs_name||'.dbf';
	index_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_INDEX';
    index_file_name VARCHAR2(500) := '&&TBS_LOCATION'||'\\'||index_tbs_name||'.dbf';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Creating new data tablespace "'||data_tbs_name||'" and index "'||index_tbs_name||'"');
    data_sql:='CREATE SMALLFILE TABLESPACE '||data_tbs_name||' DATAFILE '''||data_file_name||''' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO';
	index_sql:='CREATE SMALLFILE TABLESPACE '||index_tbs_name||' DATAFILE '''||index_file_name||''' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO';
    EXECUTE IMMEDIATE data_sql;
    EXECUTE IMMEDIATE index_sql;
END;
/ 
SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TBS_LOCATION
