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

-- ======================================================
--  SQLBolt – Select Queries - Review
-- ======================================================


-- Task 1 : List all the Canadian cities and their populations
-- Grain: one row per Canadian city with population

SELECT city,country, population
FROM north_american_cities
WHERE country = "Canada"
;

------------------------------------------------------

-- Task 2 : Order all the cities in the United States by their latitude from north to south
-- Grain: one row per city ordered by latitude descending

SELECT city,country, latitude
FROM north_american_cities
WHERE country = "United States"
ORDER BY Latitude DESC
;

------------------------------------------------------

-- Task 3 : List all the cities west of Chicago, ordered from west to east
-- Grain:  one row per city west of Chicago ordered by longitude ascending

SELECT city, longitude
FROM north_american_cities
WHERE longitude < -87.6298
ORDER BY longitude ASC;

------------------------------------------------------

-- Task 4 : List the two largest cities in Mexico (by population)
-- Grain: two rows of the largest Mexican cities by population

SELECT city, population, country
FROM north_american_cities
WHERE country = "Mexico"
ORDER BY population DESC
LIMIT 2;

------------------------------------------------------

-- Task 5 : List the third and fourth largest cities (by population) in the United States and their population
-- Grain:  two rows of the third and fourth largest US cities by population

SELECT city, population, country
FROM north_american_cities
WHERE country = "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

------------------------------------------------------