-- ======================================================
-- SQLBolt – Nulls
-- Dataset: SQLBolt platform (conceptual)
-- ======================================================

-- Task 1 : Find the name and role of all employees who have not been assigned to a building
-- Grain:  one row per employee without a building assignment

SELECT Role,	Name,	Building
FROM employees
WHERE Building IS NULL
;

------------------------------------------------------

-- Task 2 : Find the names of the buildings that hold no employees
-- Grain: one row per building without employees

SELECT b.building_name
FROM buildings b
LEFT JOIN employees e
  ON b.building_name = e.building
WHERE e.name IS NULL;


------------------------------------------------------
