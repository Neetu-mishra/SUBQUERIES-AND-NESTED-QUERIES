DROP DATABASE companyDB;
CREATE DATABASE companyDB;
USE companyDB;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'Alice', 101, 50000),
(2, 'Bob', 101, 60000),
(3, 'Charlie', 102, 55000),
(4, 'David', 103, 70000),
(5, 'Eve', 102, 45000);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');
SELECT* FROM employees;
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
SELECT emp_name
FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE dept_name = 'Finance');
SELECT dept_name
FROM departments d
WHERE EXISTS (SELECT 1 FROM employees e WHERE e.dept_id = d.dept_id);
SELECT emp_name,
       (SELECT dept_name FROM departments d WHERE d.dept_id = e.dept_id) AS department
FROM employees e;
SELECT dept_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY dept_id;

