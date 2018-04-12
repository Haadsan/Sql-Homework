DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name VARCHAR(255)
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARChAR(255),
  album_id INT REFERENCES albums(id)
);
