select b.*
from {{ ref('weekday_orders') }} a, {{ ref('combined_order_products') }} b
WHERE a.order_id = b.order_id 
