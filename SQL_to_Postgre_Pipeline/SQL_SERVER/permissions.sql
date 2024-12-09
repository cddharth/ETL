use [master]
GO
CREATE LOGIN [etl] WITH PASSWORD = N'demopass', DEFAULT_DATABASE = [AdventureWorksDW2022], CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF
GO
USE [AdventureWorks2022]
GO
CREATE USER [etl] FOR LOGIN [etl]
GO
USE [AdventureWorks2022]
GO
ALTER ROLE [db_datareader] ADD MEMBER [etl]
GO
USE [master]
GO
GRANT CONNECT SQL TO [etl]
GO