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

CREATE TABLE Dishes(
    Dish Char(30),
    PRIMARY KEY(Dish));

INSERT INTO Dishes VALUES ('Creme brulee'); 
INSERT INTO Dishes VALUES ('Apple pie'); 
INSERT INTO Dishes VALUES ('Tiramisu'); 


SELECT c1.Chef
FROM Cater c1
WHERE c1.Dish IN (SELECT Dish FROM Dishes)
GROUP BY c1.Chef
HAVING COUNT(*) = (SELECT COUNT(*) FROM Dishes);

--I create another table Dishes of the all the dishes that want the chef makes. 
--Then I find the Chef in the table Cater who has all the dishes contained in the table Dishes using count.
--This is a kind of division.