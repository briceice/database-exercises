USE brice;

DESCRIBE albums;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE quotes;
DESCRIBE salaries;
DESCRIBE titles;

CREATE UNIQUE INDEX album_artist
    ON albums(name, artist);

DESCRIBE albums;

# WILL NOT RUN DUE TO UNIQUE INDEX ALBUM_ARTIST
INSERT INTO albums (artist, name, release_date, sales, genre)
VALUES ('Michael Jackson', 'Thriller', 2020, 20.2, 'pop');

