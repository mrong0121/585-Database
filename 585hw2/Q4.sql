--Oracle
--use livesql.oracle.com

CREATE TABLE Junkmail ( 
    Name CHAR(10) NOT NULL, 
    Address Char NOT NULL,
    ID INTEGER NOT NULL,
    SameFam INTEGER,
    PRIMARY KEY (ID));

INSERT INTO Junkmail VALUES ('Alice', 'A', 10, NULL);
INSERT INTO Junkmail VALUES ('Bob', 'B', 15, NULL);
INSERT INTO Junkmail VALUES ('Carmen', 'C', 22, NULL);
INSERT INTO Junkmail VALUES ('Diego', 'A', 9, 10);
INSERT INTO Junkmail VALUES ('Ella', 'B', 3, 15);
INSERT INTO Junkmail VALUES ('Farkhad', 'D', 11, NULL);

DELETE 
FROM Junkmail
WHERE SameFam IS NULL AND ID IN (SELECT SameFam FROM Junkmail WHERE SameFam IS NOT NULL);

UPDATE Junkmail
SET SameFam = NULL
WHERE SameFam IS NOT NULL;

SELECT * 
FROM Junkmail;

--Delete rows whose SameFam is NULL and its ID is in others’ SameFam.
--Update table whose Samfam is not null.