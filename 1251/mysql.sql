# Write your MySQL query statement below
SELECT pr.product_id, 
       IFNULL(ROUND(SUM(pr.price * u.units) / SUM(u.units), 2), 0) average_price
FROM Prices pr
LEFT JOIN UnitsSold u ON 1=1
AND pr.product_id = u.product_id
AND u.purchase_date BETWEEN pr.start_date AND pr.end_date
GROUP BY product_id
