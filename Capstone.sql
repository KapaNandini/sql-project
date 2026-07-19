                                
                                -- DATABASE OF E-COMMERCE DATABASE SYSTEM
                                 
create database shopsphere_db;
use shopsphere_db;   

-- USERS TABLE 
create table users (
user_id int auto_increment primary key,
user_name varchar(50) not null,
email varchar(100) unique not null,
ph_no varchar(15));
desc users;

-- CATERGORIES TABLE
create table categories(
category_id int auto_increment primary key,
category_name varchar(100) unique not null);
desc categories;

-- PRODUCTS TABLE
create table products(
product_id int auto_increment primary key,
category_id int not null,
product_name varchar(150) not null,
price decimal(10,2) not null check(price > 0),
stock int not null default 0 check(stock >= 0),

foreign key(category_id)
references categories (category_id));
desc products;

-- CART TABLE
create table cart(
cart_id int auto_increment primary key,
user_id int not null,
product_id int not null,
quantity int not null check(quantity > 0),

foreign key (user_id)
references users(user_id),

foreign key (product_id)
references products(product_id));
desc cart;

-- ORDERS TABLE
create table orders(
order_id int not null primary key,
user_id int not null,
order_date date,
total_amount decimal(10,2) not null check(total_amount > 0),
order_status varchar(30) default 'Pending',

foreign key (user_id)
references users(user_id));
desc orders;

-- ORDER_ITEMS TABLE
create table order_items(
order_item_id int auto_increment primary key,
order_id int not null,
product_id int not null,
quantity int not null check(quantity > 0),
price decimal(10,2) not null check(price > 0),

foreign key (order_id)
references orders(order_id),

foreign key (product_id)
references products(product_id));
desc order_items;

-- PAYMEMTS TABLE
create table payments(
payment_id int auto_increment primary key,
order_id int unique not null,
payment_method varchar(30),
payment_status varchar(30) default 'Pending',
payment_date date not null,
amount decimal(10,2) check(amount > 0),

foreign key (order_id)
references orders(order_id));
desc payments;

-- REVIEWS TABLE
create table reviews(
review_id int auto_increment primary key,
user_id int not null,
product_id int not null,
rating int check(rating between 1 and 5),
review_text text,

foreign key (user_id)
references users(user_id),

foreign key (product_id)
references products(product_id));
desc reviews;

-- WISHLIST TABLE
create table wishlist(
wishlist_id int auto_increment primary key,
user_id int not null,
product_id int not null,

foreign key (user_id)
references users(user_id),

foreign key (product_id)
references products(product_id));
desc wishlist;

-- AUDIT_LOGS TABLE
create table audit_Logs (
    log_id int auto_increment primary key,
    action varchar(50) not null,
    table_name varchar(50) not null,
    log_time timestamp default current_timestamp
);
desc audit_logs;

-- MODULE 4 – POPULATE THE DATABASE
-- USERS TABLE
insert into users (user_name, email, ph_no) values
('Aarav Sharma','aarav@gmail.com','9876543210'),
('Diya Patel','diya@gmail.com','9876543211'),
('Rahul Verma','rahul@gmail.com','9876543212'),
('Sneha Reddy','sneha@gmail.com','9876543213'),
('Arjun Kumar','arjun@gmail.com','9876543214'),
('Priya Singh','priya@gmail.com','9876543215'),
('Rohit Mehta','rohit@gmail.com','9876543216'),
('Ananya Gupta','ananya@gmail.com','9876543217'),
('Karthik Rao','karthik@gmail.com','9876543218'),
('Meera Nair','meera@gmail.com','9876543219'),
('Vikram Joshi','vikram@gmail.com','9876543220'),
('Pooja Das','pooja@gmail.com','9876543221'),
('Nikhil Jain','nikhil@gmail.com','9876543222'),
('Kavya Iyer','kavya@gmail.com','9876543223'),
('Aditya Mishra','aditya@gmail.com','9876543224'),
('Neha Kapoor','neha@gmail.com','9876543225'),
('Siddharth Roy','siddharth@gmail.com','9876543226'),
('Riya Choudhary','riya@gmail.com','9876543227'),
('Manoj Kumar','manoj@gmail.com','9876543228'),
('Ishita Sharma','ishita@gmail.com','9876543229');
select * from users;

