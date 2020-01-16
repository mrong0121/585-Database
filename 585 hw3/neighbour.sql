SELECT NAME, ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.2730212 34.0278195)') as distance 
FROM geometries
WHERE NAME<>'HOME' 
ORDER BY ST_Distance(geom,'POINT(-118.2730212 34.0278195)') 
limit 4;


