DELIMITER $$

CREATE PROCEDURE udp_happy_hour(type VARCHAR(50))
BEGIN
	UPDATE products AS p
		SET
			p.price = p.price * 0.80
		WHERE p.price >= 10 AND p.type = type;
END$$