-- CATEGORIES TABLE
insert into categories(category_name) values
('Electronics'),
('Fashion'),
('Books'),
('Home Appliances'),
('Sports');
select * from categories;

-- PRODUCTS TABLE
insert into Products(category_id,product_name,price,stock) values
(1,'iPhone 16',85000,20),
(1,'Samsung Galaxy S25',78000,25),
(1,'OnePlus 13',62000,30),
(1,'Dell Inspiron Laptop',65000,15),
(1,'HP Pavilion Laptop',70000,12),
(1,'Sony Headphones',8500,40),
(1,'Boat Earbuds',2500,60),
(1,'Apple Watch',45000,18),
(2,'Nike Running Shoes',5500,50),
(2,'Adidas T-Shirt',1800,75),
(2,'Levis Jeans',2800,45),
(2,'Puma Jacket',4200,30),
(2,'Woodland Boots',6500,22),
(2,'RayBan Sunglasses',7500,20),
(3,'Atomic Habits',650,100),
(3,'Rich Dad Poor Dad',550,90),
(3,'The Alchemist',499,80),
(3,'Think Like a Monk',699,70),
(3,'Ikigai',450,85),
(3,'Harry Potter',899,60),
(4,'Prestige Pressure Cooker',3200,30),
(4,'Milton Water Bottle',650,100),
(4,'Philips Mixer Grinder',4800,20),
(4,'Pigeon Gas Stove',3500,18),
(4,'Dinner Set',2100,25),
(5,'SG Cricket Bat',3200,40),
(5,'Football',1200,50),
(5,'Yonex Badminton Racket',2600,35),
(5,'Yoga Mat',850,60),
(5,'Skipping Rope',350,100);
select * from products;

-- CART TABLE 
insert into cart (user_id, product_id, quantity) values
(1, 1, 1),
(2, 5, 2),
(3, 10, 1),
(4, 15, 3),
(5, 20, 1),
(6, 25, 2),
(7, 30, 1),
(8, 8, 1),
(9, 12, 2),
(10, 18, 1),
(11, 22, 1),
(12, 27, 2),
(13, 3, 1),
(14, 7, 1),
(15, 14, 2),
(16, 19, 1),
(17, 24, 3),
(18, 29, 1),
(19, 6, 2),
(20, 11, 1);
select * from cart;

-- ORDERS TABLE
insert into orders (order_id, user_id, order_date, total_amount, order_status) values
(101, 1, '2026-07-01', 85000.00, 'Delivered'),
(102, 2, '2026-07-02', 140000.00, 'Delivered'),
(103, 3, '2026-07-03', 1800.00, 'Shipped'),
(104, 4, '2026-07-04', 1950.00, 'Pending'),
(105, 5, '2026-07-05', 450.00, 'Delivered'),
(106, 6, '2026-07-06', 7000.00, 'Delivered'),
(107, 7, '2026-07-07', 850.00, 'Shipped'),
(108, 8, '2026-07-08', 45000.00, 'Delivered'),
(109, 9, '2026-07-09', 2800.00, 'Pending'),
(110, 10, '2026-07-10', 1200.00, 'Delivered'),
(111, 11, '2026-07-11', 65000.00, 'Delivered'),
(112, 12, '2026-07-12', 3200.00, 'Shipped'),
(113, 13, '2026-07-13', 2500.00, 'Delivered'),
(114, 14, '2026-07-14', 899.00, 'Pending'),
(115, 15, '2026-07-15', 7500.00, 'Delivered'),
(116, 16, '2026-07-16', 1800.00, 'Delivered'),
(117, 17, '2026-07-17', 4800.00, 'Shipped'),
(118, 18, '2026-07-18', 3200.00, 'Delivered'),
(119, 19, '2026-07-19', 62000.00, 'Pending'),
(120, 20, '2026-07-20', 550.00, 'Delivered');
select * from orders;

