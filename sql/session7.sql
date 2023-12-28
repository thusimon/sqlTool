-- in mysql CLI
-- source session7.sql

CREATE TABLE books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100),
  author_fname VARCHAR(100),
  author_lname VARCHAR(100),
  released_year INT,
  stock_quantity INT,
  pages INT,
  PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
  ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
  ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
  ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
  ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
  ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
  ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
  ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
  ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
  ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
  ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
  ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
  ('Where I''m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
  ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
  ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
  ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
  ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT CONCAT('a', 'bc', '1');
SELECT CONCAT(author_fname, ' ', author_lname) AS full_name FROM books;
SELECT CONCAT_WS('-', author_fname, author_lname) AS full_name FROM books;

-- SUBSTR is short for SUBSTRING
SELECT SUBSTR('Hello world', 1, 7);
SELECT SUBSTR('Hello world', 7);
SELECT SUBSTR('Hello world', -3, 2);
SELECT
  SUBSTR(title, 1, 15) AS Title
FROM
  books;

-- case sensititive
SELECT REPLACE('hello world', 'o', 'OO');
SELECT REPLACE(title, ' ', '-') AS Title FROM books;

SELECT REVERSE('Hello world!');
SELECT REVERSE(author_lname) AS rev_lname FROM books;

SELECT CHAR_LENGTH('Hello world!');
-- LENGTH will return the bytes length, be cautious with the unicode
SElECT LENGTH('Hello world');
SELECT CHAR_LENGTH(title) AS Title_len FROM books;

SELECT LOWER('Hello World');
SELECT UPPER('Hello World');
SELECT UPPER(title) AS title FROM books;
SELECT CONCAT_WS(' ', 'I love', UPPER(title), '!!!') FROM books;

SELECT INSERT('Hello world', 6, 5, ' there');

SELECT LEFT('Hello world', 5);
SELECT RIGHT('Hello world', 4);

SELECT REPEAT('Ha', 4);

SELECT TRIM('  bos ton ');
SELECT TRIM(LEADING '.' FROM '..    bos ton...   ');
SELECT TRIM(TRAILING '.' FROM '..    bos ton  ...');
SELECT CHAR_LENGTH(TRIM(BOTH '.' FROM '..    bos ton  ...'));
