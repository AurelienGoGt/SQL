-- ======================================================
-- SQLBolt – Queries with aggregates
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : Find the longest time that an employee has been at the studio 
-- Grain: one row with the maximum years at studio

SELECT MAX(Years_employed)
FROM employees;

------------------------------------------------------

-- Task 2 : For each role, find the average number of years employed by employees in that role
-- Grain: one row per role with average years employed

SELECT
    role,
    AVG(years_employed) AS avg_years_employed
FROM employees
GROUP BY role;

------------------------------------------------------

-- Task 3 : Find the total number of employee years worked in each building
-- Grain:  one row per building with total years employed

SELECT building, SUM(years_employed) as Total_years_employed
FROM employees
GROUP BY building;

------------------------------------------------------

-- Task 4 : Find the number of Artists in the studio (without a HAVING clause)
-- Grain: one row with the count of employees with role 'Artist'

SELECT role, COUNT(*) as artists
FROM employees
WHERE role = "Artist";

------------------------------------------------------

-- Task 5 : Find the number of Employees of each role in the studio
-- Grain: one row per role with count of employees

SELECT role, COUNT(*)
FROM employees
GROUP BY role;

------------------------------------------------------

-- Task 6 : Find the total number of years employed by all Engineers
-- Grain: one row with total years employed for role 'Engineer'

SELECT role ,SUM(Years_employed) AS Engineer_total_year 
FROM employees 
WHERE Role = "Engineer" ;

------------------------------------------------------