DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = &&USER_NAME._DATA
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE product ( 
  product_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL ,
  name VARCHAR(500) NOT NULL,
  weight NUMBER(10,5),
  energy_value NUMBER(10,5),
  shelf_life INT,
  price NUMBER(10,5),
  CONSTRAINT pk_product PRIMARY KEY (product_id)
  USING INDEX (
      CREATE UNIQUE INDEX product_pk ON product (product_id ASC)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  )
)
TABLESPACE &&TABLESPACE_NAME;

COMMENT ON COLUMN product.product_id IS 'Уникальный идентификатор';
COMMENT ON COLUMN product.name IS 'Имя';
COMMENT ON COLUMN product.weight IS 'Вес продукта';
COMMENT ON COLUMN product.energy_value IS 'Энергетическая ценность(ккал/100г)';
COMMENT ON COLUMN product.shelf_life IS 'Срок хранения(в днях)';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME