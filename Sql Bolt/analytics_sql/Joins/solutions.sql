-- ======================================================
-- SQLBolt – Select Queries
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : Find the domestic and international sales for each movie 
-- Grain: one row per movie with sales data from 2 tables

SELECT 
    m.title,
    b.domestic_sales,
    b.international_sales
FROM movies m
JOIN boxoffice b
    ON m.id = b.movie_id;

------------------------------------------------------

-- Task 2 : Show the sales numbers for each movie that did better internationally rather than domestically
-- Grain: one row per movie where international sales > domestic sales

SELECT 
    m.title,
    b.domestic_sales,
    b.international_sales
FROM movies m
JOIN boxoffice b
    ON m.id = b.movie_id
WHERE b.international_sales > b.domestic_sales;

------------------------------------------------------

-- Task 3 : List all the movies by their ratings in descending order
-- Grain: one row per movie ordered by rating from highest to lowest

SELECT 
    m.title,
    b.rating
FROM movies m
JOIN Boxoffice b
    ON m.id = b.movie_id
ORDER BY b.rating DESC;

------------------------------------------------------

-- Task 4 : Find the list of all buildings that have employees
-- Grain: one row per building that has at least one employee

SELECT 
    b.building_name,
    e.Name
FROM buildings b
JOIN employees e
    ON b.Building_name = e.Building
GROUP BY b.building_name;

------------------------------------------------------

-- Task 5 : Find the list of all buildings and their capacity
-- Grain: one row per building with its capacity # No need for JOIN here

SELECT Building_name, Capacity
FROM Buildings
GROUP BY Building_name

------------------------------------------------------

-- Task 6 : Find the list of all buildings that have employees
-- Grain: one row per building that has at least one employee

SELECT
  b.building_name,
  e.role
FROM buildings b
LEFT JOIN employees e
  ON b.building_name = e.building
GROUP BY b.building_name, e.role
ORDER BY b.building_name, e.role;

------------------------------------------------------