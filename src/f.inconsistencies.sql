-- 1
SELECT person_id, COUNT(*) AS count
FROM person
GROUP BY person_id
HAVING COUNT(*) > 1;

-- 2
WITH CTE AS (
  SELECT person_id, MIN(name) AS name, MIN(gender) AS gender
  FROM person
  GROUP BY person_id
)
UPDATE movie_cast
SET person_id = CTE.person_id
FROM (
  SELECT person_id, MIN(name) AS name, MIN(gender) AS gender
  FROM movie_cast
  GROUP BY person_id
) AS movie_cast_filtered
INNER JOIN CTE ON movie_cast_filtered.person_id = CTE.person_id
INNER JOIN movie_cast ON movie_cast.person_id = movie_cast_filtered.person_id AND movie_cast.name <> movie_cast_filtered.name;

WITH CTE AS (
  SELECT person_id, MIN(name) AS name, MIN(gender) AS gender
  FROM person
  GROUP BY person_id
)
UPDATE movie_crew
SET person_id = CTE.person_id
FROM (
  SELECT person_id, MIN(name) AS name, MIN(gender) AS gender
  FROM movie_crew
  GROUP BY person_id
) AS movie_crew_filtered
INNER JOIN CTE ON movie_crew_filtered.person_id = CTE.person_id
INNER JOIN movie_crew ON movie_crew.person_id = movie_crew_filtered.person_id AND movie_crew.name <> movie_crew_filtered.name;
