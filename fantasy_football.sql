# fantasy football DB DESIGN mini-exercise
# three tables
# user: id, username, password
# league: id, name, start_date, end_date, reference to owner (owner_id)
# associative table: members list

# DROP DATABASE IF EXISTS fantasy_football;
# CREATE DATABASE IF NOT EXISTS fantasy_football;

CREATE TABLE IF NOT EXISTS user (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS league (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    owner_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES user (id)
);

CREATE TABLE IF NOT EXISTS members (
    league_id INT UNSIGNED NOT NULL,
    member_id INT UNSIGNED NOT NULL,
    join_date date NOT NULL,
    FOREIGN KEY (league_id) REFERENCES league (id),
    FOREIGN KEY (member_id) REFERENCES user (id)
);