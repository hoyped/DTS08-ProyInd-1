create database Proyecto;
use Proyecto;


-- Creación de Tablas
DROP TABLE IF EXISTS `Amazon`;
CREATE TABLE IF NOT EXISTS `Amazon` (
  	`show_id` 		VARCHAR(10),
  	`type` 			VARCHAR(30),
  	`title`		 	VARCHAR(200),
    `director`		TEXT(500),
  	`cast`	 		TEXT(1000),
    `country`		VARCHAR(100),
    `date_added`	VARCHAR(50),
    `release_year`	INTEGER,
    `rating`		VARCHAR(10),
	`duration`		VARCHAR(10),
    `listed_in`		VARCHAR(100),
    `description`	TEXT(2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\amazon.csv'
INTO TABLE `Amazon` 
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `Disney`;
CREATE TABLE IF NOT EXISTS `Disney` (
  	`show_id` 		VARCHAR(10),
  	`type` 			VARCHAR(30),
  	`title`		 	VARCHAR(200),
    `director`		TEXT(500),
  	`cast`	 		TEXT(1000),
    `country`		VARCHAR(150),
    `date_added`	VARCHAR(50),
    `release_year`	INTEGER,
    `rating`		VARCHAR(10),
	`duration`		VARCHAR(10),
    `listed_in`		VARCHAR(100),
    `description`	TEXT(2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\disney.csv'
INTO TABLE `Disney` 
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `Hulu`;
CREATE TABLE IF NOT EXISTS `Hulu` (
  	`show_id` 		VARCHAR(10),
  	`type` 			VARCHAR(30),
  	`title`		 	VARCHAR(200),
    `director`		TEXT(500),
  	`cast`	 		TEXT(1000),
    `country`		VARCHAR(150),
    `date_added`	VARCHAR(50),
    `release_year`	INTEGER,
    `rating`		VARCHAR(10),
	`duration`		VARCHAR(10),
    `listed_in`		VARCHAR(100),
    `description`	TEXT(2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hulu.csv'
INTO TABLE `Hulu` 
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `Netflix`;
CREATE TABLE IF NOT EXISTS `Netflix` (
  	`show_id` 		VARCHAR(10),
  	`type` 			VARCHAR(30),
  	`title`		 	VARCHAR(200),
    `director`		TEXT(500),
  	`cast`	 		TEXT(1000),
    `country`		VARCHAR(150),
    `date_added`	VARCHAR(50),
    `release_year`	INTEGER,
    `rating`		VARCHAR(10),
	`duration`		VARCHAR(10),
    `listed_in`		VARCHAR(100),
    `description`	TEXT(2000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\netflix.csv'
INTO TABLE `Netflix` 
FIELDS TERMINATED BY ';' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


SELECT * FROM Amazon;
SELECT * FROM Disney;
SELECT * FROM Hulu;
SELECT * FROM Netflix;


-- Generación campo id (primera letra nombre plataforma + show_id
ALTER TABLE Amazon ADD id VARCHAR(15) NOT NULL AFTER show_id;
UPDATE Amazon SET id = CONCAT('a', show_id);

ALTER TABLE Disney ADD id VARCHAR(15) NOT NULL AFTER show_id;
UPDATE Disney SET id = CONCAT('d', show_id);

ALTER TABLE Hulu ADD id VARCHAR(15) NOT NULL AFTER show_id;
UPDATE Hulu SET id = CONCAT('h', show_id);

ALTER TABLE Netflix ADD id VARCHAR(15) NOT NULL AFTER show_id;
UPDATE Netflix SET id = CONCAT('n', show_id);


-- Reemplazar valores nulos con el string "G"
UPDATE Amazon
SET rating = 'G'
WHERE rating = '';

UPDATE Disney
SET rating = 'G'
WHERE rating = '';

UPDATE Hulu
SET rating = 'G'
WHERE rating = '';

 
 -- Cambiar fechas a formato AAAA-mm-dd
-- UPDATE amazon SET fechadef = DATE_FORMAT(STR_TO_DATE(date_added, '%M %d, %Y'), '%Y-%m-%d');

ALTER TABLE amazon ADD fecha VARCHAR(15) NULL AFTER description;
UPDATE amazon SET fecha = date_added;
UPDATE amazon SET fecha = REPLACE(fecha, ', ', ' ');
ALTER TABLE amazon ADD mes VARCHAR(15) NOT NULL AFTER fecha;
ALTER TABLE amazon ADD dia INTEGER NOT NULL AFTER mes;
ALTER TABLE amazon ADD anio INTEGER NOT NULL AFTER dia;
UPDATE amazon SET mes = SUBSTRING_INDEX(fecha, ' ', 1);
UPDATE amazon SET anio = SUBSTRING_INDEX(fecha, ' ', -1);
UPDATE amazon SET dia = SUBSTRING(fecha, LOCATE(' ', fecha) + 1, 2);
UPDATE amazon
SET mes = 12
WHERE mes = 'December';
ALTER TABLE amazon ADD COLUMN new_date VARCHAR(20) NOT NULL AFTER fecha;
UPDATE amazon SET new_date = CONCAT(anio, '-', mes, '-', dia);
UPDATE amazon SET new_date = NULL WHERE new_date = '--';

ALTER TABLE disney ADD fecha VARCHAR(15) NOT NULL AFTER description;
UPDATE disney SET fecha = (date_added);
UPDATE disney SET fecha = REPLACE(fecha, ', ', ' ');
ALTER TABLE disney ADD mes VARCHAR(15) NOT NULL AFTER fecha;
ALTER TABLE disney ADD dia INTEGER NOT NULL AFTER mes;
ALTER TABLE disney ADD anio INTEGER NOT NULL AFTER dia;
UPDATE disney SET mes = SUBSTRING_INDEX(fecha, ' ', 1);
UPDATE disney SET anio = SUBSTRING_INDEX(fecha, ' ', -1);
UPDATE disney SET dia = SUBSTRING(fecha, LOCATE(' ', fecha) + 1, 2);
UPDATE disney
SET mes = 12
WHERE mes = 'December';
ALTER TABLE disney ADD COLUMN new_date VARCHAR(20) NOT NULL AFTER anio;
UPDATE disney SET new_date = CONCAT(anio, '-', mes, '-', dia);
UPDATE disney SET new_date = NULL WHERE new_date = '--';

ALTER TABLE hulu ADD fecha VARCHAR(15) NOT NULL AFTER description;
UPDATE hulu SET fecha = (date_added);
UPDATE hulu SET fecha = REPLACE(fecha, ', ', ' ');
ALTER TABLE hulu ADD mes VARCHAR(15) NOT NULL AFTER fecha;
ALTER TABLE hulu ADD dia INTEGER NOT NULL AFTER mes;
ALTER TABLE hulu ADD anio INTEGER NOT NULL AFTER dia;
UPDATE hulu SET mes = SUBSTRING_INDEX(fecha, ' ', 1);
UPDATE hulu SET anio = SUBSTRING_INDEX(fecha, ' ', -1);
UPDATE hulu SET dia = SUBSTRING(fecha, LOCATE(' ', fecha) + 1, 2);
UPDATE hulu
SET mes = 12
WHERE mes = 'December';
ALTER TABLE hulu ADD COLUMN new_date VARCHAR(20) NOT NULL AFTER anio;
UPDATE hulu SET new_date = CONCAT(anio, '-', mes, '-', dia);
UPDATE hulu SET new_date = NULL WHERE new_date = '--';

ALTER TABLE netflix ADD fecha VARCHAR(25) NULL AFTER description;
UPDATE netflix SET fecha = date_added;
UPDATE netflix SET fecha = REPLACE(fecha, ', ', ' ');
UPDATE netflix SET fecha = LTRIM(fecha);
ALTER TABLE netflix ADD mes VARCHAR(15) NOT NULL AFTER fecha;
ALTER TABLE netflix ADD dia VARCHAR(5) NOT NULL AFTER mes;
ALTER TABLE netflix ADD anio VARCHAR(5) NOT NULL AFTER dia;
UPDATE netflix SET mes = SUBSTRING_INDEX(fecha, ' ', 1);
UPDATE netflix SET anio = SUBSTRING_INDEX(fecha, ' ', -1);
UPDATE netflix SET dia = SUBSTRING(fecha, LOCATE(' ', fecha) + 1, 2);
UPDATE netflix
SET mes = 12
WHERE mes = 'December';
ALTER TABLE netflix ADD COLUMN new_date VARCHAR(20) AFTER fecha;
UPDATE netflix SET new_date = CONCAT(anio, '-', mes, '-', dia);
UPDATE netflix SET new_date = NULL WHERE new_date = '--';


-- Cambiar campos de texto a minúsculas
UPDATE Amazon as a
SET a.type = LOWER(a.type);

UPDATE Amazon
SET title = LOWER(title);

UPDATE Amazon
SET director = LOWER(director);

UPDATE Amazon
SET cast = LOWER(cast);

UPDATE Amazon
SET country = LOWER(country);

UPDATE Amazon
SET rating = LOWER(rating);

UPDATE Amazon
SET duration = LOWER(duration);

UPDATE Amazon
SET listed_in = LOWER(listed_in);

UPDATE Amazon as a
SET a.description = LOWER(a.description);


UPDATE Disney as a
SET a.type = LOWER(a.type);

UPDATE Disney
SET title = LOWER(title);

UPDATE Disney
SET director = LOWER(director);

UPDATE Disney
SET cast = LOWER(cast);

UPDATE Disney
SET country = LOWER(country);

UPDATE Disney
SET rating = LOWER(rating);

UPDATE Disney
SET duration = LOWER(duration);

UPDATE Disney
SET listed_in = LOWER(listed_in);

UPDATE Disney as a
SET a.description = LOWER(a.description);


UPDATE Hulu as a
SET a.type = LOWER(a.type);

UPDATE Hulu
SET title = LOWER(title);

UPDATE Hulu
SET director = LOWER(director);

UPDATE Hulu
SET cast = LOWER(cast);

UPDATE Hulu
SET country = LOWER(country);

UPDATE Hulu
SET rating = LOWER(rating);

UPDATE Hulu
SET duration = LOWER(duration);

UPDATE Hulu
SET listed_in = LOWER(listed_in);

UPDATE Hulu as a
SET a.description = LOWER(a.description);


UPDATE Netflix as a
SET a.type = LOWER(a.type);

UPDATE Netflix
SET title = LOWER(title);

UPDATE Netflix
SET director = LOWER(director);

UPDATE Netflix
SET cast = LOWER(cast);

UPDATE Netflix
SET country = LOWER(country);

UPDATE Netflix
SET rating = LOWER(rating);

UPDATE Netflix
SET duration = LOWER(duration);

UPDATE Netflix
SET listed_in = LOWER(listed_in);

UPDATE Netflix as a
SET a.description = LOWER(a.description);


-- Convertir campo "duration" en "duration_int(integer) y duration_type(string)
-- SELECT SUBSTRING_INDEX(duration, ' ', 1) AS duration_int, SUBSTRING_INDEX(duration, ' ', -1) AS duration_type FROM Amazon;
ALTER TABLE Amazon ADD duration_int INTEGER NOT NULL AFTER duration;
ALTER TABLE Amazon ADD duration_type VARCHAR(15) NOT NULL AFTER duration_int;
UPDATE Amazon SET duration_int = SUBSTRING_INDEX(duration, ' ', 1), duration_type = SUBSTRING_INDEX(duration, ' ', -1);

-- SELECT SUBSTRING_INDEX(duration, ' ', 1) AS duration_int, SUBSTRING_INDEX(duration, ' ', -1) AS duration_type FROM Disney;
ALTER TABLE Disney ADD duration_int INTEGER NOT NULL AFTER duration;
ALTER TABLE Disney ADD duration_type VARCHAR(15) NOT NULL AFTER duration_int;
UPDATE Disney SET duration_int = SUBSTRING_INDEX(duration, ' ', 1), duration_type = SUBSTRING_INDEX(duration, ' ', -1);

-- SELECT SUBSTRING_INDEX(duration, ' ', 1) AS duration_int, SUBSTRING_INDEX(duration, ' ', -1) AS duration_type FROM Hulu;
ALTER TABLE Hulu ADD duration_int INTEGER NOT NULL AFTER duration;
ALTER TABLE Hulu ADD duration_type VARCHAR(15) NOT NULL AFTER duration_int;
UPDATE Hulu SET duration = '0 SIN_DATO' WHERE duration = ' ';
UPDATE Hulu SET duration_int = SUBSTRING_INDEX(duration, ' ', 1), duration_type = SUBSTRING_INDEX(duration, ' ', -1);

-- SELECT SUBSTRING_INDEX(duration, ' ', 1) AS duration_int, SUBSTRING_INDEX(duration, ' ', -1) AS duration_type FROM Netflix;
ALTER TABLE Netflix ADD duration_int INTEGER NOT NULL AFTER duration;
ALTER TABLE Netflix ADD duration_type VARCHAR(15) NOT NULL AFTER duration_int;
UPDATE Netflix SET duration = '0 SIN_DATO' WHERE duration = ' ';
UPDATE Netflix SET duration_int = SUBSTRING_INDEX(duration, ' ', 1), duration_type = SUBSTRING_INDEX(duration, ' ', -1);

