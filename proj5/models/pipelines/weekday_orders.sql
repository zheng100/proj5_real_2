select * 
from {{source('insta_data_set','orders')}}
WHERE order_dow >= 2
