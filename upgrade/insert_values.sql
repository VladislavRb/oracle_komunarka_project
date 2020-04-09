DEFINE SCHEMA_NAME = &&1


INSERT	INTO &&SCHEMA_NAME.Storages (id, code, address) VALUES (1, 'code1', 'address1');
INSERT	INTO &&SCHEMA_NAME.Storages (id, code, address) VALUES (2, 'code2', 'address2');
INSERT	INTO &&SCHEMA_NAME.Storages (id, code, address) VALUES (3, 'code3', 'address3');

INSERT	INTO &&SCHEMA_NAME.Cells (id, storage_id, unique_number) VALUES (1, 1, 1);
INSERT	INTO &&SCHEMA_NAME.Cells (id, storage_id, unique_number) VALUES (2, 1, 2);
INSERT	INTO &&SCHEMA_NAME.Cells (id, storage_id, unique_number) VALUES (3, 2, 3);

INSERT	INTO &&SCHEMA_NAME.Load_states (id, code, name) VALUES (1, 'code1', 'state1');
INSERT	INTO &&SCHEMA_NAME.Load_states (id, code, name) VALUES (2, 'code2', 'state2');
INSERT	INTO &&SCHEMA_NAME.Load_states (id, code, name) VALUES (3, 'code3', 'state3');

INSERT	INTO &&SCHEMA_NAME.Pack_types (id, code, name) VALUES (1, 'code1', 'type1');
INSERT	INTO &&SCHEMA_NAME.Pack_types (id, code, name) VALUES (2, 'code2', 'type2');
INSERT	INTO &&SCHEMA_NAME.Pack_types (id, code, name) VALUES (3, 'code3', 'type3');

INSERT	INTO &&SCHEMA_NAME.Products (id, code, name, ingridients, nutritional_val, calories, weight, expiration_date) VALUES (1, 'code1', 'product1', 'set of ingredients number 1', 11, 11, 110, DATE '2020-11-14');
INSERT	INTO &&SCHEMA_NAME.Products (id, code, name, ingridients, nutritional_val, calories, weight, expiration_date) VALUES (2, 'code2', 'product2', 'set of ingredients number 2', 22, 22, 220, DATE '2020-11-14');
INSERT	INTO &&SCHEMA_NAME.Products (id, code, name, ingridients, nutritional_val, calories, weight, expiration_date) VALUES (3, 'code3', 'product3', 'set of ingredients number 3', 33, 33, 330, DATE '2020-11-14');

INSERT	INTO &&SCHEMA_NAME.Prices (id, product_id, price) VALUES (1, 1, 34.3);
INSERT	INTO &&SCHEMA_NAME.Prices (id, product_id, price) VALUES (2, 2, 54.0);
INSERT	INTO &&SCHEMA_NAME.Prices (id, product_id, price) VALUES (3, 3, 53.9);

INSERT	INTO &&SCHEMA_NAME.prod_cell_lnk (id, cell_id, product_id, product_count, pack_type_id) VALUES (1, 1, 1, 5, 1);
INSERT	INTO &&SCHEMA_NAME.prod_cell_lnk (id, cell_id, product_id, product_count, pack_type_id) VALUES (2, 2, 2, 6, 2);
INSERT	INTO &&SCHEMA_NAME.prod_cell_lnk (id, cell_id, product_id, product_count, pack_type_id) VALUES (3, 3, 3, 4, 3);

INSERT	INTO &&SCHEMA_NAME.Clients (id, code, name, address, vehicle_fl) VALUES (1, 1, 'client1', 'address1', '1');
INSERT	INTO &&SCHEMA_NAME.Clients (id, code, name, address, vehicle_fl) VALUES (2, 2, 'client2', 'address2', '2');
INSERT	INTO &&SCHEMA_NAME.Clients (id, code, name, address, vehicle_fl) VALUES (3, 3, 'client3', 'address3', '3');

INSERT	INTO &&SCHEMA_NAME.Load_outs (id, client_id, load_date) VALUES (1, 1 , DATE '2020-11-14');
INSERT	INTO &&SCHEMA_NAME.Load_outs (id, client_id, load_date) VALUES (2, 2 , DATE '2020-11-14');
INSERT	INTO &&SCHEMA_NAME.Load_outs (id, client_id, load_date) VALUES (3, 3 , DATE '2020-11-14');

INSERT	INTO &&SCHEMA_NAME.Ships(id, load_out_id, cell_id) VALUES (1, 1, 1);
INSERT	INTO &&SCHEMA_NAME.Ships(id, load_out_id, cell_id) VALUES (2, 2, 2);
INSERT	INTO &&SCHEMA_NAME.Ships(id, load_out_id, cell_id) VALUES (3, 3, 3);

INSERT	INTO &&SCHEMA_NAME.Load_out_hst(id, date_from, date_to, load_state_id) VALUES (1, DATE '2020-11-14', DATE '2020-12-14', 1);
INSERT	INTO &&SCHEMA_NAME.Load_out_hst(id, date_from, date_to, load_state_id) VALUES (2, DATE '2020-11-14', DATE '2020-12-14', 2);
INSERT	INTO &&SCHEMA_NAME.Load_out_hst(id, date_from, date_to, load_state_id) VALUES (3, DATE '2020-11-14', DATE '2020-12-14', 3);
  
UNDEFINE SCHEMA_NAME


