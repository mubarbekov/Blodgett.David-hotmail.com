DROP DATABASE IF EXISTS sporting_goods_store;
CREATE DATABASE sporting_goods_store;

USE sporting_goods_store;

-- Create Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL UNIQUE,
    contact_name VARCHAR(50) NOT NULL,
    contact_email VARCHAR(100) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL,
    address VARCHAR(150) NOT NULL
);

-- Insert into Suppliers
INSERT INTO Suppliers (supplier_name, contact_name, contact_email, phone_number, address) VALUES
('Acme Sports', 'Alice Johnson', 'alice.johnson@acmesports.com', '1234567890', '123 Supplier Rd, Chicago, IL'),
('ProGear', 'Bob Smith', 'bob.smith@progear.com', '9876543210', '456 Distributor Ln, Peoria, IL'),
('ActiveWear Co.', 'Charlie Brown', 'charlie.brown@activewear.com', '5556667777', '789 Warehouse St, Naperville, IL'),
('Outdoor Gear', 'Daisy Duke', 'daisy.duke@outdoorgear.com', '4445556666', '101 Mountain Ave, Denver, CO'),
('SportsMax', 'Evan Peters', 'evan.peters@sportsmax.com', '3334445555', '202 Stadium Blvd, Phoenix, AZ'),
('Athletic Supplies', 'Fiona Hill', 'fiona.hill@athleticsupplies.com', '2223334444', '303 Fitness Ln, Houston, TX'),
('Champion Goods', 'George King', 'george.king@championg.com', '1112223333', '404 Champion Rd, Atlanta, GA'),
('PlayHard', 'Hannah Lee', 'hannah.lee@playhard.com', '8889990000', '505 Playhouse Dr, Miami, FL'),
('Elite Sports', 'Ian Wright', 'ian.wright@elitesports.com', '7778889999', '606 Elite Ave, San Francisco, CA'),
('Victory Gear', 'Jackie Chan', 'jackie.chan@victorygear.com', '6667778888', '707 Win St, New York, NY');

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    supplier_id INT NOT NULL,
    CONSTRAINT FK_Products_Suppliers
      FOREIGN KEY (supplier_id)
      REFERENCES Suppliers (supplier_id)
);

-- Insert into Products
INSERT INTO Products (product_name, category, price, stock_quantity, supplier_id) VALUES
('Soccer Ball', 'Sports Equipment', 19.99, 100, 1),
('Tennis Racket', 'Sports Equipment', 89.99, 50, 2),
('Running Shoes', 'Footwear', 49.99, 200, 3),
('Basketball', 'Sports Equipment', 29.99, 150, 4),
('Hiking Backpack', 'Outdoor Gear', 59.99, 70, 5),
('Yoga Mat', 'Fitness', 15.99, 300, 6),
('Baseball Glove', 'Sports Equipment', 39.99, 90, 7),
('Cycling Helmet', 'Safety Gear', 25.99, 120, 8),
('Golf Club Set', 'Sports Equipment', 199.99, 30, 9),
('Swimming Goggles', 'Swimming', 9.99, 400, 10);

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL,
    address VARCHAR(150) NOT NULL
);

-- Insert into Customers
INSERT INTO Customers (first_name, last_name, email, phone_number, address) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St, Springfield, IL'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak Rd, Chicago, IL'),
('Michael', 'Johnson', 'michael.johnson@example.com', '5551234567', '789 Pine Ave, Peoria, IL'),
('Emily', 'Davis', 'emily.davis@example.com', '4445556666', '101 Maple St, Naperville, IL'),
('David', 'Martinez', 'david.martinez@example.com', '6667778888', '202 Birch Ln, Joliet, IL'),
('Sarah', 'Garcia', 'sarah.garcia@example.com', '3334445555', '303 Cedar Blvd, Rockford, IL'),
('James', 'Rodriguez', 'james.rodriguez@example.com', '2223334444', '404 Elm St, Decatur, IL'),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '1112223333', '505 Walnut St, Bloomington, IL'),
('William', 'Moore', 'william.moore@example.com', '7778889999', '606 Pine St, Champaign, IL'),
('Sophia', 'Taylor', 'sophia.taylor@example.com', '8889990000', '707 Ash Dr, Urbana, IL');

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    shipping_address VARCHAR(150) NOT NULL,
    CONSTRAINT FK_Orders_Customers
      FOREIGN KEY (customer_id)
      REFERENCES Customers (customer_id)
);

-- Insert into Orders
INSERT INTO Orders (customer_id, order_date, total_amount, status, shipping_address) VALUES
(1, '2024-12-01', 59.97, 'Shipped', '123 Main St, Springfield, IL'),
(2, '2024-12-02', 89.99, 'Processing', '456 Oak Rd, Chicago, IL'),
(3, '2024-12-03', 199.99, 'Delivered', '789 Pine Ave, Peoria, IL'),
(4, '2024-12-04', 29.99, 'Shipped', '101 Maple St, Naperville, IL'),
(5, '2024-12-05', 15.99, 'Processing', '202 Birch Ln, Joliet, IL'),
(6, '2024-12-06', 39.99, 'Shipped', '303 Cedar Blvd, Rockford, IL'),
(7, '2024-12-07', 25.99, 'Delivered', '404 Elm St, Decatur, IL'),
(8, '2024-12-08', 9.99, 'Processing', '505 Walnut St, Bloomington, IL'),
(9, '2024-12-09', 49.99, 'Shipped', '606 Pine St, Champaign, IL'),
(10, '2024-12-10', 19.99, 'Delivered', '707 Ash Dr, Urbana, IL');

-- Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Order_Items_Orders
      FOREIGN KEY (order_id)
      REFERENCES Orders (order_id),
    CONSTRAINT FK_Order_Items_Products
      FOREIGN KEY (product_id)
      REFERENCES Products (product_id)
);

-- Insert into Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 3, 19.99),
(2, 2, 1, 89.99),
(3, 3, 1, 199.99),
(4, 4, 1, 29.99),
(5, 5, 1, 15.99),
(6, 6, 1, 39.99),
(7, 7, 1, 25.99),
(8, 8, 1, 9.99),
(9, 9, 1, 49.99),
(10, 10, 2, 9.99);
