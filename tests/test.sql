DROP DATABASE IF EXISTS CollegeDB;
CREATE DATABASE CollegeDB;

USE CollegeDB;

-- Create the required Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30),
    Credits INT,
    DepartmentID INT
);

-- Check table structure
DESCRIBE Course;

-- Check that the table exists
SELECT COUNT(*) AS TableExists
FROM information_schema.tables
WHERE table_schema = 'CollegeDB'
AND table_name = 'Course';

-- Check required columns
SELECT COUNT(*) AS RequiredColumns
FROM information_schema.columns
WHERE table_schema = 'CollegeDB'
AND table_name = 'Course'
AND column_name IN
('CourseID', 'CourseName', 'Credits', 'DepartmentID');

-- Display Course records
SELECT * FROM Course;

-- Count records
SELECT COUNT(*) AS RecordCount
FROM Course;
