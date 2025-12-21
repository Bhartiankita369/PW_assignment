USE Subqueries;

SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM sales

-- 1: Retrieve the names of employees who earn more than the average salary of all employees.
SELECT name, salary FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);


-- 2: Find the employees who belong to the department with the highest average salary.
SELECT e.emp_id, e.name, e.department_id, e.salary
FROM employees e
WHERE e.department_id = (SELECT department_id
						 FROM employees
                         GROUP BY department_id
						 ORDER BY AVG(salary) DESC
					     LIMIT 1);


-- 3: List all employees who have made at least one sale.
SELECT e.emp_id, e.name, s.sale_amount 
FROM employees e
JOIN sales s on e.emp_id = s.emp_id;


-- 4:Find the employee with the highest sale amount.
SELECT e.emp_id,e.name, s.sale_amount
FROM employees e
JOIN sales s
ON e.emp_id = s.emp_id
WHERE s.sale_amount = (SELECT MAX(sale_amount) FROM sales);


-- 5: Retrieve the names of employees whose salaries are higher than Shubham’s salary
SELECT name, salary FROM employees 
WHERE salary > (SELECT Salary FROM employees WHERE name = 'Shubham')
ORDER BY SALARY;

-- Intermediate Level

-- 1: Find employees who work in the same department as Abhishek.
SELECT e.name, e.department_id, d.department_name
FROM employees e
join departments d on e.department_id = d.department_id
WHERE e.department_id = (SELECT department_id FROM employees 
       WHERE name = 'Abhishek');                  


-- 2: List departments that have at least one employee earning more than ₹60,000.
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 60000;


-- 3: Find the department name of the employee who made the highest sale.
SELECT d.department_name
FROM sales s
JOIN employees e on s.emp_id = e.emp_id
JOIN departments d on e.department_id = d.department_id
WHERE s.sale_amount = (SELECT MAX(sale_amount)
                       FROM sales);


-- 4: Retrieve employees who have made sales greater than the average sale amount.
SELECT name, e.emp_id, s.sale_amount
FROM sales s
JOIN employees e ON s.emp_id = e.emp_id
JOIN departments d ON e.department_id = d.department_id
WHERE s.sale_amount > (SELECT Avg(sale_amount)
                        FROM sales);


-- 5: Find the total sales made by employees who earn more than the average salary.
SELECT SUM(s.sale_amount) AS total_sales
FROM sales s
JOIN employees e ON s.emp_id = e.emp_id
WHERE e.salary > (SELECT AVG(salary) 
                   FROM employees);

-- advanced Level

-- 1.Find employees who have not made any sales.
SELECT e.emp_id, e.name
FROM employees e
LEFT JOIN sales s on e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;


-- 2.List departments where the average salary is above ₹55,000.
SELECT d.department_id, d.department_name, AVG(e.salary) as avg_salary
FROM departments d
JOIN employees e on d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 55000;


-- 3.Retrieve department names where the total sales exceed ₹10,000.
SELECT d.department_name, sum(s.sale_amount) as total_sales
FROM sales s
JOIN employees e on s.emp_id = e.emp_id
JOIN departments d on e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(s.sale_amount) > 10000;


-- 4.Find the employee who has made the second-highest sale.
SELECT e.emp_id, e.name, s.sale_amount
FROM employees e
JOIN sales s on e.emp_id = s.emp_id
WHERE s.sale_amount = (SELECT MAX(sale_amount) FROM sales
					   WHERE sale_amount < (SELECT MAX(sale_amount)
                       FROM sales));


-- 5.Retrieve the names of employees whose salary is greater than the highest sale amount recorded
SELECT name, salary
FROM employees
WHERE salary > (SELECT MAX(sale_amount) FROM sales);
