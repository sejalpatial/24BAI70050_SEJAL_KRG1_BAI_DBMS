-- Step 1: Create EMPLOYEE t
CREATE TABLE employee (
    emp_id        NUMERIC PRIMARY KEY,
    emp_name      VARCHAR(50),
    department    VARCHAR(50),
    salary        NUMERIC,
    joining_date  DATE
);

-- Step 2: Insert sample records
INSERT INTO employee (emp_id, emp_name, department, salary, joining_date) VALUES
(1, 'Amit',   'HR',        25000, '2021-06-15'),
(2, 'Riya',   'HR',        35000, '2020-03-10'),
(3, 'Suresh', 'IT',        45000, '2019-01-25'),
(4, 'Neha',   'IT',        30000, '2022-07-18'),
(5, 'Karan',  'Finance',   20000, '2021-11-05'),
(6, 'Pooja',  'Finance',   55000, '2018-09-12'),
(7, 'Rahul',  'Sales',     28000, '2020-02-20'),
(8, 'Anita',  'Sales',     42000, '2019-08-30');

SELECT department,
       AVG(salary)::NUMERIC(10,2) AS avg_salary
FROM employeee
GROUP BY department;

SELECT emp_id, emp_name, salary
FROM employeee
WHERE salary > 20000;

SELECT department,
       AVG(salary)::NUMERIC(10,2) AS avg_salary
FROM employeee
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department,
       AVG(salary)::NUMERIC(10,2) AS avg_salary
FROM employeee
GROUP BY department
ORDER BY AVG(salary) DESC;

SELECT department,
       AVG(salary)::NUMERIC(10,2) AS avg_salary
FROM employeee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;


