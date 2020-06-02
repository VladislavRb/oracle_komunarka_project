DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE box ( 
  box_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL ,
  weight NUMBER(10,5) NOT NULL,
  type VARCHAR(500) NOT NULL,
  price NUMBER(10,5),
  amount INT NOT NULL,
  product_id INT NOT NULL,
  CONSTRAINT box_pk 
    PRIMARY KEY (box_id)
  USING INDEX (
      CREATE UNIQUE INDEX pk_box ON box(box_id ASC)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  ),
  CONSTRAINT box_fk
    FOREIGN KEY (product_id)
    REFERENCES product(product_id)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX fk_product_id ON box(product_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;

COMMENT ON COLUMN box.box_id IS 'Уникальный идентификатор коробки';
COMMENT ON COLUMN box.weight IS 'Вес всей коробки';
COMMENT ON COLUMN box.type IS 'Тип - для продажи или для транспортировки';
COMMENT ON COLUMN box.price IS 'Цена коробки';
COMMENT ON COLUMN box.product_id IS 'Уникальный идентификатор продукта';
COMMENT ON COLUMN box.amount IS 'Количество продукта в коробке';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME