--Oracle
--use livesql.oracle.com

CREATE TABLE Courses ( 
    SID INTEGER NOT NULL, 
    ClassName CHAR(30) NOT NULL, 
    GRADE CHAR,
    PRIMARY KEY (SID, ClassName));

INSERT INTO Courses (SID, ClassName, Grade) VALUES (123, 'ARCH201', 'A');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (123, 'QUAN432', 'B');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (662, 'AMER352', 'B');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (662, 'ECON966', 'A');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (662, 'QUAN432', 'B');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (345, 'QUAN432', 'A');
INSERT INTO Courses (SID, ClassName, Grade) VALUES (345, 'ECON966', 'D');

SELECT ClassName, COUNT(*) AS Total
FROM Courses
GROUP BY ClassName
ORDER BY Total DESC, ClassName;

-- List ClassName and use COUNT to count the number of students who take specific class with GROUP BY ClassName. Output the results in descending order of number of students and ascending order of ClassName.
