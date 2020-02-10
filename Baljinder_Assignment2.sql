/*baljinder Assignment2 8622559*/
/*Part 1 : basic select queries*/
/*query1 1.	Using the order_details table, find the revenue (price * quantity) earned on each order*/
SELECT OrderNumber, SUM(QuotedPrice*QuantityOrdered) AS REVENUE FROM 
order_details
GROUP BY OrderNumber;

/*Query2  Using the employees table, 
find the age of each employee in years and order from youngest to oldest*/
SELECT EmployeeID, EmpFirstName, EmpLastName, EmpBirthDate, TIMESTAMPDIFF(Year,EmpBirthDate,CURDATE()) AS Age from employees
ORDER BY Age ASC;

/*Part 2 : Conditional queries*/
/*1 Using the employees table, find all employees with a first name 
that contains an 'r' and a last name that does not contain a 'q'.*/
SELECT * FROM employees WHERE EmpFirstName LIKE '%r%' AND 
EmpLastName NOT LIKE '%q%';

/*Part 3  Database Design*/
/*Firstly Product should have single entry beacuse values can't be in the form of array.
Secondly, Phone column should not accept null values.*/

/*Part 4 : Joins*/
/*Query 1.	Find the first name and phone number of all customers 
who have ever ordered a helmet. HINT: Use the keyword */
SELECT DISTINCT cust.CustFirstName, cust.CustLastName, cust.CustPhoneNumber, ProductName, p.ProductNumber FROM Customers AS cust JOIN
Orders AS ord ON cust.CustomerID = ord.CustomerID 
JOIN Order_Details AS ord_d ON ord.OrderNumber = ord_d.OrderNumber
JOIN Products AS p ON ord_d.ProductNumber = p.ProductNumber WHERE ProductName
LIKE '%helmet%' GROUP BY cust.CustomerID;

/*Query  2.	Display the first name of all customers who 
have the same first name as an employee. */
SELECT EmpFirstName, EmpLastName FROM employees;
SELECT Distinct CustLastName,CustFirstName FROM customers as cust ,employees as emp
WHERE  cust.CustLastName=emp.EmpLastName; 


/*part 5 Aggregate Functions*/
/*Query 2.	Find the combined total value (QuantityOrdered*QuotedPrice*2) 
of all orders made by customers from the state of 'OR' */
SELECT SUM(QuantityOrdered*QuotedPrice) AS TotalValue FROM orders As ord
JOIN order_details AS ord_d
ON ord.OrderNumber = ord_d.OrderNumber
JOIN customers AS cust ON cust.CustomerID = ord.CustomerID
WHERE CustState = 'OR';