-- ORDER_ITEMS TABLE
insert into order_Items (order_id, product_id, quantity, price) values
(101,1,1,85000.00),
(101,6,1,8500.00),
(102,2,1,78000.00),
(102,8,1,45000.00),
(103,10,1,1800.00),
(103,15,1,650.00),
(104,16,2,550.00),
(104,22,1,4800.00),
(105,19,1,450.00),
(105,30,2,850.00),
(106,13,1,6500.00),
(106,29,1,2600.00),
(107,30,1,850.00),
(107,27,1,3200.00),
(108,8,1,45000.00),
(108,7,2,2500.00),
(109,11,1,2800.00),
(109,24,1,650.00),
(110,28,1,1200.00),
(110,26,1,3200.00),
(111,4,1,65000.00),
(111,6,1,8500.00),
(112,27,1,3200.00),
(112,21,1,3200.00),
(113,7,1,2500.00),
(113,22,1,4800.00),
(114,20,1,899.00),
(114,15,1,650.00),
(115,14,1,7500.00),
(115,10,2,1800.00),
(116,26,1,1800.00),
(116,25,1,2100.00),
(117,22,1,4800.00),
(117,23,1,3500.00),
(118,27,1,3200.00),
(118,29,1,2600.00),
(119,3,1,62000.00),
(119,9,1,5500.00),
(120,16,1,550.00),
(120,17,1,499.00),
(102,5,1,70000.00),
(104,18,1,699.00),
(106,24,1,650.00),
(108,12,1,4200.00),
(110,30,1,850.00),
(112,28,1,1200.00),
(114,21,1,3200.00),
(116,13,1,6500.00),
(118,2,1,78000.00),
(120,6,1,8500.00);
select * from order_items;

-- PAYMENTS TABLE
insert into payments (order_id, payment_method, payment_status, payment_date, amount) values
(101,'UPI','Completed','2026-07-01',85000.00),
(102,'Credit Card','Completed','2026-07-02',140000.00),
(103,'Debit Card','Completed','2026-07-03',1800.00),
(104,'Cash on Delivery','Pending','2026-07-04',1950.00),
(105,'UPI','Completed','2026-07-05',450.00),
(106,'Net Banking','Completed','2026-07-06',7000.00),
(107,'Debit Card','Completed','2026-07-07',850.00),
(108,'Credit Card','Completed','2026-07-08',45000.00),
(109,'UPI','Pending','2026-07-09',2800.00),
(110,'Cash on Delivery','Completed','2026-07-10',1200.00),
(111,'Credit Card','Completed','2026-07-11',65000.00),
(112,'UPI','Completed','2026-07-12',3200.00),
(113,'Net Banking','Completed','2026-07-13',2500.00),
(114,'Debit Card','Pending','2026-07-14',899.00),
(115,'Credit Card','Completed','2026-07-15',7500.00),
(116,'UPI','Completed','2026-07-16',1800.00),
(117,'Cash on Delivery','Completed','2026-07-17',4800.00),
(118,'Net Banking','Completed','2026-07-18',3200.00),
(119,'Credit Card','Pending','2026-07-19',62000.00),
(120,'UPI','Completed','2026-07-20',550.00);
select * from payments;

-- REVIEWS TABLE 
INSERT INTO Reviews (user_id, product_id, rating, review_text) VALUES
(1,1,5,'Excellent product'),
(2,2,4,'Very good quality'),
(3,3,5,'Worth the price'),
(4,4,4,'Good performance'),
(5,5,5,'Highly recommended'),
(6,6,4,'Nice sound quality'),
(7,7,3,'Average product'),
(8,8,5,'Amazing watch'),
(9,9,4,'Comfortable shoes'),
(10,10,5,'Good fabric'),
(11,11,4,'Fits perfectly'),
(12,12,5,'Very stylish'),
(13,13,4,'Strong and durable'),
(14,14,5,'Looks premium'),
(15,15,5,'Excellent book'),
(16,16,4,'Very informative'),
(17,17,5,'Interesting story'),
(18,18,4,'Motivational book'),
(19,19,5,'Loved reading it'),
(20,20,5,'Best fantasy novel'),
(1,21,4,'Useful kitchen product'),
(2,24,5,'Very good quality'),
(3,27,5,'Excellent cricket bat'),
(4,29,4,'Lightweight racket'),
(5,30,5,'Good for daily exercise');
select * from reviews;

