/*
Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. 
For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, 
consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . 
Output the user_id and their average session time.  */


with PL as ( 
            select user_id,DATE(timestamp) as date,MAX(timestamp) as load_time
            from facebook_web_log
            where action= 'page_load'
            group by user_id,date
),
PE as (  
        select user_id,DATE(timestamp) as date,MIN(timestamp) as exit_time
        from facebook_web_log
        where action= 'page_exit'
        group by user_id,date
   )
   
select PL.user_id, AVG(TIMESTAMPDIFF(second,load_time,exit_time)) as session_time
from PL left join PE 
on PL.user_id = PE.user_id
and PL.date = PE.date
and PL.load_time < PE.exit_time
group by user_id
having session_time is not null
