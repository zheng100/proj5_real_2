SELECT product_id, AVG(reordered) as reorder_pct
FROM {{ ref('combined_order_products_weekday') }} 
GROUP BY product_id
ORDER BY reorder_pct DESC
