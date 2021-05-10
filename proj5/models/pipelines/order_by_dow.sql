{{ config(materialized='table') }}

select
  order_dow,
  count(order_id) as order_count
from {{source('insta_data_set','orders')}}
group by 1
order by 1 ASC
