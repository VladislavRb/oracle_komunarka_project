/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     09.04.2020 12:40:31                          */
/*==============================================================*/

DEFINE SCHEMA_NAME = &&1
DEFINE DATA_TBS_NAME = &&2
DEFINE IDX_TABLESPACE = '&&SCHEMA_NAME._IDX_TABLESPACE'

alter table &&SCHEMA_NAME.Cells
   drop constraint FK_CELLS_FK_CELLS__STORAGES;

alter table &&SCHEMA_NAME.Load_out_hst
   drop constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_OUT;

alter table &&SCHEMA_NAME.Load_out_hst
   drop constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_STA;

alter table &&SCHEMA_NAME.Load_outs
   drop constraint FK_LOAD_OUT_FK_LOAD_O_CLIENTS;

alter table &&SCHEMA_NAME.Prices
   drop constraint FK_PRICES_FK_PRICES_PRODUCTS;

alter table &&SCHEMA_NAME.Ships
   drop constraint FK_SHIPS_FK_SHIPS__CELLS;

alter table &&SCHEMA_NAME.Ships
   drop constraint FK_SHIPS_FK_SHIPS__LOAD_OUT;

alter table &&SCHEMA_NAME.prod_cell_lnk
   drop constraint FK_PROD_CEL_FK_PROD_C_CELLS;

alter table &&SCHEMA_NAME.prod_cell_lnk
   drop constraint FK_PROD_CEL_FK_PROD_C_PACK_TYP;

alter table &&SCHEMA_NAME.prod_cell_lnk
   drop constraint FK_PROD_CEL_FK_PROD_C_PRODUCTS;

drop table &&SCHEMA_NAME.Cells cascade constraints;

drop table &&SCHEMA_NAME.Clients cascade constraints;

drop table &&SCHEMA_NAME.Load_out_hst cascade constraints;

drop table &&SCHEMA_NAME.Load_outs cascade constraints;

drop table &&SCHEMA_NAME.Load_states cascade constraints;

drop table &&SCHEMA_NAME.Pack_types cascade constraints;

drop table &&SCHEMA_NAME.Prices cascade constraints;

drop table &&SCHEMA_NAME.Products cascade constraints;

drop table &&SCHEMA_NAME.Ships cascade constraints;

drop table &&SCHEMA_NAME.Storages cascade constraints;

drop table &&SCHEMA_NAME.prod_cell_lnk cascade constraints;

