INSERT INTO books
  (title, author_fname, author_lname, released_year, stock_quantity, pages)
  VALUES  ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
          ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
          ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT released_year FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
-- DISTINCT will filter out the duplicates on ALL the selected columns
SELECT DISTINCT author_fname, author_lname FROM books;

SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname;
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname DESC;
SELECT title, pages FROM books ORDER BY pages ASC;
SELECT title, pages FROM books ORDER BY 2 ASC; -- second column, not preferred --

SELECT book_id, author_fname, author_lname, released_year
FROM books
ORDER BY author_lname ASC, released_year DESC;

SELECT author_fname AS name FROM books ORDER BY name;

SELECT title, released_year FROM books ORDER BY released_year LIMIT 5;
SELECT title, released_year FROM books ORDER BY released_year LIMIT 3, 5;

SELECT title, author_fname FROM books
WHERE author_fname LIKE '%da%';

-- % zero or more chars
-- _ exactly one char
SELECT title, author_fname FROM books
WHERE author_fname LIKE '____';

-- escape % or _
SELECT title, author_fname FROM books
WHERE title LIKE '%\%%';
