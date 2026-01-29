DECLARE
emp_name VARCHAR(50):='neha';
emp_id NUMBER:=100;
emp_salary NUMBER:=50000;


BEGIN
    DBMS_OUTPUT.PUT_LINE('NAME OF EMPLOYEE IS '||emp_name);
    DBMS_OUTPUT.PUT_LINE('ID OF EMPLOYEE IS '||emp_id);
    DBMS_OUTPUT.PUT_LINE('SALARY OF EMPLOYEE IS '||emp_salary);

    IF emp_salary>70000 THEN
    DBMS_OUTPUT.PUT_LINE('you will be given increment of 10000');
    ELSE
    DBMS_OUTPUT.PUT_LINE('you will be given increment of 5000');
    END IF;
END;

