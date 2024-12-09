SELECT * 
FROM sys.syslogins
WHERE name = 'etl';

---
SELECT name, type_desc
FROM sys.server_principals
WHERE name = 'etl';

--

USE [AdventureWorks2022];
GO
EXEC sp_helpuser 'etl';

---
SELECT *
FROM sys.syslogins
WHERE name = 'etl';

---
ALTER LOGIN [etl] WITH DEFAULT_DATABASE = [master];

---
USE [master];
EXEC sp_helpuser 'etl';

--
USE [master];
SELECT name FROM sys.database_principals WHERE type = 'S';

--

USE [master];  -- or your target database
CREATE USER [etl] FOR LOGIN [etl];

--
ALTER ROLE db_datareader ADD MEMBER [etl];

--
USE [master]; -- or your target database
EXEC sp_helpuser 'etl';

--

SELECT * FROM sys.server_principals WHERE name = 'etl';

--

USE AdventureWorksDW2022;
CREATE USER etl FOR LOGIN etl;

--

ALTER LOGIN etl WITH DEFAULT_DATABASE = AdventureWorksDW2022;

--

USE AdventureWorksDW2022;
ALTER ROLE db_datareader ADD MEMBER etl;

--

