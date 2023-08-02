
with view  as (
    select state,sum(case when stars = 5 then 1 else 0 end) as n_businesses
    from yelp_business
    group by state
    order by n_businesses desc,state asc
),
t1 as (
    select state,n_businesses,
    rank() over (order by n_businesses desc) as rnk
    from view
)

select state,n_businesses
from t1
where rnk <= 5
