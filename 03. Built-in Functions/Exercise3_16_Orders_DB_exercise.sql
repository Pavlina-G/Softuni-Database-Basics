use orders;

SELECT 
    product_name,
    order_date,
    ADDDATE(order_date, INTERVAL 3 DAY) AS 'pay_due',
    ADDDATE(order_date, INTERVAL 1 MONTH) AS 'deliver_due'
FROM
    orders;