
select name,sum(review_count) as review_count 
from yelp_business
group by name
order by 2 desc limit 5;
