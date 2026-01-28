-- ======================================================
-- SQLBolt – Queries with expressions
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : List all movies and their combined sales in millions of dollars 
-- Grain: one row per movie with total sales in millions

SELECT
    m.title,
    (b.domestic_sales + b.international_sales) / 1000000 AS total_sales_millions
FROM movies m
JOIN boxoffice b
    ON m.id = b.movie_id;

------------------------------------------------------

-- Task 2 : List all movies and their ratings in percent
-- Grain: one row per movie with rating in percent

SELECT
    m.title,
    b.rating * 10 AS rating_percent
FROM movies m
JOIN boxoffice b
    ON m.id = b.movie_id;

-- Another version using || string concatenation operator to add % sign

SELECT
    m.title,
    (b.rating * 10) || '%' AS rating_percent
FROM movies m
JOIN boxoffice b
    ON m.id = b.movie_id;


------------------------------------------------------

-- Task 3 : List all movies that were released on even number years
-- Grain:  one row per movie released in even years using modulo operator

SELECT title, year
FROM movies
WHERE year % 2 = 0;

------------------------------------------------------