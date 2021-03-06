DROP SEQUENCE IF EXISTS suppliers_supplierid_seq CASCADE ;
DROP SEQUENCE IF EXISTS shippers_shipperid_seq CASCADE ;
DROP SEQUENCE IF EXISTS region_regionid_seq CASCADE ;
DROP SEQUENCE IF EXISTS categories_categoryid_seq CASCADE ;
DROP SEQUENCE IF EXISTS employees_employeeid_seq CASCADE ;
DROP SEQUENCE IF EXISTS orders_orderid_seq CASCADE ;
DROP SEQUENCE IF EXISTS products_productid_seq CASCADE ;
CREATE SEQUENCE IF NOT EXISTS  suppliers_supplierid_seq OWNED BY suppliers.supplierid;
CREATE SEQUENCE IF NOT EXISTS  shippers_shipperid_seq OWNED BY shippers.shipperid;
CREATE SEQUENCE IF NOT EXISTS  region_regionid_seq OWNED BY region.regionid;
CREATE SEQUENCE IF NOT EXISTS  categories_categoryid_seq OWNED BY categories.categoryid;
CREATE SEQUENCE IF NOT EXISTS  employees_employeeid_seq OWNED BY employees.employeeid;
CREATE SEQUENCE IF NOT EXISTS  orders_orderid_seq OWNED BY orders.orderid;
CREATE SEQUENCE IF NOT EXISTS  products_productid_seq OWNED BY products.productid;
SELECT setval('suppliers_supplierid_seq',max(suppliers.supplierid) + 1) FROM suppliers;
SELECT setval('shippers_shipperid_seq',max(shippers.shipperid) + 1) FROM shippers;
SELECT setval('region_regionid_seq',max(region.regionid) + 1) FROM region;
SELECT setval('categories_categoryid_seq',max(categories.categoryid) + 1) FROM categories;
SELECT setval('employees_employeeid_seq',max(employees.employeeid) + 1) FROM employees;
SELECT setval('orders_orderid_seq',max(orders.orderid) + 1) FROM orders;
SELECT setval('products_productid_seq',max(products.productid) + 1) FROM products;
ALTER TABLE suppliers ALTER COLUMN supplierid SET DEFAULT nextval('suppliers_supplierid_seq');
ALTER TABLE shippers ALTER COLUMN shipperid SET DEFAULT nextval('shippers_shipperid_seq');
ALTER TABLE region ALTER COLUMN regionid SET DEFAULT nextval('region_regionid_seq');
ALTER TABLE categories ALTER COLUMN categoryid SET DEFAULT nextval('categories_categoryid_seq');
ALTER TABLE employees ALTER COLUMN employeeid SET DEFAULT nextval('employees_employeeid_seq');
ALTER TABLE orders ALTER COLUMN orderid SET DEFAULT nextval('orders_orderid_seq');
ALTER TABLE products ALTER COLUMN productid SET DEFAULT nextval('products_productid_seq');
DROP SEQUENCE IF EXISTS orderdetails_orderdetailid_seq CASCADE ;
ALTER TABLE order_details DROP CONSTRAINT IF EXISTS pk_order_details;
ALTER TABLE order_details DROP CONSTRAINT IF EXISTS uk_order_details;
ALTER TABLE order_details DROP COLUMN IF EXISTS orderdetailid;
CREATE SEQUENCE IF NOT EXISTS orderdetails_orderdetailid_seq;
ALTER TABLE order_details ADD COLUMN orderdetailid INTEGER DEFAULT nextval('orderdetails_orderdetailid_seq'::regclass);
ALTER TABLE order_details ADD CONSTRAINT pk_order_details PRIMARY KEY (orderdetailid);
ALTER TABLE order_details ADD CONSTRAINT uk_order_details UNIQUE (orderid, productid);
