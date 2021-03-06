
CREATE BITMAP INDEX CUSTOMERS_MARITAL_BIX ON CUSTOMERS (CUST_MARITAL_STATUS) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX CUSTOMERS_YOB_BIX ON CUSTOMERS (CUST_YEAR_OF_BIRTH) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX CUSTOMERS_GENDER_BIX ON CUSTOMERS (CUST_GENDER) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX PRODUCTS_PROD_STATUS_BIX ON PRODUCTS (PROD_STATUS) TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE INDEX PRODUCTS_PROD_SUBCAT_IX ON PRODUCTS (PROD_SUBCATEGORY) TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE INDEX PRODUCTS_PROD_CAT_IX ON PRODUCTS (PROD_CATEGORY) TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX SALES_PROD_BIX ON SALES (PROD_ID) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX SALES_CUST_BIX ON SALES (CUST_ID) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE  BITMAP INDEX SALES_TIME_BIX ON SALES (TIME_ID) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX SALES_CHANNEL_BIX ON SALES (CHANNEL_ID) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

CREATE BITMAP INDEX SALES_PROMO_BIX ON SALES (PROMO_ID) LOCAL TABLESPACE &indextablespace &parallelclause &logging compute statistics;

-- End;

