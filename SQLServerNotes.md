Databases
===================
<!-- Create database object -->
CREAT DATABASE <dbname>
<!-- Modify database object -->
ALTER DATABASE <dbname>
MODIFY NAME = <newdbname>
<!-- Execute modify database using system stored proceedure -->
sp_renameDB '<olddbname>','<newdbname>'
<!-- Delete database object -->
DROP DATABASE <dbname>
<!-- Roll back incomplete transactions -->
ALTER DATABASE <dbname>
SET SINGLE_USER WITH ROLLBACK IMMEDIATE

Tables
===================
<!-- Create table object -->
CREAT TABLE <dbname>
    example:
    <!-- Go to sample database -->
    Use [Sample]
    Go
    CREATE TABLE tblGender
    (
    ID int NOT NUL Primary Key,
    Gender nvarchar(50) NOT NULL,
    )

<!-- Alter table by creating contraints -->
ALTER TABLE <fkTable>
ADD CONSTRAINT <fkTable_fkColumn_FK>
    example:
    ALTER TABLE tblPerson
    ADD CONSTRAINT tblPerson_GenderID_FK
    FOREIGN KEY (GenderID) REFERENCES tblGender(ID)

<!-- Insert into table -->
INSERT INTO tblPerson (ID, Name, Email)
    example:
    INSERT INTO tblPerson (ID, Name, Email)
    VALUES
    (1, 'gabie', g@g.com),
    (2, 'noah', n@n.com),
    (3, 'sam', s@s.com),

<!-- Delete from table -->
DELETE FROM <tblname>
WHERE <condition>
<!-- Delete ALL from table -->
DELETE FROM <tblname>


<!-- Altering an existing column to add a default constraint -->
ALTER TABLE <tblname>
ADD CONSTRAINT <constraintname>
DEFAULT <defaultvalue> FOR <existingcolumnname>
    example:
    ALTER TABLE tblPerson
    ADD CONSTRAINT DF_tblPerson_GenderID
    DEFAUTL 3 FOR GenderID

<!-- Adding a new column, with defualt value to an existing table -->
ALTER TABLE <tblname>
ADD <columnname><datatype><null|notnull>
CONSTRAINT <constraintname> DEFAULT <defaultvalue>

<!-- Dropping constraints -->
ALTER TABLE <tblname>
DROP CONSTRAINT <constraintname>

<!-- Quick way to get table column type -->
highlight table and press <Alt> F1

<!-- Check constraints -->
ALTER TABLE <tblname>
ADD CONSTRAINT <constraintname> CHECK (<booleanexpression>)

<!-- Identity Column -->
    example:
    CREATE TABLE tblPerson
    (
    ID int indentity(1,1),
    )

<!-- Set Identity insert to allow manully setting column value -->
SET IDENTITY_INSERT <tblname> ON
INSERT INTO <tblname> () VALUES ()

<!-- reset Identtity column -->
DBCC CHECKIDENT('<tblname>', RESEED, 0)

<!-- Get Last Generated Identity -->
SELECT SCOPE_IDENTITY() - same session and same scope
@@IDENTITY - same session and across any scope
IDENT_CURRENT('<tblname>') - specific table across any session and any scope

<!-- UNIQUE key constraints -->
ALTER TABLE <tblname>
ADD CONSTRAINT <constraintname> UNIQUE (<columnname>)

Tables - SELECT
===================
<!-- basic Select all from table -->
SELECT *
FROM <tblname>
<!-- DISTINCT clause -->
SELECT DISTINCT <columnname>
FROM <tblname>
<!-- WHERE clause -->
SELECT *
FROM <tblname>
WHERE <columnname><condition>
<!-- IN condition -->
SELECT *
FROM <tblname>
WHERE <columnname> IN (<condition1>,condition2>,...)
<!-- BETWEEN condition -->
SELECT *
FROM <tblname>
WHERE <columnname> BETWEEN <condition1> AND <condition2>
<!-- LIKE condition -->
<!-- % is a wild card -->
<!-- - replacement for 1 character -->
SELECT *
FROM <tblname>
WHERE <columnname> LIKE <condition1>
    example:
    SELECT * FROM <tblname> WHERE <condition1> LIKE 'L%'
<!-- the inverse NOT LIKE condition -->
SELECT *
FROM <tblname>
WHERE <columnname> NOT LIKE <condition1>
<!-- [] condition, use a series of characters -->
SELECT *
FROM <tblname>
WHERE <columnname> LIKE '[MST]%'
<!-- inverse [^] condition, use a series of characters -->
SELECT *
FROM <tblname>
WHERE <columnname> LIKE '[^MST]%'
<!-- join multiple operators -->
SELECT *
FROM <tblname>
WHERE (<columnname> = <value> OR <columnname> = <value>)
AND <columnname> = <value>
<!-- ORDER BY operator -->
SELECT *
FROM <tblname>
WHERE <columnname> LIKE '[^MST]%'
ORDER BY <columnname> DESC, <columnname> ASC
<!-- TOP operator -->
SELECT TOP 10 *
FROM <tblname>
<!-- TOP percent operator -->
SELECT TOP 1 PERCENT *
FROM <tblname>

Tables - GROUP BY (needs agregate function)
===================
SELECT <columnname>, SUM(<columnname>)
FROM <tblname>
GROUP BY <columnname>
<!-- Agregate functions SUM, MIN, MAX, COUNT, AVG -->


