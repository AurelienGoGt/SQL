-- ======================================================
-- SQLBolt – Select Queries
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : List all directors of Pixar movies (alphabetically), without duplicates 
-- Grain: Only unique director names in alphabetical order

SELECT DISTINCT director
FROM Movies
ORDER BY Director ASC ; --- ASC is optional as default is ascending

------------------------------------------------------

-- Task 2 : List the last four Pixar movies released (ordered from most recent to least) 
-- Grain: Only 4 rows of most recent Pixar movies

SELECT title, year  --- you can use * to get all columns if you want too
FROM Movies
ORDER BY year DESC
LIMIT 4 ;

------------------------------------------------------

-- Task 3 : List the first five Pixar movies sorted alphabetically by title
-- Grain: Only 5 rows of Pixar movies ordered by title ascending

SELECT title
FROM Movies
ORDER BY title
LIMIT 5 ;

------------------------------------------------------

-- Task 4 : List the next five Pixar movies sorted alphabetically
-- Grain: Only 5 rows of Pixar movies ordered by year ascending

SELECT title
FROM Movies
ORDER BY title ASC
LIMIT 5 OFFSET 5 ;

------------------------------------------------------
