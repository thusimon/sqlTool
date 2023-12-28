INSERT INTO cats (name, age)
VALUES ('Blue Steele', 5);

INSERT INTO cats (age, name)
VALUES  (5, 'Meatball'),
        (1, 'Potato'),
        (8, 'Turkey');

SELECT * FROM cats;

CREATE TABLE cats_2 (
  name VARCHAR(100) NOT NULL DEFAULT 'unknown',
  age INT NOT NULL DEFAULT 0
);

CREATE TABLE cats_unique(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL DEFAULT 'unknown',
  age INT NOT NULL DEFAULT 0
);

INSERT INTO cats_unique(name, age)
VALUES  ('Bingo', 1),
        ('Dingo', 4);
        
SELECT * FROM cats_unique;

DESC cats_unique;
