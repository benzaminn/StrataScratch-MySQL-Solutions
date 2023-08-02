with view as (

    select CONCAT(price, room_type, host_since, zipcode,number_of_reviews) as host_id,
    price,
    case when number_of_reviews = 0 then 'New'
        when number_of_reviews >= 1 and number_of_reviews <= 5 then 'Rising'
        when number_of_reviews >= 6 and number_of_reviews <= 15 then 'Trending Up'
        when number_of_reviews >= 16 and number_of_reviews <= 40 then 'Popular'
        when number_of_reviews > 40  then 'Hot'
    end as segment
    from airbnb_host_searches
    group by host_id
)

select segment,min(price) as min_price,round(avg(price),3) as avg_price,max(price) as max_price
from view
group by 1
