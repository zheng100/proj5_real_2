with cat_rank AS (
SELECT user_id, department_id, cat_count, ROW_NUMBER() OVER( PARTITION BY user_id
        ORDER BY cat_count DESC
    ) as rank 
FROM {{ ref('users_categorycount') }} 
ORDER BY user_id, rank 
)

SELECT user_id, department_id
FROM cat_rank 
WHERE rank = 1