SELECT DISTINCT p.product_id,COALESCE(t.new_price,10)as price
FROM products p 
LEFT JOIN (SELECT product_id,new_price
        FROM products
        WHERE (product_id,change_date)IN (SELECT product_id,MAX(change_date)as latest
        FROM Products
        WHERE change_date <='2019-08-16'
        GROUP BY product_id)
    ) t 
ON p.product_id=t.product_id
;