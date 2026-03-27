CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);

INSERT INTO employees (emp_name, gender, salary) VALUES
('Amit', 'Male', 30000),
('Riya', 'Female', 35000),
('John', 'Male', 28000),
('Sneha', 'Female', 40000),
('Rahul', 'Male', 32000);



CREATE OR REPLACE PROCEDURE  get_Employee_Count_BY_Gender (IN IN_GENDER VARCHAR(20), OUT OUT_COUNT INT, INOUT STATUS VARCHAR(20))
AS
$$
	BEGIN

		SELECT COUNT(*) INTO OUT_COUNT  FROM employees  WHERE GENDER='Male';
		STATUS:='SUCCESS';
	
	END;

$$ LANGUAGE PLPGSQL;


DO
$$
DECLARE
GEN VARCHAR(20):='Male';
Count_of_Employee int;
STATUS VARCHAR:='Pending';
BEGIN
	CALL  get_Employee_Count_BY_Gender(GEN,Count_of_Employee,STATUS);
	RAISE NOTICE 'YOUR COUNT OF EMPLOYEE BY GENDER IS % AND YOUR STATUS IS %',Count_of_Employee,STATUS;
END;