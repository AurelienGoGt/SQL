-- ======================================================
-- SQLBolt – Select Queries
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : Find the title of each film
-- Grain: one row per movie

SELECT
    title
FROM movies;

------------------------------------------------------

-- Task 2 : Find the director of each film
-- Grain: one row per director

SELECT
    director
FROM movies;

------------------------------------------------------

-- Task 3 : Find the title and director of each film 
-- Grain: one row per title and director

SELECT
    title,
    director
FROM movies;

------------------------------------------------------

-- Task 4 : Find the title and year of each film
-- Grain: one row per title and year

SELECT 
    title, 
    year
FROM movies;

------------------------------------------------------

-- Task 5 : Find all the information about each film
-- Grain: one row per all movie details

SELECT *
FROM movies;