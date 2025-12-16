CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
    last_name VARCHAR(50),
	department VARCHAR(50),
    salary INT,
    hire_date DATE 
    );
    
INSERT INTO employees 
(employee_id, first_name, last_name, department, salary, hire_date)
VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

-- Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)

SELECT * FROM employees 
ORDER BY salary ASC ;

-- Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)

SELECT * FROM employees 
ORDER BY department ASC, salary DESC ;

-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)

SELECT * FROM employees 
WHERE department = 'IT'
ORDER BY hire_date DESC ;  

-- Q6. Create and Populate a Sales Table

CREATE TABLE sales (
sales_id INT PRIMARY KEY NOT NULL,
customer_name VARCHAR(50),
amount INT,
sales_date DATE 
);

INSERT INTO sales (sales_id, customer_name, amount, sales_date)
VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

-- Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)

SELECT * FROM sales 
ORDER BY amount DESC;

-- Q8. Show All Sales Made by Customer “Aditi”

SELECT * FROM sales 
WHERE customer_name = 'Aditi';

-- Q9. What is the Difference Between a Primary Key and a Foreign Key?
-- Primary Key                                            Foreign Key
   -- Unique identified each row in a table                Links one table to another
   -- Cannot be NULL                                       Can be NULL 
   -- One per table							               Can have many per table 


-- Q10. What Are Constraints in SQL and Why Are They Used?
-- Constraints are rules applied to table columns to control the type of data that can be stored in a table.
-- They prevent invalid data from being inserted, updated, or deleted.
-- Ensure valid data is stored (e.g., age cannot be negative)
-- Maintain relationships between tables(using primary and foreign keys)
-- Prevent duplicate or inconsistent data(e.g., two users cannot have the same ID)
-- Protect data from accidental changes(e.g., restricting deletes if related data exists)



