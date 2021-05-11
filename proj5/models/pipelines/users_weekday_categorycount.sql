with user_category AS (
SELECT a.user_id, c.department_id
FROM {{source('insta_data_set','orders')}} a, {{ ref('combined_order_products_weekday') }} b, {{source('insta_data_set','products')}} c
WHERE a.order_id = b.order_id AND b.product_id = c.product_id
)


SELECT user_id, department_id, count(*) as cat_count
FROM user_category
GROUP BY user_id, department_id 
ORDER BY user_id, cat_count DESC