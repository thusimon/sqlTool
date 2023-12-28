CREATE TABLE people(
  name VARCHAR(100),
  bd DATE,
  bt TIME,
  bdt DATETIME
);

INSERT INTO people(name, bd, bt, bdt)
VALUES  ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00'),
        ('Lulu', '1985-09-25', '15:20:00', '1985-12-25 15:20:00'),
        ('Juan', '2020-08-31', '23:04:09', '2000-12-25 23:04:09');

INSERT INTO people(name, bd, bt, bdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

SELECT bdt, DAYOFWEEK(bdt), MONTHNAME(bdt), HOUR(bt) FROM people;

SELECT bdt, DATE_FORMAT(bdt, 'It is %a, %M-%d-%Y::%h:%i\(%p\)') FROM people;

SELECT DATEDIFF(NOW(), bdt) FROM people;

SELECT DATE_ADD(NOW(), INTERVAL 12 YEAR);

SELECT NOW() - INTERVAL 18 YEAR;

CREATE TABLE tweets(
  texts VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
