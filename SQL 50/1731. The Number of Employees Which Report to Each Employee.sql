SELECT
    M.EMPLOYEE_ID AS EMPLOYEE_ID,
    M.NAME,
    COUNT(R.REPORTS_TO) AS REPORTS_COUNT,
    ROUND(AVG(R.AGE)) AS AVERAGE_AGE
FROM EMPLOYEES M INNER JOIN EMPLOYEES R ON M.EMPLOYEE_ID = R.REPORTS_TO
GROUP BY R.REPORTS_TO, M.NAME
ORDER BY M.EMPLOYEE_ID;