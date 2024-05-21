copy region from '/app/tpch-dbgen-pg/tbl/region.tbl' with delimiter as '|' NULL '';
copy nation from '/app/tpch-dbgen-pg/tbl/nation.tbl' with delimiter as '|' NULL '';
copy partsupp from '/app/tpch-dbgen-pg/tbl/partsupp.tbl' with delimiter as '|' NULL '';
copy customer from '/app/tpch-dbgen-pg/tbl/customer.tbl' with delimiter as '|' NULL '';
copy lineitem from '/app/tpch-dbgen-pg/tbl/lineitem.tbl' with delimiter as '|' NULL '';
copy orders from '/app/tpch-dbgen-pg/tbl/orders.tbl' with delimiter as '|' NULL '';
copy part from '/app/tpch-dbgen-pg/tbl/part.tbl' with delimiter as '|' NULL '';
copy supplier from '/app/tpch-dbgen-pg/tbl/supplier.tbl' with delimiter as '|' NULL '';

ALTER TABLE REGION ADD PRIMARY KEY (R_REGIONKEY);
ALTER TABLE NATION ADD PRIMARY KEY (N_NATIONKEY);
ALTER TABLE PART ADD PRIMARY KEY (P_PARTKEY);
ALTER TABLE SUPPLIER ADD PRIMARY KEY (S_SUPPKEY);
ALTER TABLE PARTSUPP ADD PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY);
ALTER TABLE CUSTOMER ADD PRIMARY KEY (C_CUSTKEY);
ALTER TABLE LINEITEM ADD PRIMARY KEY (L_ORDERKEY,L_LINENUMBER);
ALTER TABLE ORDERS ADD PRIMARY KEY (O_ORDERKEY);

ALTER TABLE NATION ADD FOREIGN KEY (N_REGIONKEY) references REGION;
ALTER TABLE SUPPLIER ADD FOREIGN KEY (S_NATIONKEY) references NATION;
ALTER TABLE CUSTOMER ADD FOREIGN KEY (C_NATIONKEY) references NATION;
ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_SUPPKEY) references SUPPLIER;
ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_PARTKEY) references PART;
ALTER TABLE ORDERS ADD FOREIGN KEY (O_CUSTKEY) references CUSTOMER;
ALTER TABLE LINEITEM ADD FOREIGN KEY (L_ORDERKEY)  references ORDERS;
ALTER TABLE LINEITEM ADD FOREIGN KEY (L_PARTKEY,L_SUPPKEY) references PARTSUPP;
COMMIT