-- WISHLIST TABLE
insert into wishlist (user_id, product_id) values
(1,5),
(2,8),
(3,1),
(4,12),
(5,15),
(6,18),
(7,22),
(8,25),
(9,30),
(10,7),
(11,10),
(12,14),
(13,17),
(14,21),
(15,24),
(16,27),
(17,29),
(18,3),
(19,6),
(20,20);
select * from wishlist;

                                          -- MODULE 5 – CRUD OPERATIONS

-- CUSTOMER PLACES AN ORDER
insert into orders (order_id, user_id, order_date, total_amount, order_status) values
(121, 5, '2026-07-17', 500.00, 'Pending');
select * from orders;
insert into order_items (order_id, product_id, quantity, price) values
(121, 13, 1, 6500.00);
select * from order_items;
insert into payments (order_id, payment_method, payment_status, payment_date, amount) values
(121,'UPI','Completed', '2026-07-17',6500.00);
select * from payments;

-- ADMIN UPDATES PRODUCTS PRICE
update products set price = 9000.00 where product_id = 6;
select * from products;

-- WAREHOUSE REMOVES DISCONTINUED PRODUCTS
delete from wishlist where product_id = 30;
delete from cart where product_id = 30;
delete from reviews where product_id = 30;
delete from order_items where product_id = 30;
delete from products where product_name = 'Skipping Rope';
select * from products;

                                             -- MODULE 6 -- BUSINESS QUERIES

-- DISPLAY ALL ORDERS OF A PARTICULAR CUSTOMER
select o.*, u.user_name , p.product_name, oi.quantity , oi.price 
from users u
join orders o
on u.user_id = o.user_id
join order_items oi
on o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
where u.user_id = 5;

-- SHOW PRODUCTS RUNNIG LOW ON STOCK
select * from products where stock < 20;

-- FIND TODAY'S REVENUE
select sum(amount) as Todays_revenue from payments where payment_date = current_date();

-- DISPLAY CUSTOMERS WHO NEVER PLACED AN ORDER
insert into users (user_name, email, ph_no) values ('Mohitha','mohitha@gmail.com','9876543009');
select user_id , user_name from users where user_id not in (select user_id from orders);

-- FIND THE HIGHEST-SELLING PRODUCT 
select * from products where product_id = 
(select product_id from order_items group by product_id order by sum(quantity) desc limit 1);

-- DISPLAY THE CATEGORY GENERATING THE HIGHEST REVENUE 
select * from categories where category_id = 
(select category_id from products where product_id = 
(select product_id from order_items group by product_id order by sum(quantity * price) desc limit 1));

-- 1. DISPLAY ALL PENDING ORDERS
select * from orders where order_status = 'pending';

-- 2. DISPLAY OUT OF STOCK PRODUCTS
select * from products where stock = 0;

-- 3. DISPLAY ALL PRODUCTS IN ELECTRONICS CATEGORY 
select * from products where category_id = 1;

-- 4. DISPLAY ALL PRODUCTS PRICED ABOVE 10000
select * from products where price > 10000;

-- 5. FIND THE MOST EXPENSIVE PRODUCT
select * from products where price = (select max(price) from products);

-- 6. DISPLAY TOTAL NUMBER OF ORDERS PLACED
select count(*) as Total_orders from orders;

-- 7. COUNT THE NUMBER OF PRODUCTS IN EACH CATEGORY
select category_id, count(product_id) Total_products from products group by category_id;

-- 8. COUNT THE NUMBER OF ORDERS PLACED BY EACH CUSTOMER
select user_id, count(order_id) from orders Total_orders group by user_id;

-- 9. FIND THE MAXIMUM PRODUCT PRICE
select max(price) as Max_price from products;

-- 10. FIND THE MINIMUM PRODUCT PRICE
select min(price) as Min_price from products;

-- 11. DISPLAY PRODUCTS FROM HIGHEST PRICE TO LOWEST
select * from products order by price desc;

-- 12. DISPLAY PRODUCTS FROM LOWEST PRICE TO HIGHEST
select * from products order by price;

-- 13. FIND THE AVERAGE PRODUCT PRICE
select avg(price) as AVG_PRICE from products;