/*==============================================================*/
/* Table: Cells                                               */
/*==============================================================*/
create table &&SCHEMA_NAME.Cells 
(
   id                 NUMBER(10)           not null,
   storage_id         NUMBER(10)           not null,
   unique_number      VARCHAR(20),
   constraint PK_CELLS primary key (id),
   constraint AK_UK_CELLS_STORAGE_CELLS unique (storage_id, unique_number)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Cells is
'Справочник ячеек складов';

comment on column &&SCHEMA_NAME.Cells.id is
'Идентификатор ячейки';

comment on column &&SCHEMA_NAME.Cells.storage_id is
'Идентификатор склада';

comment on column &&SCHEMA_NAME.Cells.unique_number is
'Уникальный номер ячейки на складе';

/*==============================================================*/
/* Table: Clients                                             */
/*==============================================================*/
create table &&SCHEMA_NAME.Clients 
(
   id                 NUMBER(10)           not null,
   code               VARCHAR(20)          not null,
   name               VARCHAR(250)         not null,
   address            VARCHAR(250)         not null,
   vehicle_fl         VARCHAR(1),
   constraint PK_CLIENTS primary key (id),
   constraint AK_UK_CLIENTS_CLIENTS unique (code)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Clients is
'Справочник заказчиков';

comment on column &&SCHEMA_NAME.Clients.id is
'Идентификатор клиента';

comment on column &&SCHEMA_NAME.Clients.code is
'Код слиента';

comment on column &&SCHEMA_NAME.Clients.name is
'Имя клиента';

comment on column &&SCHEMA_NAME.Clients.address is
'Адрес клиента';

comment on column &&SCHEMA_NAME.Clients.vehicle_fl is
'Наличие транспорта у клиента';

/*==============================================================*/
/* Table: Load_out_hst                                        */
/*==============================================================*/
create table &&SCHEMA_NAME.Load_out_hst 
(
   id                 NUMBER(10)           not null,
   load_state_id      NUMBER(10)           not null,
   date_from          DATE                 not null,
   date_to            DATE,
   constraint PK_LOAD_OUT_HST primary key (id)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Load_out_hst is
'Таблица историй отгрузки';

comment on column &&SCHEMA_NAME.Load_out_hst.id is
'Идентификатор записи отгрузки';

comment on column &&SCHEMA_NAME.Load_out_hst.load_state_id is
'Идентификатор состояния отгрузки';

comment on column &&SCHEMA_NAME.Load_out_hst.date_from is
'Момент начала отгрузки';

comment on column &&SCHEMA_NAME.Load_out_hst.date_to is
'Момент окончания отгрузки';

/*==============================================================*/
/* Table: Load_outs                                           */
/*==============================================================*/
create table &&SCHEMA_NAME.Load_outs 
(
   id                 NUMBER(10)           not null,
   client_id          NUMBER(10)           not null,
   load_date          DATE                 not null,
   constraint PK_LOAD_OUTS primary key (id),
   constraint AK_UK_LOAD_OUTS_LOAD_OUT unique (client_id, load_date)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Load_outs is
'Таблица отгрузок';

comment on column &&SCHEMA_NAME.Load_outs.id is
'Идентификатор отгрузки';

comment on column &&SCHEMA_NAME.Load_outs.client_id is
'Идентификатор заказчика';

comment on column &&SCHEMA_NAME.Load_outs.load_date is
'Дата отгрузки';

/*==============================================================*/
/* Table: Load_states                                         */
/*==============================================================*/
create table &&SCHEMA_NAME.Load_states 
(
   id                 NUMBER(10)           not null,
   code               VARCHAR(20)          not null,
   name               VARCHAR(20)          not null,
   constraint PK_LOAD_STATES primary key (id),
   constraint AK_UK_LOAD_STATES_LOAD_STA unique (code)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Load_states is
'Справочник состояний отгрузки';

comment on column &&SCHEMA_NAME.Load_states.id is
'Идентификатор состояния отгрузки';

comment on column &&SCHEMA_NAME.Load_states.code is
'Код состояния отгрузки';

comment on column &&SCHEMA_NAME.Load_states.name is
'Название состояния отгрузки';

/*==============================================================*/
/* Table: Pack_types                                          */
/*==============================================================*/
create table &&SCHEMA_NAME.Pack_types 
(
   id                 NUMBER(10)           not null,
   code               VARCHAR(20)          not null,
   name               VARCHAR(250)         not null,
   constraint PK_PACK_TYPES primary key (id),
   constraint AK_UK_PACK_TYPES_PACK_TYP unique (code)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Pack_types is
'Справочник типов фасовки';

comment on column &&SCHEMA_NAME.Pack_types.id is
'Идентификатор типа фасовки';

comment on column &&SCHEMA_NAME.Pack_types.code is
'Код типа фасовки';

comment on column &&SCHEMA_NAME.Pack_types.name is
'Название типа фасовки';

/*==============================================================*/
/* Table: Prices                                              */
/*==============================================================*/
create table &&SCHEMA_NAME.Prices 
(
   id                 NUMBER(10)           not null,
   product_id         NUMBER(10)           not null,
   price              NUMBER(10,2),
   constraint PK_PRICES primary key (id)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Prices is
'Справочник продуктов';

comment on column &&SCHEMA_NAME.Prices.id is
'Идентификатор записи';

comment on column &&SCHEMA_NAME.Prices.product_id is
'Идентификатор продукта';

comment on column &&SCHEMA_NAME.Prices.price is
'Вес товара';

/*==============================================================*/
/* Table: Products                                            */
/*==============================================================*/
create table &&SCHEMA_NAME.Products 
(
   id                 NUMBER(10)           not null,
   code               VARCHAR(20)          not null,
   name               VARCHAR(250)         not null,
   ingridients        VARCHAR(2000),
   nutritional_val    INTEGER,
   calories           INTEGER,
   weight             INTEGER,
   expiration_date    DATE,
   constraint PK_PRODUCTS primary key (id),
   constraint AK_UK_PRODUCTS_PRODUCTS unique (code)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Products is
'Справочник продуктов';

comment on column &&SCHEMA_NAME.Products.id is
'Идентификатор записи';

comment on column &&SCHEMA_NAME.Products.code is
'Код товара';

comment on column &&SCHEMA_NAME.Products.name is
'Название продукта';

comment on column &&SCHEMA_NAME.Products.ingridients is
'Состав';

comment on column &&SCHEMA_NAME.Products.nutritional_val is
'пищевая ценность';

comment on column &&SCHEMA_NAME.Products.calories is
'Энергетическая ценность';

comment on column &&SCHEMA_NAME.Products.weight is
'Вес товара';

comment on column &&SCHEMA_NAME.Products.expiration_date is
'Срок годности';

/*==============================================================*/
/* Table: Ships                                               */
/*==============================================================*/
create table &&SCHEMA_NAME.Ships 
(
   id                 NUMBER(10)           not null,
   load_out_id        NUMBER(10)           not null,
   cell_id            NUMBER(10)           not null,
   constraint PK_SHIPS primary key (id),
   constraint AK_UK_SHIPS_SHIPS unique (load_out_id, cell_id)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Ships is
'Таблица партий';

comment on column &&SCHEMA_NAME.Ships.id is
'Идентификатор партии';

comment on column &&SCHEMA_NAME.Ships.load_out_id is
'Идентификатор отгрузки';

comment on column &&SCHEMA_NAME.Ships.cell_id is
'Идентификатор ячейки';

/*==============================================================*/
/* Table: Storages                                            */
/*==============================================================*/
create table &&SCHEMA_NAME.Storages 
(
   id                 NUMBER(10)           not null,
   code               VARCHAR(20)          not null,
   address            VARCHAR(250)         not null,
   constraint PK_STORAGES primary key (id),
   constraint AK_UK_STORAGES_STORAGES unique (code)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.Storages is
'Справочник складов';

comment on column &&SCHEMA_NAME.Storages.id is
'Идентификатор склада';

comment on column &&SCHEMA_NAME.Storages.code is
'Код склада';

comment on column &&SCHEMA_NAME.Storages.address is
'Адрес склада';

/*==============================================================*/
/* Table: prod_cell_lnk                                       */
/*==============================================================*/
create table &&SCHEMA_NAME.prod_cell_lnk 
(
   id                 NUMBER(10)           not null,
   cell_id            NUMBER(10)           not null,
   product_id         NUMBER(10)           not null,
   product_count      NUMBER(20)           not null,
   pack_type_id       NUMBER(10)           not null,
   constraint PK_PROD_CELL_LNK primary key (id)
)
TABLESPACE &&DATA_TBS_NAME;

comment on table &&SCHEMA_NAME.prod_cell_lnk is
'Связь продукта и ячейки склада';

comment on column &&SCHEMA_NAME.prod_cell_lnk.id is
'Идентификатор записи';

comment on column &&SCHEMA_NAME.prod_cell_lnk.cell_id is
'Идентификатор ячейки';

comment on column &&SCHEMA_NAME.prod_cell_lnk.product_id is
'Идентификатор продукта';

comment on column &&SCHEMA_NAME.prod_cell_lnk.product_count is
'Количество продукта';

comment on column &&SCHEMA_NAME.prod_cell_lnk.pack_type_id is
'Идентификатор типа фасовки';

alter table &&SCHEMA_NAME.Cells
   add constraint FK_CELLS_FK_CELLS__STORAGES foreign key (storage_id)
      references &&SCHEMA_NAME.Storages (id);
create index FK_CELLS_FK_CELLS__STORAGES_IDX on &&SCHEMA_NAME.Cells(storage_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Load_out_hst
   add constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_OUT foreign key (id)
      references &&SCHEMA_NAME.Load_outs (id);
create index FK_LOAD_OUT_FK_LOAD_O_LOAD_OUT_IDX on &&SCHEMA_NAME.Load_out_hst(id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Load_out_hst
   add constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_STA foreign key (load_state_id)
      references &&SCHEMA_NAME.Load_states (id);
create index FK_LOAD_OUT_FK_LOAD_O_LOAD_STA_IDX on &&SCHEMA_NAME.Load_out_hst(load_state_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Load_outs
   add constraint FK_LOAD_OUT_FK_LOAD_O_CLIENTS foreign key (client_id)
      references &&SCHEMA_NAME.Clients (id);
create index FK_LOAD_OUT_FK_LOAD_O_CLIENTS_IDX on &&SCHEMA_NAME.Load_outs(client_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Prices
   add constraint FK_PRICES_FK_PRICES_PRODUCTS foreign key (product_id)
      references &&SCHEMA_NAME.Products (id);
create index FK_PRICES_FK_PRICES_PRODUCTS_IDX on &&SCHEMA_NAME.Prices(product_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Ships
   add constraint FK_SHIPS_FK_SHIPS__CELLS foreign key (cell_id)
      references &&SCHEMA_NAME.Cells (id);
create index FK_SHIPS_FK_SHIPS__CELLS_IDX on &&SCHEMA_NAME.Ships(cell_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.Ships
   add constraint FK_SHIPS_FK_SHIPS__LOAD_OUT foreign key (load_out_id)
      references &&SCHEMA_NAME.Load_outs (id);
create index FK_SHIPS_FK_SHIPS__LOAD_OUT_IDX on &&SCHEMA_NAME.Ships(load_out_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_CELLS foreign key (cell_id)
      references &&SCHEMA_NAME.Cells (id);
create index FK_PROD_CEL_FK_PROD_C_CELLS_IDX on &&SCHEMA_NAME.prod_cell_lnk(cell_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_PACK_TYP foreign key (pack_type_id)
      references &&SCHEMA_NAME.Pack_types (id);
create index FK_PROD_CEL_FK_PROD_C_PACK_TYP_IDX on &&SCHEMA_NAME.prod_cell_lnk(pack_type_id) TABLESPACE &&IDX_TABLESPACE;


alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_PRODUCTS foreign key (product_id)
      references &&SCHEMA_NAME.Products (id);
create index FK_PROD_CEL_FK_PROD_C_PRODUCTS_IDX on &&SCHEMA_NAME.prod_cell_lnk(product_id) TABLESPACE &&IDX_TABLESPACE;


UNDEFINE SCHEMA_NAME
UNDEFINE DATA_TBS_NAME
UNDEFINE IDX_TABLESPACE
