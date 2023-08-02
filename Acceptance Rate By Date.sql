select t1.date,-- t1.action,t1.user_id_sender,t1.user_id_receiver,t2.date,t2.action,
sum(case when t2.action ='accepted' then 1 else 0 end)/count(case when t1.action ='sent' then 1 else 0 end) as percentage_acceptance
from fb_friend_requests t1
left join fb_friend_requests t2
on t1.user_id_sender = t2.user_id_sender and 
t1.action='sent' and t2.action = 'accepted'
where t1.action='sent'
group by 1
order by 1 asc;
