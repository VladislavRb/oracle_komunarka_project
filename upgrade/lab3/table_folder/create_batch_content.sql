DEFINE USER_NAME = &&1
DEFINE TABLESPACE_NAME = "&&USER_NAME._DATA"
DEFINE TABLESPACE_INDEX_NAME = &&USER_NAME._INDEX

SET SERVEROUTPUT ON

CREATE TABLE batch_content ( 
  batch_id NUMBER NOT NULL,
  box_id INT NOT NULL,
  CONSTRAINT cons_cont_pk 
    PRIMARY KEY (batch_id, box_id)
  USING INDEX (
      CREATE UNIQUE INDEX pk_cons_cont ON batch_content(batch_id ASC, box_id)
	  TABLESPACE &&TABLESPACE_INDEX_NAME
  ),
  CONSTRAINT batch_cont_fk1
    FOREIGN KEY (box_id)
    REFERENCES box(box_id),
  CONSTRAINT batch_cont_fk2
    FOREIGN KEY (batch_id)
    REFERENCES batch(batch_id)
)
TABLESPACE &&TABLESPACE_NAME;

CREATE INDEX pk_cons_cont_id ON batch_content(batch_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;
CREATE INDEX pk_cons_cont_box_id ON batch_content(box_id ASC) TABLESPACE &&TABLESPACE_INDEX_NAME;

COMMENT ON COLUMN batch_content.batch_id IS 'Уникальный идентификатор заказа';
COMMENT ON COLUMN batch_content.box_id IS 'Уникальный идентификатор коробки';

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME
UNDEFINE TABLESPACE_NAME
UNDEFINE TABLESPACE_INDEX_NAME