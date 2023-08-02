

select policy_num,state,claim_cost,fraud_score
from(
    select *,
    percent_rank() over(partition by state order by fraud_score asc) as per_rank
    from fraud_score
) X

where per_rank <=1 and per_rank >=.95
order by policy_num asc
