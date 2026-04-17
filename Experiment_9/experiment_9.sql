CREATE SCHEMA emp_package;
 
CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER,
    department VARCHAR2(50)
);


 

INSERT INTO employee VALUES (1, 'Sejal', 50000, 'AI');
INSERT INTO employee VALUES (2, 'Rahul', 45000, 'IT');
INSERT INTO employee VALUES (3, 'Priya', 60000, 'HR');

COMMIT;

 

CREATE OR REPLACE PACKAGE emp_package AS

    -- Procedure to display all employees
    PROCEDURE get_all_employees;

    -- Procedure to display employee by ID
    PROCEDURE get_employee_by_id(p_id NUMBER);

END emp_package;

 

CREATE OR REPLACE PACKAGE BODY emp_package AS

    -- Shared Cursor
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary, department FROM employee;

    -- Procedure to display all employees
    PROCEDURE get_all_employees IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE(
                'ID: ' || rec.emp_id ||
                ', Name: ' || rec.emp_name ||
                ', Salary: ' || rec.salary ||
                ', Dept: ' || rec.department
            );
        END LOOP;
    END;

    -- Procedure to display employee by ID
    PROCEDURE get_employee_by_id(p_id NUMBER) IS
    BEGIN
        FOR rec IN (SELECT * FROM employee WHERE emp_id = p_id) LOOP
            DBMS_OUTPUT.PUT_LINE(
                'ID: ' || rec.emp_id ||
                ', Name: ' || rec.emp_name ||
                ', Salary: ' || rec.salary ||
                ', Dept: ' || rec.department
            );
        END LOOP;
    END;

END emp_package;
/


 





SET SERVEROUTPUT ON;

 


-- DISPLAY ALL EMPLOYEES
BEGIN
    EMP_PACKAGE.GET_ALL_EMPLOYEES;
END;
/

-- DISPLAY SPECIFIC EMPLOYEE
BEGIN
    EMP_PACKAGE.GET_EMPLOYEE_BY_ID(1);
END;
/
