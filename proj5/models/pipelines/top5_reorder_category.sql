select b.department_id, AVG(reorder_pct) as cat_reorder_avg
from {{ ref('weekday_product_reorder') }} a, {{source('insta_data_set','order_products_prior')}} b
WHERE a.product_id = b.product_id 
GROUP BY b.department_id
ORDER BY cat_reorder_avg DESC
LIMIT 5
