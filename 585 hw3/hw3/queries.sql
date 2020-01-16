CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
--Create Table
CREATE TABLE geometries (name varchar, geom geometry);
INSERT INTO geometries VALUES
	('MRF', 'POINT(-118.2831756 34.0223964)'),
	('DCC', 'POINT(-118.2812501 34.0216359)'),
	('TRO', 'POINT(-118.2823119 34.0192079)'),
	('DOHENY', 'POINT(-118.2841337 34.0203498)'),
	('AHF', 'POINT(-118.2853367 34.0198217)'),
	('SGM', 'POINT(-118.2892712 34.0211550)'),
	('VHE', 'POINT(-118.2881151 34.0201539)'),
	('WAH', 'POINT(-118.2873210 34.0193686)'),
	('SAL', 'POINT(-118.2896730 34.0197113)'),
	('GER', 'POINT(-118.2902002 34.0201861)'),
	('LRC', 'POINT(-118.2878587 34.0244086)'),
	('HOME', 'POINT(-118.2730212 34.0278195)');

SELECT name, ST_AsText(geom) FROM geometries;

--Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM geometries;

--Nearest Neighbors
SELECT NAME, ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.2730212 34.0278195)') as distance 
FROM geometries
WHERE NAME<>'HOME' 
ORDER BY ST_Distance(geom,'POINT(-118.2730212 34.0278195)') 
limit 4;
