

select X.month,round((X.value - lag(X.value) over(order by X.month) )*100/
lag(X.value) over(order by X.month),2) as revenue_diff_pct
from (
    select DATE_FORMAT(created_at,"%Y-%m") as month, sum(value) as value
    from sf_transactions
    group by month
    ) X
