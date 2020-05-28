DEFINE Products_count = select count(id) from Products
DEFINE Prices_count = select count(id) from Prices
DEFINE Prod_cell_lnk_count = select count(id) from prod_cell_lnk
DEFINE Pack_types_count = select count(id) from Pack_types
DEFINE Storages_count = select count(id) from Storages
DEFINE Cells_count = select count(id) from Cells
DEFINE Ships_count = select count(id) from Ships
DEFINE Clients_count = select count(id) from Clients
DEFINE Load_outs_count = select count(id) from Load_outs
DEFINE Load_out_hst_count = select count(id) from Load_out_hst
DEFINE Load_states_count = select count(id) from Load_states

PROMPT rows in Products: &&Products_count
PROMPT Prices - rows: &&Prices_count
PROMPT Prod_cell_lnk - rows: &&Prod_cell_lnk_count
PROMPT Pack_types - rows: &&Pack_types_count
PROMPT Storages - rows: &&Storages_count
PROMPT Cells - rows: &&Cells_count
PROMPT Ships - rows: &&Ships_count
PROMPT Clients - rows: &&Clients_count
PROMPT Load_outs - rows: &&Load_outs_count
PROMPT Load_out_hst - rows: &&Load_out_hst_count
PROMPT Load_states - rows: &&Load_states_count

UNDEFINE Storages_count
UNDEFINE Cells_count
UNDEFINE Ships_count
UNDEFINE Clients_count
UNDEFINE Load_outs_count
UNDEFINE Load_out_hst_count
UNDEFINE Load_states_count
