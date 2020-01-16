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


SELECT Chef 
FROM Cater join Dishes
ON Cater.Dish = Dishes.Dish
GROUP BY Chef
HAVING COUNT(*) = (SELECT COUNT(*) FROM Dishes)

--First join table Cater and Dishes. 
--Find the Chef in the joined table whose dishes' number is equal to the number of the dishes in the Dishes table.