-- 14. DISPLAY CATEGORIES HAVING MORE THAN 5 PRODUCTS
select category_id,
       count(product_id) as total_products
from products
group by category_id 
having count(product_id) > 5;

-- 15. DISPLAY THE TOP 5 MOST EXPENSIVE PRODUCTS
select * from products order by price desc limit 5;

													-- MODULE 7 -- JOINS

-- 1. DISPLAY CUSTOMER ORDERS WITH PRODUCT DETAILS (INNER JOIN)
select u.user_name,
       o.order_id,
       p.product_name,
       oi.quantity,
       oi.price
from users u
join orders o
on u.user_id = o.user_id
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id;

-- 2. DISPLAY PRODUCTS WITH THEIR CATEGORY (INNER JOIN)
select p.product_name,
       c.category_name,
       p.price,
       p.stock
from Products p
join Categories c
on p.category_id = c.category_id;

-- 3. DISPLAY ALL USERS AND THEIR ORDERS (LEFT JOIN)
select u.user_name,
       o.order_id,
       o.order_status
from Users u
left join Orders o
on u.user_id = o.user_id;

-- 4. DISPLAY ALL PRODUCTS AND THEIR REVIEWS (LEFT JOIN)
select p.product_name,
       r.rating,
       r.review_text
from Products p
left join Reviews r
on p.product_id = r.product_id;

-- 5. DISPLAY ALL ORDERS WITH CUSTOMER DETAILS (RIGHT JOIN)
select u.user_name,
       o.order_id,
       o.total_amount
from Users u
right join Orders o
on u.user_id = o.user_id;

-- 6. DISPLAY ALL PAYMENTS WITH ORDER DETAILS (RIGHT JOIN)
select o.order_id,
       p.payment_method,
       p.payment_status,
       p.amount
from Orders o
right join Payments p
on o.order_id = p.order_id;

-- 7. DISPLAY USER DETAILS USING SELF JOIN (SELF JOIN)
select u1.user_id,
       u1.user_name,
       u2.user_name AS Another_User
from Users u1
join Users u2
on u1.user_id <> u2.user_id
limit 10;

-- 8. DISPLAY USERS WITH DIFFERENT EMAILS (SELF JOIN)
select u1.user_name,
       u2.user_name
from Users u1
join Users u2
on u1.user_id < u2.user_id
limit 10;

-- 9. DISPLAY CUSTOMER PAYMENT HISTORY (INNER JOIN)
select u.user_name,
       o.order_id,
       p.payment_method,
       p.payment_status,
       p.amount
from Users u
join Orders o
on u.user_id = o.user_id
join Payments p
on o.order_id = p.order_id;

-- 10. DISPLAY WISHLIST WITH PRODUCT DETAILS (INNER JOIN)
select u.user_name,
       p.product_name,
       p.price
from Wishlist w
join Users u
on w.user_id = u.user_id
join Products p
on w.product_id = p.product_id;

											-- MODULE 8 -- SUBQUERIES

-- 1. PRODUCTS PRICED ABOVE THE AVERAGE PRICE
select *
from Products
where price > (
    select avg(price)
    from Products
);

-- 2. CUSTOMERS SPENDING MORE THAN THE AVERAGE CUSTOMER
select *
from Orders
where total_amount > (
    select avg(total_amount)
    from Orders
);

-- 3. PRODUCTS NEVER ORDERED
select *
from Products
where product_id not in (
    select product_id
    from Order_Items
);

-- 4. HIGHEST SPENDING CUSTOMER
select *
from Users
where user_id = (
    select user_id
    from Orders
    order by total_amount desc
    limit 1
);

-- 5. PRODUCTS WITH STOCK GREATER THAN AVERAGE STOCK
select *
from Products
where stock > (
    select avg(stock)
    from Products
);

-- 6. PRODUCTS WITH THE HIGHEST PRICE
select *
from Products
where price = (
    select MAX(price)
    from Products
);

-- 7. PRODUCTS WITH THE LOWEST PRICE
select *
from Products
where price = (
    select MIN(price)
    from Products
);

-- 8. CUSTOMERS WHO PAID USING UPI
select *
from Users
where user_id in (
    select user_id
    from Orders
    where order_id in (
        select order_id
        from Payments
        where payment_method = 'UPI'
    )
);

