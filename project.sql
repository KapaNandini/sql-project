create database company_management;
use company_management;

create table departments (
dept_id	INT primary key,
dept_name VARCHAR(50) unique,
location VARCHAR(50) default 'Hyderabad');
desc departments;

create table employees (
emp_id INT primary key,
emp_name VARCHAR(50) not null,
email VARCHAR(100) unique,
age	INT CHECK(age >= 18),
salary DECIMAL(10,2),
city VARCHAR(50) default 'Hyderabad',
dept_id	INT,
joining_date DATE);
desc employees;

insert into departments (Dept_id, dept_name,location) values
(1001, 'IT','PUNE'),
(1002,'HR', 'MUMBAI'),
(1003, 'Finance', 'BANGLORE'),
(1004, 'Marketing', 'KURNOOL'),
(1005, 'Operations', default);
select * from departments;

INSERT INTO employees
(emp_id, emp_name, email, age, salary, city, dept_id, joining_date)
VALUES
(101,'Rahul','rahul@gmail.com',25,35000,'Hyderabad',1001,'2023-01-10'),
(102,'Priya','priya@gmail.com',27,42000,'Mumbai',1002,'2022-06-15'),
(103,'Amit','amit@gmail.com',30,50000,'Pune',1001,'2021-09-20'),
(104,'Sneha','sneha@gmail.com',24,38000,'Bangalore',1003,'2023-03-12'),
(105,'Kiran','kiran@gmail.com',29,55000,'Chennai',1004,'2020-11-18'),
(106,'Anjali',NULL,26,36000,'Hyderabad',1005,'2024-02-05'),
(107,'Ravi','ravi@gmail.com',31,62000,'Delhi',1002,'2019-08-14'),
(108,'Meena','meena@gmail.com',28,47000,'Vizag',1003,'2022-10-10'),
(109,'Arjun','arjun@gmail.com',23,34000,'Kurnool',1004,'2024-01-20'),
(110,'Divya',NULL,25,39000,'Mumbai',1001,'2023-07-01'),
(111,'Vijay','vijay@gmail.com',32,68000,'Hyderabad',1005,'2018-12-12'),
(112,'Pooja','pooja@gmail.com',27,45000,'Bangalore',1002,'2021-05-19'),
(113,'Nikhil','nikhil@gmail.com',29,53000,'Pune',1003,'2020-06-22'),
(114,'Keerthi','keerthi@gmail.com',24,37000,'Chennai',1004,'2024-03-15'),
(115,'Suresh','suresh@gmail.com',35,75000,'Delhi',1001,'2017-09-30'),
(116,'Lavanya','lavanya@gmail.com',26,41000,'Vizag',1002,'2022-08-18'),
(117,'Ramesh','ramesh@gmail.com',33,64000,'Hyderabad',1003,'2019-04-25'),
(118,'Swathi','swathi@gmail.com',28,48000,'Kurnool',1004,'2021-12-11'),
(119,'Manoj','manoj@gmail.com',30,56000,'Mumbai',1005,'2020-10-09'),
(120,'Deepika','deepika@gmail.com',25,40000,'Bangalore',1001,'2023-11-28');
select * from employees;

-- Display all employees
select emp_name from employees;

-- Display employee names and salaries
select emp_name, salary from employees;

-- Display employees from Hyderabad
select * from employees where city = 'Hyderabad';

-- Display employees earning above ₹50,000
select * from employees where salary > 50000;

-- WHERE CLAUSE

-- Employees from IT department
select * from employees where dept_id = 1001;

-- Employees from Hyderabad AND salary > 50,000
select * from employees where city = 'Hyderabad' and salary > 50000;

-- Employees from HR OR Finance
select * from employees where dept_id = 1002 or dept_id = 1003;

-- Employees NOT from Bangalore
select * from employees where city <>  'Bangalore';


-- LIKE, IN, BETWEEN

-- Names starting with A
select * from employees where emp_name like 'A%';

-- Names ending with a
select * from employees where emp_name like '%a';

-- Employees from Hyderabad, Bangalore and Chennai using IN
select * from employees where city in ( 'Hyderabad' , 'Banglore', 'chennai');

-- Employees with salary BETWEEN 40,000 and 70,000
select * from employees where salary between 40000 and 70000;


-- ORDER BY

-- Sort employees by salary ascending
select * from employees order by salary;

-- Sort employees by salary descending
select * from employees order by salary desc;

-- Sort employees by city and salary
select * from employees order by city,salary;

-- AGGREGATE FUNCTIONS

-- Total employees
select count(*) from employees;

-- Total salary expenditure
select sum(salary) from employees;

-- Average salary
select sum(salary)/count(salary) as avg_salary from employees;

-- Highest salary
select max(salary) from employees;

-- Lowest salary
select min(salary) from employees;

-- GROUP BY

-- Employee count by department
select dept_id, count(*) from employees group by dept_id;

-- Average salary by department
select dept_id, sum(salary)/count(salary) as avg_salary from employees group by dept_id;

-- Highest salary by department
select dept_id, max(salary) as highest_salary from employees group by dept_id;

-- Total salary by city
select city, sum(salary) as total_salary from employees group by city;

-- HAVING

-- Departments having more than 3 employees
select dept_id, count(*) as emp_count from employees group by dept_id having count(*)>3;

-- Departments whose average salary exceeds ₹50,000
select dept_id, sum(salary)/count(salary) as avg_salary from employees group by dept_id having sum(salary)>50000;

-- Cities having more than 2 employees
select city, count(*) from employees group by city having count(*)>2;

-- indexing 
-- NORMAL INDEX
create index INDEX_EMP_NAME on employees (emp_name);

-- UNIQUE INDEX
-- already in employees table we created email using unique
create index index_email on employees (email); 
SHOW INDEXES FROM employees;

-- DCL
create user 'hr1_user'@'localhost' identified by 'hr123';
grant select,update on company_management.employees to 'hr1_user'@'localhost';
create user 'viewer_user'@'localhost' identified by 'viewer123';
grant select on company_management.employees to 'viewer_user'@'localhost';
SHOW GRANTS;

-- challange task_1

-- Find department with highest average salary.
select dept_id, sum(salary)/count(salary) as avg_high_salary from employees group by dept_id order by avg_high_salary desc limit 1;

-- challange task_2

-- Find city spending the highest amount on salaries.
select city, sum(salary) as high_salary from employees group by city order by high_salary desc limit 1;

-- challange task_3

-- Display departments whose total salary exceeds ₹200,000.
select dept_id, sum(salary) as total_salary from employees group by dept_id having sum(salary) > 200000;

-- challange task_4

SELECT dept_id,
       COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       sum(salary)/count(salary) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary 
FROM employees
GROUP BY dept_id;