select city
from (
    select city,SUM(count_commas) as count
    from (
        select (char_length(amenities) - char_length(replace(amenities, ",", ""))) 
        as count_commas, city
        from airbnb_search_details
    )t1
    group by city
    
)t2
order by count desc
limit 1
