CREATE DATABASE record_company;
USE record_company;
DROP DATABASE record_company;

DROP TABLE bands;

DROP TABLE albums;

DROP TABLE songs;


CREATE TABLE bands (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE albums (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (band_id) REFERENCES bands(id)
);

CREATE TABLE songs(
id INT AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
length FLOAT NOT NULL,
album_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (album_id) REFERENCES albums(id)
);

SELECT * FROM bands;

SELECT * FROM albums;

/*Question 1*/
SELECT * FROM songs;

/*Question 2*/
SELECT name AS "Band Name" FROM bands;

/*Question 3*/
SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;

/*Question 4*/
SELECT DISTINCT bands.id, bands.name AS "Band Name" FROM bands
JOIN albums ON albums.band_id = bands.id
;

/*Question 5*/
SELECT DISTINCT bands.id, bands.name AS "Band Name" FROM bands
JOIN albums ON albums.band_id != bands.id
LIMIT 1
;

/*another solution*/
SELECT DISTINCT bands.id, bands.name AS "Band Name" FROM bands
LEFT JOIN albums ON albums.band_id = bands.id
GROUP BY bands.id
HAVING COUNT(albums.id) = 0
;

/*Question 6*/
SELECT DISTINCT albums.name AS 'Name', albums.release_year AS 'Release Year', SUM(songs.length) AS 'Duration' FROM albums
JOIN songs ON songs.album_id = albums.id
GROUP BY songs.album_id
/*HAVING Duration*/
ORDER BY Duration DESC
LIMIT 1
;

/*Question 7*/
UPDATE albums SET release_year = 1986 WHERE id = 4;

/*Question 8*/
INSERT INTO bands (name) VALUES ('myFavBand');
INSERT INTO albums (name, band_id) VALUES ('myFavAlbum', 8);

/*Question 9*/
DELETE FROM albums WHERE band_id = 8;
DELETE FROM bands WHERE id = 8;

/*Question 10*/
SELECT AVG(songs.length) AS 'Average Song Duration' FROM songs
GROUP BY 'Average Song Duration'
;

/*Question 11*/
SELECT * FROM albums;
SELECT * FROM songs;
SELECT DISTINCT albums.name AS 'Album', albums.release_year, MAX(songs.length) AS 'Duration' FROM albums
LEFT JOIN songs ON songs.album_id = albums.id
GROUP BY albums.id
ORDER BY Duration ASC
;

/*Question 12*/
SELECT * FROM songs;
SELECT * FROM bands;
SELECT * FROM albums;
SELECT bands.name AS 'Band', COUNT(songs.id) AS 'Number of Songs' FROM bands
JOIN albums ON albums.band_id = bands.id
JOIN songs ON songs.album_id = albums.id
GROUP BY bands.name
;

