DROP TABLE cats;

CREATE TABLE cats(
  cat_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT
);

-- INSERT INTO ... VALUES ...
INSERT INTO cats(name, breed, age) 
VALUES  ('Ringo', 'Tabby', 4),
        ('Cindy', 'Maine Coon', 10),
        ('Dumbledore', 'Maine Coon', 11),
        ('Egg', 'Persian', 4),
        ('Misty', 'Tabby', 13),
        ('George Michael', 'Ragdoll', 9),
        ('Jackson', 'Sphynx', 7);
       
SELECT name as Name, age AS Age FROM cats;

SELECT * FROM cats WHERE age = 4;

-- SQL is case insensitive by default
SELECT cat_id, name FROM cats WHERE name='eGG';

-- UPDATE ... SET ... WHERE
UPDATE cats SET age=14 WHERE name='Misty';

-- DELETE FROM ... WHERE
DELETE FROM cats WHERE name='Egg';
