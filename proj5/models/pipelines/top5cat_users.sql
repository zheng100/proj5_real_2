SELECT a.department_id, a.department, max(cat_reorder_avg) as cat_reorder_avg, to_json_string(array_agg(user_id)) as freq_users
FROM {{ ref('top5_reorder_category') }} a, {{ ref('users_topcat') }} b
WHERE a.department_id =  b.department_id
GROUP BY a.department_id, a.department
ORDER BY cat_reorder_avg DESC