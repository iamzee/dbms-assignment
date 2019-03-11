CREATE TABLE sales
(
	order_id INT NOT NULL AUTO_INCREMENT,
	order_date DATE NOT NULL,
	order_price INT NOT NULL,
	order_quantity INT NOT NULL,
	customer_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (order_id)
);

INSERT INTO sales
(order_date, order_price, order_quantity, customer_name)
VALUES
('2005-12-22', 160, 2, 'Smith');

INSERT INTO sales
(order_date, order_price, order_quantity, customer_name)
VALUES
('2005-08-10', 190, 2, 'Johnson'),
('2005-07-13', 500, 5, 'Baldwin'),
('2005-07-15', 420, 2, 'Smith'),
('2005-12-22', 1000, 4, 'Wood'),
('2005-10-02', 820, 4, 'Smith'),
('2005-11-03', 2000, 2, 'Baldwin');

--ques1
SELECT customer_name, COUNT(*) AS total FROM sales
GROUP BY customer_name
HAVING customer_name='Smith';

--ques2
SELECT COUNT(*) FROM (SELECT customer_name FROM sales
GROUP BY customer_name) AS total;
--
SELECT COUNT(DISTINCT customer_name) FROM sales;


--ques3
SELECT SUM(order_quantity) AS total FROM sales;

--ques4
SELECT AVG(order_quantity) FROM sales;

--ques5
SELECT AVG(order_quantity) FROM sales
WHERE order_price > 200;

--ques6
SELECT MIN(order_price) FROM sales;

--ques7
SELECT MAX(order_price) FROM sales;

--ques8
SELECT customer_name FROM sales
GROUP BY customer_name;

--ques9
SELECT customer_name FROM sales
WHERE MONTH(order_date) = 12;

--ques10
SELECT customer_name, SUM(order_price) FROM sales
GROUP BY customer_name;

--ques11
SELECT customer_name, SUM(order_price) AS  total FROM sales
GROUP BY customer_name
HAVING total > 1200;

--ques12
SELECT customer_name, SUM(order_quantity) AS total FROM sales
GROUP BY customer_name
HAVING total > 5;

--ques13
SELECT customer_name, SUM(order_price) AS total FROM sales WHERE order_date > '2005-10-01' GROUP BY customer_name HAVING total > 1000;


--ques14
SELECT * FROM sales ORDER BY order_price;

--ques15
SELECT * FROM sales ORDER BY order_price DESC;


------------------------------------------------------------------------------------------

INSERT INTO sales
(order_date, order_price, order_quantity, customer_name)
VALUES
('2002-12-22', 1000, 4, 'Wood'),
('2004-12-29', 5000, 4, 'Smith');

CREATE TABLE vendor_info
(
	vendor_id INT NOT NULL AUTO_INCREMENT,
	vendor_name VARCHAR(20),
	PRIMARY KEY (vendor_id)
);

INSERT INTO vendor_info
(vendor_name)
VALUES
('Smith'),
('Wills'),
('Johnson'),
('Roger');

CREATE TABLE vendors
(
	raw_material VARCHAR(20) NOT NULL,
	vendor_id INT NOT NULL,
	FOREIGN KEY (vendor_id) REFERENCES vendor_info(vendor_id)
);

INSERT INTO vendors
(raw_material, vendor_id)
VALUES
('Steel', 1),
('Plastic', 2),
('Steel', 3),
('Milk', 1),
('Pulses', 2),
('Bread', 4),
('Bread', 2),
('Milk', 2);

CREATE TABLE products
(
	product_id INT NOT NULL,
	order_id INT NOT NULL,
	manufacture_date DATE NOT NULL,
	raw_material VARCHAR(20) NOT NULL,
	vendor_id INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES sales(order_id)
);

ALTER TABLE products
ADD FOREIGN KEY (raw_material) REFERENCES vendors(raw_material);
