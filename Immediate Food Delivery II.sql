-- Calculate the percentage of customers whose first order was immediate
SELECT ROUND(SUM(CASE
                    WHEN order_date = customer_pref_delivery_date
                    THEN 1 ELSE 0 END) * 100 / COUNT(delivery_id), 2) AS immediate_percentage
FROM Delivery
-- Filter to include only the first order of each customer
WHERE (customer_id, order_date) IN (SELECT customer_id,
                                            MIN(order_date) 
                                            FROM Delivery
                                            GROUP BY customer_id)
