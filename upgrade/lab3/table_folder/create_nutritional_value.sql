DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE nutritional_value ( 
  product_id NUMBER NOT NULL ,
  fats NUMBER(10,5),
  proteins NUMBER(10,5),
  carbohydrates NUMBER(10,5),
  cocoa NUMBER(10,5),
  CONSTRAINT nv_pk 
    PRIMARY KEY (product_id)
  USING INDEX (
      CREATE UNIQUE INDEX fk_product ON nutritional_value(product_id ASC)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  ),
  CONSTRAINT nv_fk
    FOREIGN KEY (product_id)
    REFERENCES product(product_id) 
)
TABLESPACE &&TABLESPACE_NAME;

COMMENT ON COLUMN nutritional_value.product_id IS 'Уникальный идентификатор';
COMMENT ON COLUMN nutritional_value.fats IS 'Жиры';
COMMENT ON COLUMN nutritional_value.proteins IS 'Белки';
COMMENT ON COLUMN nutritional_value.carbohydrates IS 'Углеводы';
COMMENT ON COLUMN nutritional_value.cocoa IS 'Процент какао';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME