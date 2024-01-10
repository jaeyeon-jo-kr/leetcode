# Write your MySQL query statement below
SELECT ROUND(SUM(d.order_date = d.customer_pref_delivery_date) / COUNT(*) * 100, 2) immediate_percentage
FROM Delivery d
INNER JOIN 
    (SELECT customer_id, MIN(order_date) order_date
    FROM Delivery
    GROUP BY customer_id) f 
    ON f.customer_id = d.customer_id AND f.order_date = d.order_date