Tables - Joins
===================
<!-- INNER Join or Join -->
SELECT *
FROM <tblname1>
INNER JOIN <tblname2>
ON <column1name> = <column2name>

<!-- LEFT JOIN or LEFT OUTER Join -->
SELECT *
FROM <tblname1>
LEFT JOIN <tblname2>
ON <column1name> = <column2name>

<!-- RIGHT JOIN or RIGHT OUTER Join -->
SELECT *
FROM <tblname1>
RIGHT JOIN <tblname2>
ON <column1name> = <column2name>

<!-- FULL JOIN or FULL OUTER Join -->
SELECT *
FROM <tblname1>
FULL JOIN <tblname2>
ON <column1name> = <column2name>

<!-- CROSS JOIN, no ON clause -->
SELECT *
FROM <tblname1>
CROSS JOIN <tblname2>

<!-- Left outer SELF JOIN -->
    Example:
    SELECT      E.Name AS Employee, M.Name AS Manager
    FROM        tblEmployee E
    LEFT JOIN   tblEmployee M
    ON          E.ManagerId = M.EmployeeId

<!-- Inner SELF JOIN -->
    Example:
    SELECT      E.Name AS Employee, M.Name AS Manager
    FROM        tblEmployee E
    INNER JOIN  tblEmployee M
    ON          E.ManagerId = M.EmployeeId

<!-- Cross SELF JOIN -->
    Example:
    SELECT      E.Name AS Employee, M.Name AS Manager
    FROM        tblEmployee E
    CROSS JOIN  tblEmployee M


NULL Values
===================
<!-- ISNUL() Function -->
ISNULL(<checkifvalueisnull>, <replacement>)
<!-- COALESCE Function -->
COALESCE(<checkifvalueisnull>, <replacement>)
<!-- CASE Statement -->
CASE WHEN <expression> THEN '' ELSE '' END

<!-- COALESCE Function - returns the first NON NULL value-->
COALESCE(<checkifvalueisnull>, <replacement>)
    Example:
    SELECT      id, COALESCE(FirstName, MiddleName, LastName) as Name
    FROM        tblEmployee E


UNION & UNION ALL
===================
<!-- used to combine result sets of 2 or more SELECT queries -->
<!-- UNION ALL Merge Selects including duplicates -->
<!-- # of columns, data types and order MUST match -->
    Example:
    SELECT * FROM tblIndiaCustomers
    UNION ALL
    SELECT * FROM tblUKCustomers
<!-- UNION performs a distinct sort to remove duplicates which makes it less fast -->
    Example:
    SELECT * FROM tblIndiaCustomers
    UNION
    SELECT * FROM tblUKCustomers
<!-- ORDER BY can only be used on the last select statement-->
    Example:
    SELECT * FROM tblIndiaCustomers
    UNION
    SELECT * FROM tblUKCustomers
    ORDER BY <columnname>


STORED PROCEDURE
===================
<!-- save a query tp re-use it again -->
CREATE PROCEDURE <storedProcedureName>
AS
BEGIN
    <code>
END
<!-- shorcut - you can use proc -->
CREATE PROC <storedProcedureName>
AS
BEGIN
    <code>
END

<!-- to run, call the store procedure name -->
1. <storedProcedureName>
2. Exec <storedProcedureName>
3. Execute <storedProcedureName>

<!-- pass in arguments to store procedure -->
Example:
    CREATE PROC spEmployeeByGenderAndDept
    @Gender nvarchar(20),
    @DepartmentId int,
    as
    BEGIN
        SELECT Name, Gender, DepartmentId
        FROM tblEmployee
        WHERE Gender = @Gender
        AND DeprtmentId = @DepartmentId
    END

...EXECUTE IT
    spEmployeeByGenderAndDept 'Male', 1
    EXEC spEmployeeByGenderAndDept 'Male', 1
<!-- you can also specify name of param -->
    EXEC spEmployeeByGenderAndDept @DepartmentId = 1, @Gender = 'Male'

<!-- Get text of stored procedure using system store procedures -->
    sp_helptext spEmployeeByGenderAndDept
<!-- Alter procedure -->
ALTER PROC <storedProcedureName>
AS
BEGIN
    <code>
END
<!-- Delete procedure -->
DROP PROC <storedProcedureName>
<!-- Encrypt procedure -->
ALTER PROC <storedProcedureName>
WITH ENCRYPTION
AS
BEGIN
    <code>
END

<!-- Set OUTPUT procedure -->
Example:
    CREATE PROC spEmployeeByGender
    @Gender nvarchar(20),
    @EmployeeCount int OUTPUT,
    as
    BEGIN
        SELECT @EmployeeCount = COUNT(Id) FROM tblEmployee WHERE Gender = @Gender
    END

...EXECUTE IT ver1
    DECLARE @EmployeeTotal int
    EXECUTE spEmployeeByGender 'Male', @EmployeeTotal OUTPUT
    IF (@EmployeeTotal IN NULL)
        Print '@EmployeeTotal is Null'
    ELSE
        Print '@EmployeeTotal is not Null'

...EXECUTE IT ver2 with named parameters
    DECLARE @EmployeeTotal int
    EXECUTE spEmployeeByGender @EmployeeCount = @EmployeeTotal OUT, @Gender = 'Male'
    IF (@EmployeeTotal IN NULL)
        Print '@EmployeeTotal is Null'
    ELSE
        Print '@EmployeeTotal is not Null'

<!-- other usefull system store procedures -->
sp_help <storedProcedureName>
sp_helptext <storedProcedureName>
sp_depends <storedProcedureName>
