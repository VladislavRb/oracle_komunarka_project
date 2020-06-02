DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE batch ( 
  batch_id NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL ,
  customer_id INT NOT NULL,
  status VARCHAR(500) NOT NULL,
  batch_date DATE DEFAULT(sysdate),
  transport_id INT NOT NULL,
  CONSTRAINT cons_pk 
    PRIMARY KEY (batch_id)
  USING INDEX (
      CREATE UNIQUE INDEX pk_batch ON batch(batch_id ASC)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  ),
  CONSTRAINT cons_fk1
    FOREIGN KEY (transport_id)
    REFERENCES transport(transport_id),
  CONSTRAINT cons_fk2
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX fk_transport ON batch(transport_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;
CREATE INDEX fk_customer_id ON batch(customer_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;

COMMENT ON COLUMN batch.batch_id IS 'Уникальный идентификатор партии';
COMMENT ON COLUMN batch.customer_id IS 'Уникальный идентификатор заказчика';
COMMENT ON COLUMN batch.status IS 'Статус(готовится, готова и т.д.)';
COMMENT ON COLUMN batch.batch_date IS 'Дата заказа';
COMMENT ON COLUMN batch.transport_id IS 'Уникальный идентификатор транспорта';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME