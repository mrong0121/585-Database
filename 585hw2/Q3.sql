--Oracle
--use livesql.oracle.com

CREATE TABLE Projects (
    ProjectID CHAR(10) NOT NULL,
    Step INTEGER NOT NULL,
    Status CHAR NOT NULL,
    PRIMARY KEY (ProjectID, Step));

INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P100', 0, 'C');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P100', 1, 'W');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P100', 2, 'W');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P201', 0, 'C');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P201', 1, 'C');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P333', 0, 'W');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P333', 1, 'W');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P333', 2, 'W');
INSERT INTO Projects (ProjectID, Step, Status) VALUES ('P333', 3, 'W');

SELECT DISTINCT ProjectID
FROM Projects P
WHERE Step = 0
AND Status = 'C'
AND 'W' = ALL (SELECT Status
FROM Projects Q
WHERE Step != 0
AND P.ProjectID = Q.ProjectID);

--Use two tables, find all the projects whose Step is 0 and Status is ‘C’.
--In another table find all the status that the corresponding project all the status should be ‘W’ except for the step 0.