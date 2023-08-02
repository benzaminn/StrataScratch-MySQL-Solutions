
with all_users as(
select * 
from facebook_friends
union 
select user2 as user1,user1 as user2
from facebook_friends
order by user1
)

select user1,
count(user2)*100/(select count(distinct user1) from all_users) as percentage_popularity
from all_users
group by user1
