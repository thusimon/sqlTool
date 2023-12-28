SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) from books;

-- imagine Group by will create multiple sub tables in memory
-- each sub table will have the SAME grouped column
-- so it make sense to selected the grouped column, but other columns have various values
SELECT author_lname, COUNT(*) AS num FROM books
GROUP BY author_lname ORDER BY num DESC;

SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT title, author_fname, released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);

-- group by multiple columns
SELECT
  author_fname,
  author_lname,
  COUNT(*),
  MAX(released_year),
  MIN(released_year)
FROM books
GROUP BY author_fname, author_lname;

SELECT author_lname, SUM(pages) as page FROM books
GROUP BY author_lname
ORDER BY page DESC;

SELECT released_year, COUNT(*), AVG(stock_quantity) as quantity FROM books
GROUP BY released_year
ORDER BY quantity DESC;
