DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE ingredients ( 
  product_id NUMBER NOT NULL,
  component_name VARCHAR(500),
  weight NUMBER(10,5),
  CONSTRAINT compose_pk 
    PRIMARY KEY (product_id, component_name)
  USING INDEX (
      CREATE UNIQUE INDEX pk_compose ON ingredients(product_id ASC, component_name)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  ),
  CONSTRAINT compose_fk
    FOREIGN KEY (product_id)
    REFERENCES product(product_id)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX pk_compose_id ON ingredients(product_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;
CREATE INDEX pk_compose_name ON ingredients(component_name ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;

COMMENT ON COLUMN ingredients.product_id IS 'Уникальный идентификатор';
COMMENT ON COLUMN ingredients.component_name IS 'Название ингредиента';
COMMENT ON COLUMN ingredients.weight IS 'Вес ингредиента';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME