--PostgreSQL 14

WITH CTE1 AS(
  SELECT
    MEASUREMENT_TIME::DATE AS MEASUREMENT_DAY,
    CASE
      WHEN MOD(TIME_RANK, 2) = 0 THEN MEASUREMENT_VALUE
      ELSE 0
    END AS EVEN_TIME,
    CASE
      WHEN MOD(TIME_RANK, 2) != 0 THEN MEASUREMENT_VALUE
      ELSE 0
    END AS ODD_TIME
  FROM
  (
    SELECT
      MEASUREMENT_ID,
      MEASUREMENT_VALUE,
      MEASUREMENT_TIME,
      DENSE_RANK() OVER(PARTITION BY MEASUREMENT_TIME::DATE ORDER BY MEASUREMENT_TIME ASC) TIME_RANK
    FROM MEASUREMENTS
  ) E
)
SELECT
  MEASUREMENT_DAY,
  SUM(ODD_TIME) AS ODD_SUM,
  SUM(EVEN_TIME) AS EVEN_SUM
FROM CTE1 
GROUP BY MEASUREMENT_DAY
ORDER BY MEASUREMENT_DAY ASC
;