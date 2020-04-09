/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     09.04.2020 12:40:31                          */
/*==============================================================*/

DEFINE SCHEMA_NAME = &&1
DEFINE DATA_TBS_NAME = &&2

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
'���������� ����� �������';

comment on column &&SCHEMA_NAME.Cells.id is
'������������� ������';

comment on column &&SCHEMA_NAME.Cells.storage_id is
'������������� ������';

comment on column &&SCHEMA_NAME.Cells.unique_number is
'���������� ����� ������ �� ������';

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
'���������� ����������';

comment on column &&SCHEMA_NAME.Clients.id is
'������������� �������';

comment on column &&SCHEMA_NAME.Clients.code is
'��� �������';

comment on column &&SCHEMA_NAME.Clients.name is
'��� �������';

comment on column &&SCHEMA_NAME.Clients.address is
'����� �������';

comment on column &&SCHEMA_NAME.Clients.vehicle_fl is
'������� ���������� � �������';

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
'������� ������� ��������';

comment on column &&SCHEMA_NAME.Load_out_hst.id is
'������������� ������ ��������';

comment on column &&SCHEMA_NAME.Load_out_hst.load_state_id is
'������������� ��������� ��������';

comment on column &&SCHEMA_NAME.Load_out_hst.date_from is
'������ ������ ��������';

comment on column &&SCHEMA_NAME.Load_out_hst.date_to is
'������ ��������� ��������';

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
'������� ��������';

comment on column &&SCHEMA_NAME.Load_outs.id is
'������������� ��������';

comment on column &&SCHEMA_NAME.Load_outs.client_id is
'������������� ���������';

comment on column &&SCHEMA_NAME.Load_outs.load_date is
'���� ��������';

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
'���������� ��������� ��������';

comment on column &&SCHEMA_NAME.Load_states.id is
'������������� ��������� ��������';

comment on column &&SCHEMA_NAME.Load_states.code is
'��� ��������� ��������';

comment on column &&SCHEMA_NAME.Load_states.name is
'�������� ��������� ��������';

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
'���������� ����� �������';

comment on column &&SCHEMA_NAME.Pack_types.id is
'������������� ���� �������';

comment on column &&SCHEMA_NAME.Pack_types.code is
'��� ���� �������';

comment on column &&SCHEMA_NAME.Pack_types.name is
'�������� ���� �������';

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
'���������� ���������';

comment on column &&SCHEMA_NAME.Prices.id is
'������������� ������';

comment on column &&SCHEMA_NAME.Prices.product_id is
'������������� ��������';

comment on column &&SCHEMA_NAME.Prices.price is
'��� ������';

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
'���������� ���������';

comment on column &&SCHEMA_NAME.Products.id is
'������������� ������';

comment on column &&SCHEMA_NAME.Products.code is
'��� ������';

comment on column &&SCHEMA_NAME.Products.name is
'�������� ��������';

comment on column &&SCHEMA_NAME.Products.ingridients is
'������';

comment on column &&SCHEMA_NAME.Products.nutritional_val is
'������� ��������';

comment on column &&SCHEMA_NAME.Products.calories is
'�������������� ��������';

comment on column &&SCHEMA_NAME.Products.weight is
'��� ������';

comment on column &&SCHEMA_NAME.Products.expiration_date is
'���� ��������';

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
'������� ������';

comment on column &&SCHEMA_NAME.Ships.id is
'������������� ������';

comment on column &&SCHEMA_NAME.Ships.load_out_id is
'������������� ��������';

comment on column &&SCHEMA_NAME.Ships.cell_id is
'������������� ������';

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
'���������� �������';

comment on column &&SCHEMA_NAME.Storages.id is
'������������� ������';

comment on column &&SCHEMA_NAME.Storages.code is
'��� ������';

comment on column &&SCHEMA_NAME.Storages.address is
'����� ������';

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
'����� �������� � ������ ������';

comment on column &&SCHEMA_NAME.prod_cell_lnk.id is
'������������� ������';

comment on column &&SCHEMA_NAME.prod_cell_lnk.cell_id is
'������������� ������';

comment on column &&SCHEMA_NAME.prod_cell_lnk.product_id is
'������������� ��������';

comment on column &&SCHEMA_NAME.prod_cell_lnk.product_count is
'���������� ��������';

comment on column &&SCHEMA_NAME.prod_cell_lnk.pack_type_id is
'������������� ���� �������';

alter table &&SCHEMA_NAME.Cells
   add constraint FK_CELLS_FK_CELLS__STORAGES foreign key (storage_id)
      references &&SCHEMA_NAME.Storages (id);

alter table &&SCHEMA_NAME.Load_out_hst
   add constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_OUT foreign key (id)
      references &&SCHEMA_NAME.Load_outs (id);

alter table &&SCHEMA_NAME.Load_out_hst
   add constraint FK_LOAD_OUT_FK_LOAD_O_LOAD_STA foreign key (load_state_id)
      references &&SCHEMA_NAME.Load_states (id);

alter table &&SCHEMA_NAME.Load_outs
   add constraint FK_LOAD_OUT_FK_LOAD_O_CLIENTS foreign key (client_id)
      references &&SCHEMA_NAME.Clients (id);

alter table &&SCHEMA_NAME.Prices
   add constraint FK_PRICES_FK_PRICES_PRODUCTS foreign key (product_id)
      references &&SCHEMA_NAME.Products (id);

alter table &&SCHEMA_NAME.Ships
   add constraint FK_SHIPS_FK_SHIPS__CELLS foreign key (cell_id)
      references &&SCHEMA_NAME.Cells (id);

alter table &&SCHEMA_NAME.Ships
   add constraint FK_SHIPS_FK_SHIPS__LOAD_OUT foreign key (load_out_id)
      references &&SCHEMA_NAME.Load_outs (id);

alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_CELLS foreign key (cell_id)
      references &&SCHEMA_NAME.Cells (id);

alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_PACK_TYP foreign key (pack_type_id)
      references &&SCHEMA_NAME.Pack_types (id);

alter table &&SCHEMA_NAME.prod_cell_lnk
   add constraint FK_PROD_CEL_FK_PROD_C_PRODUCTS foreign key (product_id)
      references &&SCHEMA_NAME.Products (id);
	  
UNDEFINE SCHEMA_NAME
UNDEFINE DATA_TBS_NAME
