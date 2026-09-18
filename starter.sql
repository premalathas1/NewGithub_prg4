-- Student Name:
-- Register No:

-- Create Course table

CREATE TABLE Course
(
    CourseID INT(5),
    CourseName VARCHAR(30),
    Credits INT,
    DepartmentID INT(5)
);

INSERT INTO Course VALUES
(101,'Database Systems',4,1),
(102,'Operating Systems',3,1),
(103,'Computer Networks',4,2);

DESCRIBE Course;
