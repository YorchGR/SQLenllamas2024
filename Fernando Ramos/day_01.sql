SELECT 
     S.customer_id
    ,SUM(price) as total_gastado
FROM SQL_EN_LLAMAS.CASE01.SALES S
JOIN SQL_EN_LLAMAS.CASE01.MENU M
    ON S.product_id = M.product_id
GROUP BY 1;

/*********************************************************/
/***************** COMENTARIO MARÍA *********************/
/*********************************************************/

/* El código es correcto, pero dos cosillas, ¿y si Josep considera la tabla de members como tabla maestra de clientes?

En ese caso estamos filtrando información, en concreto, el cliente D, que aunque no haya hecho ninguna compra, forma parte del conjunto de datos.

Te propongo, añadir como base (FROM) la tabla de members, y a través de LEFT JOIN añadir el resto de tablas, el uso de LEFT JOIN en vez de INNER JOIN es simplemente
para  asegurarnos de traer clientes que no tengan pedidos. Cuando se tienen modelos tan sencillos con 3 clientes y no más de 10 pedidos, es fácil ver a ojo si algo no cruza, 
pero cuando contamos con millones de registros debemos hacer uso de LEFT JOIN o RIGHT JOIN.


Y por último, aunque un campo, en este caso PRICE, solo esté en la tabla MENU, vamos a intentar siempre especificarle el alias correspondiente, facilita la legibilidad del código para alguien de afuera, 
e incluso en algunos gestores mejora el tiempo de cómputo.

*/

SELECT A.customer_id
	,SUM(CASE 
		WHEN S.customer_id IS NULL
			THEN 0
		ELSE M.price
	END) AS total_gastado
FROM SQL_EN_LLAMAS.CASE01.MEMBERS A
LEFT JOIN SQL_EN_LLAMAS.CASE01.SALES S 
    ON A.customer_id = S.customer_id
LEFT JOIN SQL_EN_LLAMAS.CASE01.MENU M 
    ON S.product_id = M.product_id
GROUP BY 1;
