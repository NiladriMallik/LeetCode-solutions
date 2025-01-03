--MySQL

SELECT
  CANDIDATE_ID
FROM(
SELECT
  CANDIDATE_ID,
  SKILL,
  CASE
    WHEN SKILL IN ('Python', 'Tableau','PostgreSQL') then 1
    ELSE 0
  END AS SKILL_YES
FROM CANDIDATES
) E
GROUP BY CANDIDATE_ID
HAVING SUM(SKILL_YES) = 3
;