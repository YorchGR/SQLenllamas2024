SELECT 
    C.CUSTOMER_ID AS CLIENTE,
    COUNT(DISTINCT ORDER_DATE) AS DIAS_VISITADOS
FROM SALES S
FULL JOIN MEMBERS C
       ON S.CUSTOMER_ID = C.CUSTOMER_ID       
GROUP BY C.CUSTOMER_ID