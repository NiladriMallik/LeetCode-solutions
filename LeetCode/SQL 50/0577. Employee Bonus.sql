SELECT
EMP.NAME,
BN.BONUS

FROM EMPLOYEE EMP LEFT JOIN BONUS BN
ON EMP.EMPID = BN.EMPID
WHERE BONUS < 1000 OR BONUS IS NULL
;