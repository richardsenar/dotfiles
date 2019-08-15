
# create database
    CREATE DATABASE <name>;

# list databases
    \l

# connect to a database
    \c <database name>

# see current user
    SELECT current_user;

# see current database
    SELECT current_database();

# drop (remove, delete) database
    DROP DATABASE <database name>;

# log out
    \q

# create table
    CREATE TABLE employees (
      ID INT PRIMARY KEY NOT NULL,
      NAME TEXT NOT NULL,
      RANK INT NOT NULL,
      ADDRESS CHAR(50),
      SALARY REAL DEFAULT 25500.00,
      BDAY DATE DEFAULT '1900-01-01'
      );

# auto increment key field
# Instead of creating a unique ID number ourselves, we can have postgres automatically increment this ID field.
# To do this we use the data types smallserial, serial or bigserial (not true types but for convenience).
    CREATE TABLE phonenumbers (
      ID SERIAL PRIMARY KEY,
      PHONE TEXT NOT NULL
      );

# relational databases
    CREATE TABLE phonenumbers (
      ID SERIAL PRIMARY KEY NOT NULL,
      PHONE CHAR(50) NOT NULL,
      EMP_ID INT references employees(ID)
      );

# show details of a table
    \d <table name>

# drop a table
    DROP TABLE <table name>;

# insert a record
    INSERT INTO employees (ID,NAME,RANK,ADDRESS,SALARY,BDAY)
    VALUES (1, 'Mark', 7, '1212 E. Lane, Someville, AK, 57483', 43000.00 ,'1992-01-13');

# list records in a table
    SELECT *
    FROM <table name>;

# DISTINCT
    SELECT DISTINCT column_1, column_2
    FROM <table name>;

# insert a record - variations - omitted values will have the default value
    INSERT INTO employees (ID,NAME,RANK,ADDRESS,BDAY)
    VALUES (2, 'Marian', 8, '7214 Wonderlust Ave, Lost Lake, KS, 22897', '1989-11-21');

# we can use DEFAULT rather leaving a field blank or specifying a value:
    INSERT INTO employees (ID,NAME,RANK,ADDRESS,SALARY,BDAY)
    VALUES (3, 'Maxwell', 6, '7215 Jasmine Place, Corinda, CA 98743', 87500.00, DEFAULT);

# we can insert multiple rows:
    INSERT INTO employees (ID,NAME,RANK,ADDRESS,SALARY,BDAY)
    VALUES
        (4, 'Jasmine', 5, '983 Star Ave., Brooklyn, NY, 00912 ', 55700.00, '1997-12-13' ),
        (5, 'Orranda', 9, '745 Hammer Lane, Hammerfield, Texas, 75839', 65350.00 , '1992-12-13'),
        (6, 'Sarah', 19, '745 Hammer Lane, Hammerfield, Texas, 75839', 65350.00 , '1992-12-13');

# CROSS join
    SELECT person.NAME, sport.NAME
    FROM person
    CROSS JOIN sport;

# INNER join
    SELECT person.NAME, sport.NAME
    FROM person
    INNER JOIN sport
    ON person.ID = sport.P_ID;

# LEFT OUTER join
    SELECT person.NAME, sport.NAME
    FROM person
    LEFT OUTER JOIN sport
    ON person.ID = sport.P_ID;

# RIGHT OUTER join
    SELECT person.NAME, sport.NAME
    FROM person
    RIGHT OUTER JOIN sport
    ON person.ID = sport.P_ID;

# FULL OUTER join
    SELECT person.NAME, sport.NAME
    FROM person
    FULL OUTER JOIN sport
    ON person.ID = sport.P_ID;

# WHERE
    SELECT *
    FROM employees
    WHERE salary > 60000;

# AND
    SELECT *
    FROM employees
    WHERE salary > 60000 AND score = 26;

# IN
    SELECT *
    FROM employees
    WHERE score
    IN (25,26);

# NOT
    SELECT *
    FROM employees
    WHERE score
    NOT IN (25,26);

# BETWEEN
    SELECT *
    FROM employees
    WHERE score BETWEEN 23 AND 26;

# IS NOT NULL
    SELECT *
    FROM employees
    WHERE score IS NOT NULL;

# LIKE
    SELECT *
    FROM employees
    WHERE name
    LIKE '%an%';

# OR
    SELECT *
    FROM employees
    WHERE score <= 24 OR salary < 50000;

# LIMIT
    SELECT *
    FROM employees
    ORDER BY id
    LIMIT 4;

# UPDATE
    SELECT *
    FROM employees;
    UPDATE employees
    SET score = 99
    WHERE ID = 3;

# ORDER BY
    SELECT *
    FROM employees
    ORDER BY id;

# DELETE
    SELECT *
    FROM sport;
    DELETE FROM sport
    WHERE id = 6;

# see current user
    SELECT current_user;

# details of users
    \du

# create user
    CREATE USER james
    WITH PASSWORD 'password';

# grant privileges
    privileges: SELECT, INSERT, UPDATE, DELETE, RULE, ALL
    GRANT ALL PRIVILEGES ON DATABASE company to james;

# revoke privileges
    REVOKE ALL PRIVILEGES ON DATABASE company to james;

# alter
    ALTER USER james WITH SUPERUSER;
    ALTER USER james WITH NOSUPERUSER;

# remove
    DROP USER james;
