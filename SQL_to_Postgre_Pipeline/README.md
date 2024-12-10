# ETL Pipeline: SQL Server to PostgreSQL

This repository showcases the implementation of an ETL (Extract, Transform, Load) pipeline that migrates data from SQL Server to PostgreSQL using Python. The project involves extracting data from multiple tables, transforming it for schema compliance, and loading it into PostgreSQL, addressing various challenges along the way.

## 📌 Objective  
The goal of this project is to design and implement a robust ETL pipeline that:
- Extracts data from SQL Server (AdventureWorksDW2022 database).
- Transforms the data to meet PostgreSQL schema requirements.
- Loads the cleaned and processed data into PostgreSQL efficiently.

---

## ⚙️ Technologies Used  
- **Programming Language**: Python  
- **Databases**: SQL Server (Source), PostgreSQL (Target)  
- **Libraries**:  
  - pandas (Data manipulation)  
  - pyodbc (SQL Server connection)  
  - sqlalchemy (PostgreSQL connection)  

---

## 🚀 Pipeline Workflow  
### 1. Data Extraction  
- Established a connection to SQL Server using `pyodbc`.
- Dynamically queried data from the following tables:
  - DimCustomer
  - DimEmployee
  - DimProduct
  - FactInternetSales
  - FactResellerSales
- Data was stored in pandas DataFrames for further processing.

### 2. Data Transformation  
- Performed data cleaning and preprocessing using Python’s pandas:
  - Removed unnecessary columns.
  - Resolved duplicate rows.
  - Normalized data formats to align with PostgreSQL requirements.

### 3. Data Loading  
- Loaded the transformed data into PostgreSQL using `sqlalchemy`.
- Tables were dynamically created or replaced in the PostgreSQL database.

---

## ⚡ Challenges and Solutions  
### 1. Installing psycopg2  
- **Challenge**: Encountered issues installing the PostgreSQL adapter for Python.  
- **Solution**:  
  - Refreshed the Scripts folder in the Python environment using Command Prompt.  
  - Successfully installed `psycopg2` with pip:  
    ```bash
    pip install psycopg2
    ```

### 2. SQL Server Login and Permissions  
- **Challenge**: Faced login failures and SSL certificate issues while connecting to SQL Server.  
- **Solution**:  
  - Enabled `Trust Server Certificate` in the connection settings.  
  - Updated SQL Server permissions to grant the `etl` user necessary access:  
    ```sql
    USE [master];
    ALTER LOGIN etl ENABLE;
    CREATE USER etl FOR LOGIN etl;
    GRANT SELECT ON DATABASE AdventureWorksDW2022 TO etl;
    ```

### 3. Configuring pg_hba.conf for PostgreSQL  
- **Challenge**: Couldn’t connect remotely to PostgreSQL.  
- **Solution**:  
  - Added the client machine’s IP address and `etl` user in the `pg_hba.conf` file:  
    ```plaintext
    host    adventureworks  etl             192.168.1.100/32       md5
    ```
  - Restarted PostgreSQL to apply changes:  
    ```bash
    sudo systemctl restart postgresql
    ```

### 4. Schema Privileges in PostgreSQL  
- **Challenge**: Encountered "Permission denied for schema public" when trying to load data.  
- **Solution**:  
  - Granted permissions to the `etl` user:  
    ```sql
    CREATE USER etl WITH PASSWORD 'demopass';
    GRANT CONNECT ON DATABASE "adventureworks" TO etl;
    GRANT USAGE, CREATE ON SCHEMA public TO etl;
    GRANT SELECT, UPDATE, INSERT, DELETE ON ALL TABLES IN SCHEMA public TO etl;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO etl;
    ```

---

## 🛠️ How to Run the Pipeline  
### Prerequisites  
- Install Python 3.8+ and the following Python libraries:
  - pandas
  - pyodbc
  - sqlalchemy
  - psycopg2
- Ensure SQL Server and PostgreSQL databases are running.
- Configure environment variables for database credentials:  
  ```plaintext
  PGUID=etl  
  PGPASS=demopass


---
## Steps to Execute

### 1. Clone the repository:

bash
```
git clone https://github.com/yourusername/etl-pipeline  
cd etl-pipeline
```

### 2. Update connection strings in the Python script:

```
mssql_conn_str = (
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=ATHENA\\SQLEXPRESS;'
    'DATABASE=AdventureWorksDW2022;'
    'UID=etl;'
    'PWD=demopass'
)
postgres_conn_str = "postgresql://etl:demopass@localhost:5432/adventureworks"
```

### 3.Run the ETL script:

```
python etl_pipeline.py
```

### 4. Verify the data in PostgreSQL:

```
SELECT * FROM "public.DimCustomer";
```



## 🔑 Key Learnings

- Understanding and troubleshooting database permission issues.
- Configuring pg_hba.conf to allow secure remote access.
- Writing dynamic Python code for scalable ETL operations.



## 🔮 Future Improvements
Implement incremental loading for better performance.
Add unit tests for each step of the ETL process.
Enhance logging and error handling.

## 👥 Contributors
Your Name – Data Engineer
LinkedIn | GitHub
Feel free to reach out for feedback or collaboration opportunities! 🚀

## 📝 License
This project is for personal learning and does not have an official license. If you intend to use it for any other purpose, please ensure you have the necessary permissions.
