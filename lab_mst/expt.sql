CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT
);
INSERT INTO Employee (EmpID, EmpName, Salary) VALUES
(1, 'Rahul', 45000),
(2, 'Neha', 60000),
(3, 'Amit', 70000),
(4, 'Priya', 48000),
(5, 'Karan', 90000);

SELECT EmpID,EmpName,Salary
From Employee
WHERE Salary>50000;