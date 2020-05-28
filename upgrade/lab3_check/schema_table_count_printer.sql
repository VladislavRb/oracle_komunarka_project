DECLARE
	n_cnt NUMBER;
BEGIN
	SELECT count(*) into n_cnt from Products;
	dbms_output.put_line('Products - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Prices;
	dbms_output.put_line('Prices - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Prod_cell_lnk;
	dbms_output.put_line('Prod_cell_lnk - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Pack_types;
	dbms_output.put_line('Pack_types - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Storages;
	dbms_output.put_line('Storages - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Cells;
	dbms_output.put_line('Cells - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Ships;
	dbms_output.put_line('Ships - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Clients;
	dbms_output.put_line('Clients - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Load_outs;
	dbms_output.put_line('Load_outs - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Load_out_hst;
	dbms_output.put_line('Load_out_hst - rows: ' || n_cnt);

	SELECT count(*) into n_cnt from Load_states;
	dbms_output.put_line('Load_states - rows: ' || n_cnt);
END;