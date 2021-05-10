select *
from {{ ref('combined_order_products') }}
LIMIT 1
