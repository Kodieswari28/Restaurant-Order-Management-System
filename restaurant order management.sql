create database restaurant_order_management;
use restaurant_order_management;
create table restaurant(restaurant_id int primary key, name varchar(50),location varchar(50),phone varchar(15));
drop table restaurant;
CREATE TABLE Restaurant(
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    phone VARCHAR(15)
);
INSERT INTO Restaurant VALUES
(1,'Spice Garden','Vijayawada','9876543210'),
(2,'Food Palace','Hyderabad','9876543211');
CREATE TABLE Branch(
    branch_id INT PRIMARY KEY,
    restaurant_id INT,
    branch_name VARCHAR(50),
    FOREIGN KEY(restaurant_id) REFERENCES Restaurant(restaurant_id)
);
CREATE TABLE Employee(
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(30),
    salary DECIMAL(10,2),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES Branch(branch_id)
);
CREATE TABLE Customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
);
CREATE TABLE Customer_Address(
    address_id INT PRIMARY KEY,
    customer_id INT,
    address VARCHAR(100),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Dining_Table(
    table_id INT PRIMARY KEY,
    table_number INT,
    capacity INT,
    status VARCHAR(20)
);
CREATE TABLE Table_Booking(
    booking_id INT PRIMARY KEY,
    customer_id INT,
    table_id INT,
    booking_date DATE,
    booking_time TIME,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY(table_id) REFERENCES Dining_Table(table_id)
);
CREATE TABLE Category(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);
CREATE TABLE Menu_Item(
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(8,2),
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES Category(category_id)
);
CREATE TABLE Ingredient(
    ingredient_id INT PRIMARY KEY,
    name VARCHAR(50),
    quantity INT
);
CREATE TABLE Item_Ingredient(
    item_id INT,
    ingredient_id INT,
    PRIMARY KEY(item_id,ingredient_id),
    FOREIGN KEY(item_id) REFERENCES Menu_Item(item_id),
    FOREIGN KEY(ingredient_id) REFERENCES Ingredient(ingredient_id)
);
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY(employee_id) REFERENCES Employee(employee_id)
);
CREATE TABLE Order_Item(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(item_id) REFERENCES Menu_Item(item_id)
);
CREATE TABLE Bill(
    bill_id INT PRIMARY KEY,
    order_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY(order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Payment(
    payment_id INT PRIMARY KEY,
    bill_id INT,
    payment_mode VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY(bill_id) REFERENCES Bill(bill_id)
);
CREATE TABLE Delivery(
    delivery_id INT PRIMARY KEY,
    order_id INT,
    address VARCHAR(100),
    delivery_status VARCHAR(30),
    FOREIGN KEY(order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Supplier(
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    phone VARCHAR(15)
);
CREATE TABLE Stock(
    stock_id INT PRIMARY KEY,
    ingredient_id INT,
    quantity INT,
    FOREIGN KEY(ingredient_id) REFERENCES Ingredient(ingredient_id)
);
CREATE TABLE Feedback(
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    rating INT,
    comments VARCHAR(200),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Offers(
    offer_id INT PRIMARY KEY,
    offer_name VARCHAR(50),
    discount INT
);
INSERT INTO Restaurant VALUES
(1,'Spice Garden','Vijayawada','9876543210'),
(2,'Food Palace','Hyderabad','9876543211');
INSERT INTO Branch VALUES
(1,1,'Main Branch'),
(2,2,'City Branch');
INSERT INTO Employee VALUES
(1,'Ravi','Manager',45000,1),
(2,'Anil','Chef',35000,1),
(3,'Sneha','Waiter',18000,1),
(4,'Kiran','Chef',32000,2),
(5,'Meena','Cashier',22000,2);
INSERT INTO Customer VALUES
(1,'Rahul','9000000001','rahul@gmail.com'),
(2,'Priya','9000000002','priya@gmail.com'),
(3,'Arjun','9000000003','arjun@gmail.com'),
(4,'Neha','9000000004','neha@gmail.com'),
(5,'Vikram','9000000005','vikram@gmail.com'),
(6,'Asha','9000000006','asha@gmail.com'),
(7,'Rohan','9000000007','rohan@gmail.com'),
(8,'Pooja','9000000008','pooja@gmail.com');
INSERT INTO Customer_Address VALUES
(1,1,'MG Road'),
(2,2,'Benz Circle'),
(3,3,'Patamata'),
(4,4,'Governorpet'),
(5,5,'Auto Nagar');
INSERT INTO Dining_Table VALUES
(1,101,2,'Available'),
(2,102,4,'Booked'),
(3,103,6,'Available'),
(4,104,4,'Booked'),
(5,105,2,'Available');
INSERT INTO Category VALUES
(1,'Starter'),
(2,'Main Course'),
(3,'Dessert'),
(4,'Drinks');
INSERT INTO Menu_Item VALUES
(1,'Paneer Tikka',220,1),
(2,'Chicken 65',250,1),
(3,'Veg Biryani',180,2),
(4,'Chicken Biryani',280,2),
(5,'Ice Cream',100,3),
(6,'Brownie',150,3),
(7,'Coffee',80,4),
(8,'Juice',90,4);
INSERT INTO Table_Booking VALUES
(1,1,2,'2026-06-10','19:00'),
(2,2,4,'2026-06-11','20:00'),
(3,3,1,'2026-06-12','18:30'),
(4,4,3,'2026-06-13','21:00');
INSERT INTO Orders VALUES
(1,1,3,'2026-06-10'),
(2,2,3,'2026-06-11'),
(3,3,2,'2026-06-12'),
(4,4,5,'2026-06-13'),
(5,5,1,'2026-06-13');
INSERT INTO Order_Item VALUES
(1,1,3,2),
(2,2,4,1),
(3,3,1,2),
(4,4,5,3),
(5,5,2,1);
INSERT INTO Bill VALUES
(1,1,460,'Paid'),
(2,2,280,'Paid'),
(3,3,440,'Pending');
INSERT INTO Payment VALUES
(1,1,'UPI','2026-06-10'),
(2,2,'Cash','2026-06-11'),
(3,3,'Card','2026-06-12');
INSERT INTO Supplier VALUES
(1,'Fresh Foods','8888888881'),
(2,'Daily Needs','8888888882');
INSERT INTO Stock VALUES
(1,1,50),
(2,2,40),
(3,3,60);
INSERT INTO Feedback VALUES
(1,1,5,'Excellent food'),
(2,2,4,'Good service');
INSERT INTO Offers VALUES
(1,'Festival Discount',10),
(2,'Weekend Offer',15);
-- query
SELECT * FROM Restaurant;
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Menu_Item;
SELECT * FROM Customer
WHERE name='Rahul';

SELECT * FROM Menu_Item
WHERE price > 200;
SELECT * FROM Dining_Table
WHERE status='Available';

SELECT * FROM Bill
WHERE payment_status='Paid';

SELECT * FROM Employee
WHERE salary > 30000;

SELECT * FROM Menu_Item
ORDER BY price DESC;


SELECT * FROM Customer
ORDER BY name;
SELECT COUNT(*) FROM Customer;

SELECT MAX(total_amount)
FROM Bill;

SELECT MIN(price)
FROM Menu_Item;

SELECT AVG(salary)
FROM Employee;


SELECT SUM(total_amount)
FROM Bill;

SELECT Customer.name, Orders.order_id
FROM Customer
JOIN Orders
ON Customer.customer_id=Orders.customer_id;



SELECT Orders.order_id, Employee.name
FROM Orders
JOIN Employee
ON Orders.employee_id=Employee.employee_id;



SELECT Menu_Item.item_name, Category.category_name
FROM Menu_Item
JOIN Category
ON Menu_Item.category_id=Category.category_id;



SELECT Orders.order_id, Bill.total_amount
FROM Orders
JOIN Bill
ON Orders.order_id=Bill.order_id;

SELECT MAX(total_amount)
FROM Bill
WHERE total_amount <
(SELECT MAX(total_amount) FROM Bill);



SELECT * FROM Menu_Item
WHERE price =
(SELECT MAX(price) FROM Menu_Item);


SELECT Customer.name
FROM Customer
JOIN Table_Booking
ON Customer.customer_id=Table_Booking.customer_id;



SELECT item_id, quantity
FROM Order_Item
WHERE quantity > 1;


SELECT payment_mode, COUNT(*)
FROM Payment
GROUP BY payment_mode;



SELECT * FROM Feedback
WHERE rating=5;



SELECT * FROM Delivery
WHERE delivery_status='Completed';
CREATE VIEW Customer_Order AS
SELECT Customer.name, Orders.order_id
FROM Customer
JOIN Orders
ON Customer.customer_id=Orders.customer_id;


SELECT * FROM Customer_Order;
SELECT order_id,total_amount
FROM Bill
WHERE total_amount >
(SELECT AVG(total_amount) FROM Bill);


SELECT * FROM Menu_Item
WHERE price =
(SELECT MIN(price) FROM Menu_Item);


SELECT COUNT(*)
FROM Table_Booking;