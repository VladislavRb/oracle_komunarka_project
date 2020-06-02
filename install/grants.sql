DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON

GRANT connect, resource, CREATE session, CREATE any table, CREATE any view, CREATE type,
      CREATE procedure, CREATE synonym, create trigger, create sequence, create materialized view, query rewrite
      TO &USER_NAME;
	  
SET SERVEROUTPUT OFF

UNDEFINE USER_NAME