--Oracle
--use livesql.oracle.com

CREATE TABLE Cater(
    Chef CHAR,
    Dish CHAR(30),
    PRIMARY KEY (Chef, Dish));  

INSERT INTO Cater VALUES ('A', 'Apple pie');        
INSERT INTO Cater VALUES ('A', 'Beignet');         
INSERT INTO Cater VALUES ('A', 'Andes Chocolate Cake');       
INSERT INTO Cater VALUES ('B', 'Tiramisu');
INSERT INTO Cater VALUES ('B', 'Creme brulee');
INSERT INTO Cater VALUES ('B', 'Beignet');
INSERT INTO Cater VALUES ('C', 'Tiramisu');
INSERT INTO Cater VALUES ('C', 'Creme brulee');
INSERT INTO Cater VALUES ('D', 'Apple pie');
INSERT INTO Cater VALUES ('D', 'Tiramisu');
INSERT INTO Cater VALUES ('D', 'Creme brulee');
INSERT INTO Cater VALUES ('E', 'Apple pie');
INSERT INTO Cater VALUES ('E', 'Bananas Foster');
INSERT INTO Cater VALUES ('E', 'Creme brulee');
INSERT INTO Cater VALUES ('E', 'Tiramisu');

SELECT c1.Chef 
FROM Cater c1
WHERE c1.Dish = 'Creme brulee'
INTERSECT
SELECT c2.Chef 
FROM Cater c2
WHERE c2.Dish = 'Apple pie'
INTERSECT
SELECT c3.Chef 
FROM Cater c3
WHERE c3.Dish = 'Tiramisu'

--I find all Chefs has Dish 'Creme brulee', 'Apple pie', 'Tiramisu' respectively and intersect them. 
--The result will be the chef who has all three Dishes.
