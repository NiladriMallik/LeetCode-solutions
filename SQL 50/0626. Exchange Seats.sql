SELECT
    ID,
    CASE
        WHEN ID % 2 != 0 AND NEXT_STUDENT IS NOT NULL THEN NEXT_STUDENT
        WHEN ID % 2 != 0 AND NEXT_STUDENT IS NULL THEN STUDENT
        WHEN ID % 2 = 0 THEN PREV_STUDENT
    END AS STUDENT
FROM(
    SELECT
        ID,
        STUDENT,
        LEAD(STUDENT) OVER(ORDER BY ID) AS NEXT_STUDENT,
        LAG(STUDENT) OVER (ORDER BY ID) AS PREV_STUDENT
    FROM SEAT
) E;