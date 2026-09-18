USE CollegeDB;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30),
    Credits INT,
    DepartmentID INT
);

INSERT INTO Course (CourseID, CourseName, Credits, DepartmentID)
VALUES
(201, 'Database Management System', 4, 101),
(202, 'Web Technology', 3, 101),
(203, 'Data Structures', 4, 102);

DESCRIBE Course;
