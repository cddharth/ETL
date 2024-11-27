CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-incrementing primary key
    FirstName NVARCHAR(50) NOT NULL,          -- First name
    LastName NVARCHAR(50) NOT NULL,           -- Last name
    DateOfBirth DATE,                         -- Date of birth
    Salary DECIMAL(10, 2) NOT NULL,           -- Salary with 2 decimal places
    IsActive BIT DEFAULT 1                    -- Active status with default 1
);


---

SELECT *  FROM Employees

---

INSERT INTO Employees (FirstName, LastName, Salary, DateOfBirth)
VALUES
    ('John', 'Doe', 5000.00, GETDATE()),
    ('Jane', 'Smith', 5500.00, GETDATE()),
    ('Robert', 'Brown', 6000.00, GETDATE());