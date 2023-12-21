-- Table structure for table billing
CREATE TABLE billing (
                         item_number varchar(255) NOT NULL,
                         quantity int NOT NULL,
                         price numeric(50,2) NOT NULL,
                         total_amount numeric(50,2) NOT NULL,
                         id serial PRIMARY KEY
);

-- Table structure for table customers
CREATE TABLE customers (
                           id serial PRIMARY KEY,
                           Name varchar(255) NOT NULL,
                           PhoneNumber varchar(10) NOT NULL,
                           UNIQUE (id)
);

-- Dumping data for table customers
INSERT INTO customers (id, Name, PhoneNumber) VALUES
                                                  (24, 'Shahzaib', '7070564601'),
                                                  (23, 'Rashid Makki', '7070564603'),
                                                  (25, 'Shadab', '9818977363');

-- Table structure for table inv_seq
CREATE TABLE inv_seq (
                         next_not_cached_value bigint NOT NULL,
                         minimum_value bigint NOT NULL,
                         maximum_value bigint NOT NULL,
                         start_value bigint NOT NULL,
                         increment bigint NOT NULL,
                         cache_size bigint NOT NULL,
                         cycle_option smallint NOT NULL,
                         cycle_count bigint NOT NULL
);

-- Dumping data for table inv_seq
INSERT INTO inv_seq (next_not_cached_value, minimum_value, maximum_value, start_value, increment, cache_size, cycle_option, cycle_count) VALUES
    (3001, 1, 99999999999999, 1, 1, 1000, 0, 0);

-- Table structure for table products
CREATE TABLE products (
                          id serial PRIMARY KEY,
                          item_number varchar(255) NOT NULL,
                          item_group varchar(255) NOT NULL,
                          quantity int NOT NULL,
                          price numeric(50,2) NOT NULL
);

-- Dumping data for table products
INSERT INTO products (id, item_number, item_group, quantity, price) VALUES
                                                                        (1, 'AX123456', 'Shirts ', 60, 700.00),
                                                                        (2, 'BX123456', 'Shirts', 100, 300.00),
                                                                        (3, 'ZX123456', 'Shirts', 40, 800.00);

-- Table structure for table purchase
CREATE TABLE purchase (
                          id serial PRIMARY KEY,
                          invoice varchar(255) NOT NULL,
                          shop_and_address varchar(1000) NOT NULL,
                          total_items int NOT NULL,
                          total_amount numeric(50,2) NOT NULL,
                          date_of_purchase varchar(255) NOT NULL
);

-- Dumping data for table purchase
INSERT INTO purchase (id, invoice, shop_and_address, total_items, total_amount, date_of_purchase) VALUES
                                                                                                      (1, '123XB123', 'AB, Yamuna Nagar,Delhi', 50, 200000.00, '30/05/2023'),
                                                                                                      (2, 'babab', 'abbaban', 100, 100000.00, '29/05/2023');

-- Table structure for table sales
CREATE TABLE sales (
                       id serial PRIMARY KEY,
                       inv_num varchar(255) NOT NULL,
                       cust_id int NOT NULL,
                       price numeric(50,2) NOT NULL,
                       quantity int NOT NULL,
                       total_amount numeric(50,2) NOT NULL,
                       date varchar(255) NOT NULL,
                       item_number varchar(255) NOT NULL
);

-- Dumping data for table sales
INSERT INTO sales (id, inv_num, cust_id, price, quantity, total_amount, date, item_number) VALUES
                                                                                               (28, 'INV-1', 23, 700.00, 4, 2800.00, '2023-06-03', 'AX123456'),
                                                                                               (29, 'INV-1', 23, 800.00, 2, 1600.00, '2023-06-03', 'ZX123456'),
                                                                                               (30, 'INV-2', 24, 700.00, 4, 2800.00, '2023-06-03', 'AX123456'),
                                                                                               (31, 'INV-3', 25, 900.00, 2, 1800.00, '2023-06-03', 'AX123456'),
                                                                                               (32, 'INV-3', 25, 800.00, 1, 800.00, '2023-06-03', 'ZX123456'),
                                                                                               (33, 'INV-4', 23, 700.00, 2, 1400.00, '2023-06-04', 'AX123456'),
                                                                                               (34, 'INV-5', 23, 300.00, 2, 600.00, '2023-06-04', 'BX123456');

-- Table structure for table users
CREATE TABLE users (
                       id serial PRIMARY KEY,
                       username varchar(255) NOT NULL,
                       password varchar(255) NOT NULL
);

-- Dumping data for table users
INSERT INTO users (id, username, password) VALUES
    (1, 'admin', 'admin');

-- Indexes for dumped tables
-- Indexes for table billing
CREATE INDEX billing_id_idx ON billing (id);

-- Indexes for table customers
CREATE INDEX customers_id_idx ON customers (id);
CREATE UNIQUE INDEX customers_phonenumber_uindex ON customers (phonenumber);

-- Indexes for table products
CREATE INDEX products_id_idx ON products (id);

-- Indexes for table purchase
CREATE INDEX purchase_id_idx ON purchase (id);

-- Indexes for table sales
CREATE INDEX sales_id_idx ON sales (id);
CREATE INDEX sales_cust_id_idx ON sales (cust_id);

-- Indexes for table users
CREATE INDEX users_id_idx ON users (id);

-- Constraints for dumped tables
-- Constraints for table sales
ALTER TABLE sales
    ADD CONSTRAINT sales_cust_id_fk FOREIGN KEY (cust_id) REFERENCES customers (id);
