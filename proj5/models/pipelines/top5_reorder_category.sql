select b.department_id, AVG(reorder_pct) as cat_reorder_avg
from {{ ref('product_reorder') }} a, {{source('insta_data_set','products')}} b
WHERE a.product_id = b.product_id
GROUP BY b.department_id
ORDER BY cat_reorder_avg DESC
LIMIT 5
