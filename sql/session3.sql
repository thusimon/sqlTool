SHOW DATABASES;

CREATE DATABASE lu_sql;

DROP DATABASE lu_sql;

USE lu_sql;

SELECT database();

CREATE TABLE cats(
  name VARCHAR(100),
  age INT
);

SHOW TABLES;

SHOW COLUMNS FROM cats;

DESC cats;

DROP TABLE cats;

-- this is a comment
