-- Creating a student database
CREATE DATABASE student_performance;

--  Using the current database
USE student_performance;

-- To display the table
SELECT *
FROM students;

-- To display the number of records
SELECT COUNT(*)
FROM students;

-- Display only student names, cities, and marks
SELECT Name, City, Marks
FROM students;

-- Find students who scored more than 80 marks
SELECT Name, Marks
FROM students
WHERE Marks > 80;

-- Find students who belong to Karachi
SELECT Name
FROM students
WHERE City = 'Karachi';

-- Display students in descending order of marks
SELECT Name, Marks
FROM students
ORDER BY Marks DESC;

-- Find the top 5 students based on marks
SELECT Name, Marks
FROM students
ORDER BY Marks DESC LIMIT 5;

-- Display all unique cities represented in the dataset (non-duplicate)
SELECT DISTINCT City
FROM students;

-- Calculate the total number of students
SELECT COUNT(Name)
FROM students;

-- Calculate the average marks of all students
SELECT AVG(Marks) as Average_Marks
FROM students;

-- Find the Highest and Lowest Marks
SELECT MAX(Marks) as Maximum_Mark, MIN(Marks) as Minimum_Mark
FROM students;

-- Calculate the average marks for each subject
SELECT Subject, AVG(Marks)
FROM students
GROUP BY Subject;

-- Count the number of students in each city
SELECT City, COUNT(Name)
FROM students
GROUP BY City;

-- Find the average marks for each gender
SELECT Gender, AVG(Marks) as Average_Marks
FROM students
GROUP BY Gender;

-- Find subjects where the average marks are greater than 75
SELECT Subject, AVG(Marks)       
FROM students
GROUP BY Subject
HAVING AVG(Marks) > 75;

-- Find cities having more than 4 students
SELECT City, COUNT(Name)
FROM students
GROUP BY City
HAVING COUNT(Name) > 4;

-- Find students who scored above the overall average marks
SELECT Name, Marks
FROM students
WHERE Marks >
(
SELECT AVG(Marks)
FROM students
);

-- Find the student with the highest marks
SELECT Name, Marks
FROM students
WHERE Marks =
(
SELECT MAX(Marks)
FROM students
);

-- Categorize students into grades: A (90+), B (80–89), C (70–79), D (60–69), F (below 60).
SELECT Name, Marks,
CASE
WHEN Marks >= 90 THEN 'A'
WHEN Marks >= 80 THEN 'B'
WHEN Marks >= 70 THEN 'C'
WHEN Marks >= 60 THEN 'D'
ELSE 'F'
END AS Grade
FROM students;

-- Find the highest-scoring student in each subject
SELECT s.Name, s.Subject, s.Marks
FROM students s
WHERE s.Marks =
(
SELECT MAX(s2.Marks)
FROM students s2
WHERE s2.Subject = s.Subject
); 

-- Find students whose attendance is below 75%
SELECT Name, Attendance
FROM students
WHERE Attendance < 75;