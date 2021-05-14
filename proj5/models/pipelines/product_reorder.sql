WITH pd_r as (
SELECT product_id, AVG(reordered) as reorder_pct
FROM {{ ref('combined_order_products') }} 
GROUP BY product_id
ORDER BY reorder_pct DESC
)

SELECT a.product_id, b.product_name, reorder_pct
FROM pd_r a, {{source('insta_data_set','products')}} b
WHERE a.product_id = b.product_id
ORDER BY reorder_pct DESC