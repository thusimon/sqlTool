SELECT title, author_lname FROM books WHERE released_year!=2017;

SELECT title FROM books WHERE title NOT LIKE '% %';

SELECT * FROM books WHERE released_year>2005;
SELECT * FROM books WHERE pages<=200;

SELECT * FROM books
WHERE author_lname='Eggers'
  AND released_year > 2010
  && pages > 400; -- AND is preferred

SELECT * FROM books
WHERE released_year NOT BETWEEN 2004 AND 2014; -- include on the end

SELECT * FROM people
WHERE bd < '2005-01-01';

SELECT * FROM people
WHERE YEAR(bd) < 2005;

SELECT * FROM people
WHERE bd
  BETWEEN CAST('2000-01-01' AS DATE)
    AND CAST('2020-01-01' AS DATE);

SELECT * FROM books
WHERE author_lname NOT IN ('Caver', 'lahiri', 'Smith');

SELECT * FROM books
WHERE released_year % 2 != 0;

SELECT title, released_year,
CASE
  WHEN released_year >=2000 THEN 'modern'
  ELSE '20century'
END AS genre
FROM books;

SELECT title, stock_quantity,
CASE
  WHEN stock_quantity <=50 THEN '*'
  WHEN stock_quantity <=100 THEN '**'
  WHEN stock_quantity <=200 THEN '***'
  WHEN stock_quantity <=300 THEN '****'
  ELSE '*****'
END AS stock
FROM books;

SELECT * FROM books WHERE author_lname IS NOT NULL;
