-- Día 3 ¿Cual es el primer producto que ha pedido cada cliente?

WITH CTE_RANKING AS (SELECT
    MEMBERS.CUSTOMER_ID AS CUSTOMER_ID,
    ORDER_DATE,
    NVL(MENU.PRODUCT_NAME,'No hizo pedido') AS PRODUCT_NAME,
    RANK() OVER (PARTITION BY MEMBERS.CUSTOMER_ID ORDER BY ORDER_DATE ASC) AS RANKING_PEDIDOS
FROM
    MEMBERS
LEFT JOIN
    SALES
ON MEMBERS.CUSTOMER_ID = SALES.CUSTOMER_ID
FULL JOIN
    MENU
ON SALES.PRODUCT_ID = MENU.PRODUCT_ID)


SELECT 
    CUSTOMER_ID,
    PRODUCT_NAME,
    ORDER_DATE  
FROM 
    CTE_RANKING
WHERE RANKING_PEDIDOS = 1;


