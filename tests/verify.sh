#!/bin/bash

echo "===================================="
echo "Running SQL Assignment Tests..."
echo "===================================="

MYSQL="mysql -u root -p${MYSQL_ROOT_PASSWORD}"

# Clean database
$MYSQL -e "DROP DATABASE IF EXISTS CollegeDB;"
$MYSQL -e "CREATE DATABASE CollegeDB;"

# Create the required Course table
$MYSQL CollegeDB <<'SQL'
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30),
    Credits INT,
    DepartmentID INT
);
SQL

# Check student solution file
if [ ! -s student_solution.sql ]; then
    echo "❌ student_solution.sql is empty or missing"
    exit 1
fi

# Run student's SQL
$MYSQL CollegeDB < student_solution.sql

# Test 1: Course table exists
TABLE_EXISTS=$($MYSQL -N -B CollegeDB -e "
SELECT COUNT(*)
FROM information_schema.tables
WHERE table_schema='CollegeDB'
AND table_name='Course';
")

if [ "$TABLE_EXISTS" -eq 1 ]; then
    echo "PASS: Course table exists"
else
    echo "FAIL: Course table does not exist"
    exit 1
fi

# Test 2: Check required columns
COLUMNS=$($MYSQL -N -B CollegeDB -e "
SELECT COUNT(*)
FROM information_schema.columns
WHERE table_schema='CollegeDB'
AND table_name='Course'
AND column_name IN ('CourseID','CourseName','Credits','DepartmentID');
")

if [ "$COLUMNS" -eq 4 ]; then
    echo "PASS: All required columns exist"
else
    echo "FAIL: Required columns are missing"
    exit 1
fi

# Test 3: Check at least 3 records
RECORD_COUNT=$($MYSQL -N -B CollegeDB -e "
SELECT COUNT(*) FROM Course;
")

if [ "$RECORD_COUNT" -ge 3 ]; then
    echo "PASS: At least 3 Course records found"
else
    echo "FAIL: Less than 3 Course records found"
    exit 1
fi

# Test 4: Display structure
echo ""
echo "Course Table Structure:"
$MYSQL CollegeDB -e "DESCRIBE Course;"

# Test 5: Display records
echo ""
echo "Course Records:"
$MYSQL CollegeDB -e "SELECT * FROM Course;"

echo ""
echo "===================================="
echo "All tests passed!"
echo "===================================="

exit 0
