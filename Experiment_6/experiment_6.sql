CREATE TABLE Employee(
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR(20),
    role VARCHAR(20),
    salary NUMBER
);
INSERT INTO Employee VALUES (101, 'Simran', 'Engineer', 85000);
INSERT INTO Employee VALUES (102, 'Arnav', 'Designer', 45000);
INSERT INTO Employee VALUES (103, 'Tony', 'Developer', 90000);
INSERT INTO Employee VALUES (104, 'Sam', 'Analyst', 80000);
COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_target_id NUMBER :=101;

BEGIN 
    UPDATE Employee 
    SET salary = salary*1.10
    WHERE emp_id = v_target_id;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ATTRIBUTE SQL%FOUND TRUE');
        DBMS_OUTPUT.PUT_LINE('ROW(S) UPDATED '||SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO ROW UPDATED');
    END IF;

END;
DECLARE
    CURSOR c_engg IS SELECT name, role FROM Employee WHERE role = 'Engineer';
    v_name Employee.name%TYPE;
    v_role Employee.role%TYPE;

BEGIN

    OPEN c_engg;

    IF c_engg%ISOPEN THEN
    DBMS_OUTPUT.PUT_LINE('CURSOR IS OPEN');
    END IF;

    LOOP
        FETCH c_engg INTO v_name, v_role;

        IF c_engg%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('%NOTFOUND IS TRUE, NO MORE RECORDS');
            EXIT;
        END IF;

        DBMS_OUTPUT.PUT_LINE('ENGINEER # '||c_engg%ROWCOUNT|| ': ' 
        || v_name || ' | ' || v_role);
    
    END LOOP;

    CLOSE c_engg;

    IF NOT c_engg%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('CURSOR CLOSED SUCCESSFULLY');
    END IF;
END;
