SELECT
	t.id,
	t.capacity,
	COUNT(c.id) AS count_clients,
	(CASE 
    WHEN t.capacity > COUNT(c.id) THEN "Free seats"
    WHEN t.capacity = COUNT(c.id) THEN "Full"
    ELSE "Extra seats"
    END)AS availability
FROM
	tables AS t
JOIN orders AS o ON o.table_id = t.id
JOIN orders_clients AS oc ON oc.order_id = o.id
JOIN clients AS c ON oc.client_id = c.id
WHERE t.floor = 1
GROUP BY t.id
ORDER BY t.id DESC;