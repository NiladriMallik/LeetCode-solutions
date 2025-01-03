--MySQL

SELECT
  DRUG,
  TOTAL_SALES - COGS AS TOTAL_PROFIT
FROM PHARMACY_SALES
ORDER BY TOTAL_PROFIT DESC
LIMIT 3
;