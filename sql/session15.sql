-- view is not material table
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT genre, COUNT(genre), AVG(rating) FROM full_reviews
GROUP BY genre;

SHOW TABLES;

-- only some views can be updatable and deletable, there are many limitations
-- like joined views is not updatable
-- this view is updateable
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

DROP VIEW ordered_series;

-- HAVING is mainly for querying after GROUP BY
-- WHERE is mainly for querying before GROUP BY
SELECT title, AVG(rating), COUNT(rating) AS review_count FROM full_reviews
GROUP BY title HAVING review_count > 1;

-- WITH ROLLUP is used with GROUP BY, compute aggregation on all the sub group
SELECT title, AVG(rating), COUNT(rating) AS review_count FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT released_year, genre, AVG(rating) FROM full_reviews
GROUP BY released_year , genre WITH ROLLUP;

-- SQL MODES
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SELECT 3/0;
SHOW WARNINGS;

SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION,ERROR_FOR_DIVISION_BY_ZERO';
