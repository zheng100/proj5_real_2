SELECT c.department_id,SUM(1) as count_of_reorders
FROM {{source('insta_data_set','orders')}} a
LEFT JOIN  {{ ref('combined_order_products') }} b
ON a.order_id = b.order_id
JOIN {{source('insta_data_set','products')}} c
ON b.product_id = c.product_id
WHERE reordered = 1
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
