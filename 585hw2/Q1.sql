--Oracle
--use livesql.oracle.com

CREATE TABLE HotelStays ( 
    roomNum Integer NOT NULL,
    arrDate DATE NOT NULL,
    depDate DATE NOT NULL,
    guestName CHAR(30) NOT NULL,
    PRIMARY KEY (roomNum, arrDate),
    CONSTRAINT CheckD CHECK (depDate >= arrDate));
    
CREATE OR REPLACE TRIGGER roomcheck
BEFORE INSERT OR UPDATE ON HotelStays
FOR EACH ROW
DECLARE
num NUMBER;
BEGIN
select count(*) into num
from HotelStays
where :new.roomNum=roomNum and NOT (:new.arrDate>=depDate or :new.depDate<=arrDate);
IF num>0
THEN
  RAISE_APPLICATION_ERROR(-20001, 'Error');
END IF;
END;
/

INSERT INTO HotelStays VALUES (123, to_date('20160202', 'YYYYMMDD'), to_date('20160206', 'YYYYMMDD'), 'A');
INSERT INTO HotelStays VALUES (123, to_date('20160204', 'YYYYMMDD'), to_date('20160208', 'YYYYMMDD'), 'B');
INSERT INTO HotelStays VALUES (201, to_date('20160210', 'YYYYMMDD'), to_date('20160206', 'YYYYMMDD'), 'C');

SELECT * 
FROM HotelStays;

--I set the check when create table HotelStays to check whether the depDate is bigger or equal to the arrDate.
--Use trigger to check whether the same room has time conflict and show the error.
--A: arrDate(20160202), depDate(20160205) and B arrDate(20160205), depDate(20160210) in the same room is allowed.
--A: arrDate(20160202), depDate(20160205) and B arrDate(20160202), depDate(20160202) in the same room is not allowed.
--A same person arrive and departure in the same day for a room is allowed.
