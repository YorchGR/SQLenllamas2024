-- ¿Cuál es el primer producto que ha pedido cada cliente? -- 
SELECT 
     A.CLIENTE
    ,LISTAGG(DISTINCT A.PRODUCTO, ', ') AS LISTA_PRODUCTOS
    ,PRIMER_PEDIDO
FROM(
    SELECT 
         MEMBERS.CUSTOMER_ID AS CLIENTE
        ,MENU.PRODUCT_NAME AS PRODUCTO
        ,SALES.ORDER_DATE AS PRIMER_PEDIDO
    FROM CASE01.SALES
    FULL JOIN CASE01.MEMBERS
           ON SALES.CUSTOMER_ID = MEMBERS.CUSTOMER_ID
    INNER JOIN CASE01.MENU
           ON SALES.PRODUCT_ID = MENU.PRODUCT_ID
    WHERE (SALES.ORDER_DATE) IN (SELECT MIN(ORDER_DATE)
                                   FROM CASE01.SALES)
    GROUP BY MEMBERS.CUSTOMER_ID, MENU.PRODUCT_NAME,SALES.ORDER_DATE)A
GROUP BY A.CLIENTE, A.PRIMER_PEDIDO
ORDER BY A.CLIENTE;