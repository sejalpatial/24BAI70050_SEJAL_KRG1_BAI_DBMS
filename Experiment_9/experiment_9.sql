CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50)
);
CREATE OR REPLACE PROCEDURE insert_student(
    s_name VARCHAR,
    s_age INT,
    s_course VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO student(name, age, course)
    VALUES (s_name, s_age, s_course);
END;
$$;
CREATE OR REPLACE PROCEDURE get_students()
LANGUAGE plpgsql
AS $$
BEGIN
    PERFORM * FROM student;
END;
$$;
CREATE OR REPLACE PROCEDURE update_student(
    s_id INT,
    s_name VARCHAR,
    s_age INT,
    s_course VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE student
    SET name = s_name,
        age = s_age,
        course = s_course
    WHERE id = s_id;
END;
$$;
CREATE OR REPLACE PROCEDURE delete_student(s_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM student WHERE id = s_id;
END;
$$;
CALL insert_student('Sejal', 20, 'CSE');
CALL update_student(1, 'Sejal Patial', 21, 'AI-ML');
CALL delete_student(1);