-- 9. PRODUCTS PRESENT IN THE WISHLIST
select *
from Products
where product_id in (
    select product_id
    from Wishlist
);

-- 10. CUSTOMERS WHO GAVE A 5-STAR RATING
select *
from Users
where user_id in (
    select user_id
    from Reviews
    where rating = 5
);

                                             -- MODULE 9 -- VIEWS
											
-- 1. CUSTOMER ORDER SUMMARY
create view Customer_Order_Summary as
select
    u.user_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status
from Users u
join Orders o
on u.user_id = o.user_id;
select * from Customer_Order_Summary;

-- 2. PRODUCT SALES SUMMARY
create view Product_Sales_Summary as
select
    p.product_name,
    SUM(oi.quantity) as Total_Sold,
    SUM(oi.quantity * oi.price) as Total_Revenue
from Products p
join Order_Items oi
on p.product_id = oi.product_id
group by p.product_name;
select * from Product_Sales_Summary;

-- 3. CUSTOMER PAYMENT HISTORY
create view Customer_Payment_History as
select
    u.user_name,
    o.order_id,
    p.payment_method,
    p.payment_status,
    p.amount,
    p.payment_date
from Users u
join Orders o
on u.user_id = o.user_id
join Payments p
on o.order_id = p.order_id;
select * from Customer_Payment_History;

-- 4. LOW STOCK PRODUCTS
create view Low_Stock_Products as
select
    product_id,
    product_name,
    stock
from Products
where stock < 20;
select * from Low_Stock_Products;

                                       -- module 10 -- stored procedures
                                       
-- 1. add a product
delimiter $$

create procedure add_product(
    in p_category_id int,
    in p_product_name varchar(150),
    in p_price decimal(10,2),
    in p_stock int
)
begin
    insert into products(category_id, product_name, price, stock)
    values(p_category_id, p_product_name, p_price, p_stock);
end $$

delimiter ;
call add_product(2, 'nike cap', 1200, 50);

-- 2. display customer order history
delimiter $$

create procedure customer_order_history(
    in p_user_id int
)
begin
    select *
    from orders
    where user_id = p_user_id;
end $$

delimiter ;
call customer_order_history(5);

-- 3. calculate customer spending
delimiter $$

create procedure customer_spending(
    in p_user_id int
)
begin
    select user_id,
           sum(total_amount) as total_spending
    from orders
    where user_id = p_user_id
    group by user_id;
end $$

delimiter ;
call customer_spending(5);

-- 4. display low stock products
delimiter $$

create procedure low_stock()
begin
    select *
    from products
    where stock < 20;
end $$

delimiter ;
call low_stock();

--5. update product price
delimiter $$

create procedure update_product_price(
    in p_product_id int,
    in p_new_price decimal(10,2)
)
begin
    update products
    set price = p_new_price
    where product_id = p_product_id;
end $$

delimiter ;
call update_product_price(6, 9500);

                                         -- module 11 -- triggers

-- 1. record product insertion in audit_logs
delimiter $$
create trigger trg_product_insert
after insert on products
for each row
begin
    insert into audit_logs(action, table_name)
    values('insert', 'products');
end $$
delimiter ;
insert into products(category_id, product_name, price, stock)
values(2, 'nike socks', 500, 40);
select * from audit_logs;

-- 2. record product update in audit_logs
delimiter $$
create trigger trg_product_update
after update on products
for each row
begin
    insert into audit_logs(action, table_name)
    values('update', 'products');
end $$
delimiter ;
update products
set price = 9500
where product_id = 6;
select * from audit_logs;

-- 3. record product deletion in audit_logs
delimiter $$
create trigger trg_product_delete
after delete on products
for each row
begin
    insert into audit_logs(action, table_name)
    values('delete', 'products');
end $$
delimiter ;
delete from products
where product_id = 31;
select * from audit_logs;

-- 4. prevent invalid price update
delimiter $$
create trigger trg_check_price
before update on products
for each row
begin
    if new.price <= 0 then
        signal sqlstate '45000'
        set message_text = 'price must be greater than zero';
    end if;
