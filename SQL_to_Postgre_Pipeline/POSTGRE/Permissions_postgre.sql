-- Create ETL user with permission

Create USER etl with PASSWORD 'demopass';

-- Grant Connect on Database 
Grant CONNECT on DATABASE "adventureworks" to etl;

-- Grant permission
Grant SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public to etl;

---- Grant usage and create privileges on the schema
GRANT USAGE, CREATE ON SCHEMA public TO etl;


-- Grant permissions on all future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON TABLES TO etl;

-- Grant permission to create and manipulate tables
GRANT CREATE ON SCHEMA public TO etl;

--
show port;
--

