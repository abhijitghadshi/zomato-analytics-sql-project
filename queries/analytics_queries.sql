-- Total Revenue
SELECT SUM(m.price * od.quantity) AS total_revenue
FROM order_details od
JOIN menu m ON od.menu_id = m.menu_id;

-- Top Restaurants by Revenue
SELECT r.restaurant_name,
       SUM(m.price * od.quantity) AS revenue
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
JOIN order_details od ON o.order_id = od.order_id
JOIN menu m ON od.menu_id = m.menu_id
GROUP BY r.restaurant_name
ORDER BY revenue DESC;

-- Most Ordered Food Item
SELECT m.item_name, SUM(od.quantity) AS total_orders
FROM order_details od
JOIN menu m ON od.menu_id = m.menu_id
GROUP BY m.item_name
ORDER BY total_orders DESC
LIMIT 1;

-- City-wise Revenue
SELECT r.city,
       SUM(m.price * od.quantity) AS city_revenue
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
JOIN order_details od ON o.order_id = od.order_id
JOIN menu m ON od.menu_id = m.menu_id
GROUP BY r.city;

-- Customers Ordering Above Average
SELECT customer_name, total_spent
FROM (
    SELECT c.customer_name,
           SUM(m.price * od.quantity) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN menu m ON od.menu_id = m.menu_id
    GROUP BY c.customer_name
) t
WHERE total_spent >
(
    SELECT AVG(total)
    FROM (
        SELECT SUM(m.price * od.quantity) AS total
        FROM orders o
        JOIN order_details od ON o.order_id = od.order_id
        JOIN menu m ON od.menu_id = m.menu_id
        GROUP BY o.order_id
    ) x
);

