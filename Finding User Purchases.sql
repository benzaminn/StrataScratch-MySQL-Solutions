

select distinct view.user_id
from
(select X.user_id,X.created_at,DATEDIFF(X.next_purchase,X.created_at) as diff_days
    from          
        ( 
         select user_id,created_at,
         ROW_NUMBER() OVER(partition by user_id order by created_at asc) as part,
         LEAD(created_at) OVER(partition by user_id order by created_at asc) as next_purchase
         from amazon_transactions
        ) X
) view

where view.diff_days < 8
