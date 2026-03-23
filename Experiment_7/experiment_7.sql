CREATE TABLE department(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(20)
);

CREATE TABLE emp(
emp_id INT PRIMARY KEY,
name VARCHAR(20),
dept_id INT REFERENCES department(dept_id),
salary NUMERIC
);
INSERT INTO department VALUES(1, 'IT'), (2, 'HR'), (3, 'SALES');
INSERT INTO emp VALUES(101, 'Sam', 1, 55000);
INSERT INTO emp VALUES(102, 'Arjun', 1, 75000);
INSERT INTO emp VALUES(103, 'Sahima', 2, 90000);
INSERT INTO emp VALUES(104, 'Ravi', 2, 65000);
INSERT INTO emp VALUES(105, 'John', 3, 85000);

CREATE VIEW V_SIMPLE AS
SELECT name, salary FROM emp WHERE salary>75000;

SELECT * FROM V_SIMPLE;

CREATE VIEW V_COMPLEX AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emp e JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_COMPLEX;

CREATE MATERIALIZED VIEW V_MATERIALIZED AS
SELECT d.dept_name, SUM(e.salary) AS total_budget, AVG(e.salary) AS avg_sal
FROM emp e JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT * FROM V_MATERIALIZED;

REFRESH MATERIALIZED VIEW V_MATERIALIZED;

EXPLAIN ANALYZE SELECT * FROM V_SIMPLE;