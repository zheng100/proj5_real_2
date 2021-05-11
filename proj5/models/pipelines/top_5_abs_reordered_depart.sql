{{ config(materialized='table') }}
SELECT
  b.department,
  a.count_of_reorders
FROM {{ ref('depart_most_ordered') }} a
JOIN  {{source('insta_data_set','departments')}} b
ON a.department_id = b.department_id
ORDER BY 2 DESC
