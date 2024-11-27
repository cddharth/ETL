
# PythonToSQL Data Loader




## Table of Contents



    1.Overview
    2. Creating Table and Loading Data
    3. Creating and analysing Python script
    4. Code Snippets and Output
    5. Conclusion





## Overview and Problem Statement


I'll be writing a Python script which automatically loads data to a database, by executing SQL queries. This will shed more light on the load process in ETL pipelines. For this I've created a sample database 'Parks_and_Recreation' and will be creating employee table under it.

Will add a few rows and will add the rest of it using python script.



## Creating Table and Loading Data 

1. Write the create query and execute. Create a new Employee table with column names as Employee_ID, First_Name, Last_Name, DateOfBirth, Salary and isactive




![image](https://github.com/user-attachments/assets/72525089-45c3-4f95-9232-79661dc3d616)



2. Insert a few rows in the table using insert query.


![image](https://github.com/user-attachments/assets/0f27c0b6-7f4c-40fc-82e5-10511cd5a625)


3. Check the inserted data.


![image](https://github.com/user-attachments/assets/2fda639e-1f0c-4c31-a185-47a42b5b1bac)






### Creating and analysing Python script

1. We import Pyodbc function and define the data to be appended

snap - 

![image](https://github.com/user-attachments/assets/df6efb56-4692-4c64-8307-03d3f8add0cc)



2. Setting Up the Server and Database Information

We start by defining our SQL Server and database details.


server = r'ATHENA\SQLEXPRESS'
database = 'Parks_and_Recreation'

Here, server is the name of our SQL Server instance, and database is the specific database we’re working with.

Notice the r before the server name. It makes it a raw string to handle any special characters like backslashes.


3.  Creating the Connection String

Next, we build our connection string to connect to the database:


conx_str = (
    f"DRIVER={{ODBC Driver 17 for SQL Server}};"
    f"SERVER={server};"
    f"DATABASE={database};"
    "Trusted_Connection=yes;"
)
The DRIVER specifies the ODBC driver for SQL Server.
The SERVER and DATABASE define the SQL Server instance and database name.
Finally, Trusted_Connection=yes ensures we connect using Windows authentication.


Driver for SQL server can be checked by the following code :-

for drivers in pyodbc.drivers():
    print(drivers)


4. Establishing the Connection]

We use the connection string to establish a connection:


cnxn = pyodbc.connect(conx_str)

This opens a connection to the database, allowing us to execute queries.


5. Creating a Cursor Object

Once connected, we create a cursor object:


cursor = cnxn.cursor()

The cursor allows us to execute SQL commands and interact with the database.


6. Inserting Data into the Table

Now let’s look at the part where we insert employee data:


insert_query = '''INSERT INTO Employees (FirstName, LastName, DateOfBirth, Salary)
VALUES (?, ?, ?, ?);'''

Here, we define an INSERT query with placeholders (?) for dynamic values.

We then loop through a list of new employee data:


for row in new_employee:
    values = (row[0], row[1], row[2], row[3])
    cursor.execute(insert_query, values)

row[0], row[1], and so on represent the employee's first name, last name, date of birth, and salary.
We execute the query with these values.

7. Committing the Changes

After inserting all the records, we commit the changes to the database:


cnxn.commit()

This ensures that the data is saved.


8. Retrieving Data from the Table

Now we fetch all records from the Employees table to verify our data:


cursor.execute('SELECT * FROM Employees')

This executes a SELECT query to retrieve all rows

9. Printing the Results

Finally, we loop through the results and print each row:


for row in cursor:
    print(row)
This displays the inserted data to confirm that everything worked as expected."




### Code Snippets and Output

Table before execution- 

![image](https://github.com/user-attachments/assets/fc3c7cd9-dfc2-499a-8ae3-2f5e3b1e7def)


Code and Output - 
![image](https://github.com/user-attachments/assets/290b67bd-22b2-4eb4-ad28-deda6d4a8cc9)


Table After Execution - 
![image](https://github.com/user-attachments/assets/e3b4ce43-94f0-45d1-9f27-022c80a5a938)




### Conclusion

And that’s it! This script shows how to insert data dynamically into a SQL Server database, commit the changes, and retrieve the records.

For any suggession and addition of any section feel free to reach out to -

sarkarsiddhartha14@gmail.com

Finally, thanks for taking the time to read through the report, hope you enjoy it.

Thanks,
Siddhartha









 
