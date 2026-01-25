-- ======================================================
-- SQLBolt – Select Queries
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : Find the movie with a row id of 6
-- Grain: Only one row with id 6

SELECT title, id --- you can use * to get all columns if you want too
FROM Movies
WHERE id = 6;

------------------------------------------------------

-- Task 2 : Find the movies released in the years between 2000 and 2010
-- Grain: Only rows with years from 2000 to 2010 range

SELECT title, year  --- you can use * to get all columns if you want too
FROM Movies
WHERE Year BETWEEN 2000 AND 2010;

------------------------------------------------------

-- Task 3 : Find the movies not released in the years between 2000 and 2010
-- Grain: Only rows with years outside 2000 to 2010 range

SELECT title, year --- you can use * to get all columns if you want too
FROM Movies
WHERE Year NOT BETWEEN 2000 AND 2010 ;

------------------------------------------------------

-- Task 4 : Find the first 5 Pixar movies and their release year
-- Grain: Only 5 rows of Pixar movies ordered by year ascending

SELECT title, year
FROM Movies
ORDER BY Year ASC
LIMIT 5 ;

------------------------------------------------------

-- Task 5 : Find all the Toy Story movies
-- Grain:  Only rows with Toy Story in the title

SELECT title
FROM movies
WHERE Title LIKE "%Toy Story%";

------------------------------------------------------

-- Task 6 : Find all the movies directed by John Lasseter
-- Grain:  Only rows with John Lasseter in the director column

SELECT title, director
FROM movies
WHERE Director LIKE "%John Lasseter%";

------------------------------------------------------

-- Task 7 : Find all the movies (and director) not directed by John Lasseter
-- Grain: Only rows without John Lasseter in the director column

SELECT title, director
FROM movies
WHERE Director NOT LIKE "%John Lasseter%";

------------------------------------------------------

-- Task 8 : Find all the WALL-* movies 
-- Grain:  Only rows with titles starting with WALL-

SELECT title
FROM movies
WHERE title LIKE 'WALL-%';

------------------------------------------------------