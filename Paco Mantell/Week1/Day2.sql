SELECT customer_id AS CLIENTE,
COUNT(DISTINCT order_date) NUM_VISITAS
FROM SQL_EN_LLAMAS.CASE01.SALES
GROUP BY customer_id
ORDER BY 2 DESC
