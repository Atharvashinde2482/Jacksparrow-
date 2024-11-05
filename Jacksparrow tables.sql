create database jacksparrow;
use jacksparrow;

CREATE TABLE factory(
    factory_id INT PRIMARY KEY,
    factory_name VARCHAR(100),
    location VARCHAR(100),
    contact_no VARCHAR(15),
    email VARCHAR(100),
    foundation_date DATE
);



INSERT INTO factory (factory_id, factory_name, location, contact_no, email, foundation_date) VALUES
(1, 'Style Fabrics', 'New York', '1234567890', 'contact@stylefabrics.com', '2015-06-15'),
(2, 'Urban Threads', 'Los Angeles', '0987654321', 'info@urbanthreads.com', '2010-11-22'),
(3, 'Fashion Forge', 'Chicago', '5678901234', 'sales@fashionforge.com', '2018-03-10'),
(4, 'Modern Stitch', 'Miami', '2345678901', 'support@modernstitch.com', '2020-01-08'),
(5, 'Vintage Wear', 'San Francisco', '3456789012', 'inquiries@vintagewear.com', '2008-09-18');




CREATE TABLE vendor (
    vendor_id INT PRIMARY KEY,
    name VARCHAR(100),
    product_type VARCHAR(100),
    contact_no VARCHAR(15),
    address VARCHAR(100),
    factory_id INT,
    FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);



INSERT INTO vendor (vendor_id, name, product_type, contact_no, address, factory_id) VALUES
(1, 'atharva', 'Fabrics', '1234567891', 'New York', 1),
(2, 'himanshu.', 'Buttons', '9876543210', 'Los Angeles', 2),
(3, 'pranay', 'Threads', '3456789123', 'Chicago', 3),
(4, 'aditya', 'Zippers', '4567891230', 'Miami', 4),
(5, 'pravin', 'Patterns', '5678912340', 'San Francisco', 5);



CREATE TABLE customer (

    id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_no VARCHAR(15),
    address VARCHAR(100),
    email VARCHAR(100),
    registration_no VARCHAR(20),
    password VARCHAR(50)
);



INSERT INTO customer (id, name, contact_no, address, email, registration_no, password) VALUES
(1, 'Aniket', '9876543212', 'Boston', 'alice@example.com', 'REG001', 'passalice'),
(2, 'monica', '8765432109', 'Chicago', 'bob@example.com', 'REG002', 'passbob'),
(3, 'Guddi', '7654321098', 'Houston', 'charlie@example.com', 'REG003', 'passcharlie'),
(4, 'Rushikesh', '6543210987', 'Phoenix', 'diana@example.com', 'REG004', 'passdiana'),
(5, 'vikas', '5432109876', 'Philadelphia', 'eve@example.com', 'REG005', 'passeve');




CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    quality VARCHAR(50),
    type VARCHAR(50),
    price DECIMAL(10, 2),
    factory_id INT,
    FOREIGN KEY (factory_id) REFERENCES factory(factory_id)
);



INSERT INTO product (product_id, product_name, quantity, quality, type, price, factory_id) VALUES
(1, 'Denim Jacket', 150, 'Premium', 'Outerwear', 89.99, 1),
(2, 'Cotton T-Shirt', 500, 'Standard', 'Top', 19.99, 2),
(3, 'Wool Sweater', 200, 'Premium', 'Knitwear', 59.99, 3),
(4, 'formal shirt', 300, 'Luxury', 'Accessory', 29.99, 4),
(5, 'Leather Belt', 100, 'Premium', 'Accessory', 49.99, 5);


use jacksparrow;

CREATE TABLE sales_order_table (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    address VARCHAR(100),
    order_date DATE,
    quantity INT,
    order_status VARCHAR(50),
    delivery_id INT,
    payment_mode INT,
    customer_id INT,
    FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id),
    FOREIGN KEY (payment_mode) REFERENCES payment(payment_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO sales_order_table (order_id, product_name, address, order_date, quantity, order_status, delivery_id, payment_mode, customer_id) VALUES
(1, 'Denim Jacket', 'Boston', '2024-10-01', 2, 'Shipped', 1, 1, 1),
(2, 'Cotton T-Shirt', 'Chicago', '2024-10-03', 3, 'Delivered', 2, 2, 2),
(3, 'Wool Sweater', 'Houston', '2024-10-05', 1, 'In Transit', 3, 1, 3),
(4, 'formal shirt', 'Phoenix', '2024-10-07', 4, 'Processing', 4, 2, 4),
(5, 'Leather Belt', 'Philadelphia', '2024-10-09', 1, 'Delivered', 5, 1, 5);


use jacksparrow;
CREATE TABLE order_details (
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    quantity_disp INT,
    price DECIMAL(10, 2),
    sales_order_id INT,
    product_id int,
    FOREIGN KEY (sales_order_id) REFERENCES sales_order_table(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_details (order_id, product_name, quantity, quantity_disp, price, sales_order_id,product_id) VALUES
(1, 'Denim Jacket', 2, 2, 89.99, 1,1),
(2, 'Cotton T-Shirt', 3, 3, 19.99, 2,2),
(3, 'Wool Sweater', 1, 1, 59.99, 3,3),
(4, 'formal shirt', 4, 4, 29.99, 4,4),
(5, 'Leather Belt', 1, 1, 49.99, 5,5);



CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    name VARCHAR(100),
    payment_mode VARCHAR(50),
    contact_no VARCHAR(15)
);

INSERT INTO payment (payment_id, name, payment_mode, contact_no) VALUES
(1, 'Credit Card', 'Online', '1234567800'),
(2, 'PayPal', 'Online', '2345678901'),
(3, 'Debit Card', 'Online', '3456789012'),
(4, 'Net Banking', 'Online', '4567890123'),
(5, 'Cash', 'Offline', '5678901234');


CREATE TABLE discount (
    discount_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    discount_price DECIMAL(10, 2),
    card_name VARCHAR(50)
);

INSERT INTO discount (discount_id, product_name, discount_price, card_name) VALUES
(1, 'Denim Jacket', 79.99, 'Visa'),
(2, 'Cotton T-Shirt', 14.99, 'Mastercard'),
(3, 'Wool Sweater', 49.99, 'Amex'),
(4, 'Silk Scarf', 19.99, 'Discover'),
(5, 'Leather Belt', 39.99, 'Visa');



CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(100),
    tracking_id VARCHAR(50),
    delivery_date DATE,
    delivery_status VARCHAR(50),
    contact_no VARCHAR(15),
    order_id int);

INSERT INTO delivery (delivery_id, name, address, tracking_id, delivery_date, delivery_status, contact_no) VALUES
(1, 'FastTrack', 'Boston', 'TRACK123', '2024-10-10', 'Delivered', '9876543210'),
(2, 'QuickShip', 'Chicago', 'TRACK456', '2024-10-11', 'Shipped', '8765432109'),
(3, 'SpeedyDelivery', 'Houston', 'TRACK789', '2024-10-12', 'In Transit', '7654321098'),
(4, 'ExpressLine', 'Phoenix', 'TRACK101', '2024-10-13', 'Shipped', '6543210987'),
(5, 'DirectWay', 'Philadelphia', 'TRACK112', '2024-10-14', 'Delivered', '5432109876');














