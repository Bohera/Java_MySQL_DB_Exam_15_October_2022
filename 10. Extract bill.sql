DELIMITER $$

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(19, 2)
DETERMINISTIC
BEGIN
	RETURN(
		SELECT
			SUM(p.price)
		FROM
			products AS p
		JOIN orders_products AS op ON op.product_id = p.id
        JOIN orders_clients AS oc ON oc.order_id = op.order_id
        JOIN clients AS c ON oc.client_id = c.id
        WHERE CONCAT(c.first_name, " ", c.last_name) = full_name
	);
END$$