end $$
delimiter ;
update products
set price = -100
where product_id = 5;

                                              -- module 12 -- transactions

start transaction;

-- customer places an order
insert into orders(order_id, user_id, order_date, total_amount, order_status)
values(122, 8, '2026-07-21', 2500.00, 'pending');

-- add order item
insert into order_items(order_id, product_id, quantity, price)
values(122, 7, 1, 2500.00);

-- save transaction
savepoint order_created;

-- update stock
update products
set stock = stock - 1
where product_id = 7;

-- payment failed
rollback to order_created;

commit;

select * from orders where order_id = 122;
select * from order_items where order_id = 122;
select * from products where product_id = 7;

                                          -- module 13 -- string functions

-- 1. CONVERT CUSTOMER NAMES TO UPPERCASE
select upper(user_name) as customer_name from users;

-- 2. CONVERT CUSTOMER NAMES TO LOWERCASE
select lower(user_name) as customer_name from users;

-- 3. GENERATE USERNAMES
select concat(user_name,'_',user_id) as username from users;

-- 4. EXTRACT EMAIL DOMAIN
select email,substring(email, locate('@',email)+1) as domain from users;

-- 5. DISPLAY FIRST 5 CHARACTERS OF PRODUCT NAME
select product_name,left(product_name,5) as first_five from products;

-- 6. DISPLAY LAST 4 CHARACTERS OF PRODUCT NAME
select product_name,right(product_name,4) as last_four from products;

-- 7. FIND LENGTH OF PRODUCT NAME
select product_name,length(product_name) as total_characters from products;

-- 8. REPLACE 'BOOK' WITH 'NOVEL'
select replace(product_name,'Book','Novel') as new_name from products;

-- 9. REMOVE EXTRA SPACES FROM CUSTOMER NAME
select trim(user_name) as customer_name from users;

-- 10. REVERSE PRODUCT NAME
select product_name, reverse(product_name) as reverse_name from products;

										-- module 14 -- date functions

-- 1. ORDERS PLACED TODAY
select *from orders where order_date = curdate();

-- 2. ORDERS PLACED THIS MONTH
select *from orders where month(order_date) = month(curdate()) and year(order_date) = year(curdate());

-- 3. MONTHLY REVENUE
select month(payment_date) as month,sum(amount) as revenue from payments group by month(payment_date);

-- 4. DISPLAY ORDERS PLACED IN JULY
select * from orders where month(order_date) = 7;

-- 5. DISPLAY PAYMENTS MADE THIS YEAR
select * from payments where year(payment_date) = year(curdate());

-- 6. DISPLAY DAY OF EACH ORDER
select order_id,order_date,dayname(order_date) as day from orders;

-- 7. DISPLAY MONTH NAME OF EACH PAYMENT
select payment_id,payment_date, monthname(payment_date) as month_name from payments;

-- 8. DISPLAY ORDERS AFTER 10 JULY 2026
select * from orders where order_date > '2026-07-10';

-- 9. DISPLAY TOTAL ORDERS PLACED EACH DAY
select order_date,count(order_id) as total_orders from orders group by order_date;

-- 10. DISPLAY PAYMENT MADE IN THE LAST 7 DAYS 
select * from payments where payment_date >= date_sub(curdate(), interval 7 day);

                                        -- module 15 -- DCL

-- 1. create administrator
create user 'administrator'@'localhost' identified by 'admin123';
Grant all privileges on shopsphere_db.* to 'administrator'@'localhost';

-- 2. create inventory manager
create user 'inventory_manager'@'localhost' identified by 'inventory123';
grant select, insert, update on shopsphere_db.products to 'inventory_manager'@'localhost';
grant select, insert, update on shopsphere_db.categories to 'inventory_manager'@'localhost';

-- 3. create customer support
create user 'customer_support'@'localhost' identified by 'support123';
grant select on shopsphere_db.users to 'customer_support'@'localhost';
grant select on shopsphere_db.orders to 'customer_support'@'localhost';
grant select on shopsphere_db.payments to 'customer_support'@'localhost';
flush privileges;

show grants for 'administrator'@'localhost';
show grants for 'inventory_manager'@'localhost';
show grants for 'customer_support'@'localhost';