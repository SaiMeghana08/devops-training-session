CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(20),
    City VARCHAR(50),
    Marks INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Fee DECIMAL(10,2)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(1, 'Meghana', 21, 'Female', 'Chennai', 90),
(2, 'Ravi', 22, 'Male', 'Bengaluru', 75),
(3, 'Priya', 20, 'Female', 'Hyderabad', 88),
(4, 'Arun', 23, 'Male', 'Chennai', 65),
(5, 'Kiran', 21, 'Male', 'Mumbai', 82),
(6, 'Sita', 22, 'Female', 'Bengaluru', 95);

INSERT INTO Courses VALUES
(101, 'Java', 5000),
(102, 'Python', 4000),
(103, 'SQL', 3000),
(104, 'Cloud Computing', 7000);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2026-01-10'),
(2, 1, 103, '2026-01-15'),
(3, 2, 102, '2026-02-01'),
(4, 3, 101, '2026-02-05'),
(5, 3, 103, '2026-02-10'),
(6, 4, 102, '2026-03-01'),
(7, 5, 104, '2026-03-05'),
(8, 6, 101, '2026-03-10');

SELECT *
FROM Students
WHERE Marks > 80;

SELECT
    s.Name,
    c.CourseName,
    e.EnrollmentDate
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID;
    
SELECT
    s.StudentID,
    s.Name,
    SUM(c.Fee) AS TotalFees
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
GROUP BY s.StudentID, s.Name;

SELECT
    s.Name,
    COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
HAVING COUNT(e.CourseID) > 1;

SELECT
    City,
    COUNT(*) AS TotalStudents
FROM Students
GROUP BY City;

SELECT *
FROM Students
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Students
);

SELECT
    Name,
    Marks,
    CASE
        WHEN Marks >= 90 THEN 'Excellent'
        WHEN Marks >= 75 THEN 'Good'
        WHEN Marks >= 60 THEN 'Average'
        ELSE 'Needs Improvement'
    END AS Performance
FROM Students;


SELECT
    s.Name,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID;
    

