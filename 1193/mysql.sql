SELECT CONCAT(YEAR(trans_date), '-', LPAD(MONTH(trans_date),2, '0')) month, 
    country,
    COUNT(*) trans_count,
    SUM(state LIKE 'approved') approved_count,
    SUM(amount) trans_total_amount,
    SUM(IF(state LIKE 'approved', amount, 0)) approved_total_amount
FROM Transactions
GROUP BY YEAR(trans_date), MONTH(trans_date), country
