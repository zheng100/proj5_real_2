{{config(materialized='incremental')}}

with source_data as (
SELECT *
FROM {{source('insta_data_set','order_products_prior')}}
union distinct
SELECT *
FROM {{source('insta_data_set','order_products_train')}}
)

select *
from source_data
order by 1, 3


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where order_id > (select max(order_id) from {{ this }})
{% endif %}
