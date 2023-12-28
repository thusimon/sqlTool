CREATE TABLE contacts(
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE partiers(
  name VARCHAR(100) NOT NULL,
  age TINYINT UNSIGNED CHECK (age >= 18)
);

INSERT INTO partiers (name, age)
VALUES ('Billy', 18);

CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);

CREATE TABLE partiers2(
  name VARCHAR(100) NOT NULL,
  age TINYINT UNSIGNED,
  CONSTRAINT age_must_valid CHECK (age >= 18)
);

INSERT INTO partiers2 (name, age)
VALUES ('Billy', 18);

CREATE TABLE companies (
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  CONSTRAINT name_address UNIQUE (name , address)
);

INSERT INTO companies(name, address)
VALUES ('GG', '123 MV steet');
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

ALTER TABLE companies
ADD COLUMN phone VARCHAR(20);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

ALTER TABLE companies
DROP COLUMN phone;

RENAME TABLE companies TO Coorps;

ALTER TABLE Coorps
RENAME TO companies;

ALTER TABLE companies
MODIFY company_name VARCHAR(100) NOT NULL DEFAULT 'unknown';

ALTER TABLE companies
CHANGE company_name cname VARCHAR(200) NOT NULL DEFAULT 'unset';

ALTER TABLE companies
ADD CONSTRAINT positive_employee CHECK (employee_count >= 1);

INSERT INTO companies(cname, address, employee_count)
VALUES ('GG2', '1233 MV steet', 0);

ALTER TABLE companies
DROP CONSTRAINT positive_employee;

SELECT * FROM companies;
DESC companies;
