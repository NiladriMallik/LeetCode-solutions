SELECT
P.PRODUCT_NAME,
SUM(O.UNIT) AS UNIT

FROM PRODUCTS P INNER JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE YEAR(ORDER_DATE) = "2020" AND MONTH(ORDER_DATE) = '2'
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME, P.PRODUCT_CATEGORY
HAVING SUM(O.UNIT) >= 100
;