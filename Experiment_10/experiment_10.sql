-- Step 1: Create Table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Step 2: Create Sequence
CREATE SEQUENCE student_seq START 1;

-- Step 3: Create Function (Trigger Function)
CREATE OR REPLACE FUNCTION student_trigger_function()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := nextval('student_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 4: Create Trigger
CREATE TRIGGER student_trigger
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION student_trigger_function();

-- Step 5: Insert Data
INSERT INTO students (name, age) VALUES ('Sejal', 20);
INSERT INTO students (name, age) VALUES ('Riya', 21);

-- Step 6: View Data
SELECT * FROM students;