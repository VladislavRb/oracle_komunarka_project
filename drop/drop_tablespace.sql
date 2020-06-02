DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON
DECLARE
    data_sql VARCHAR2(4000);
	index_sql VARCHAR2(4000);
    data_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_DATA';
	index_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_INDEX';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Dropping data tablespace "'||data_tbs_name||'" and index "'||index_tbs_name||'"');
    data_sql:='DROP TABLESPACE '||data_tbs_name||' INCLUDING CONTENTS AND DATAFILES';
	index_sql:='DROP TABLESPACE '||index_tbs_name||' INCLUDING CONTENTS AND DATAFILES';

    EXECUTE IMMEDIATE data_sql;
    EXECUTE IMMEDIATE index_sql;
END;
/ 
SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
