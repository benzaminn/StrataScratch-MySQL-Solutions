select * 
from (
        select t1.date,-- t1.user_id,t1.downloads,t3.paying_customer
        SUM(case when t3.paying_customer='no' then downloads end) as non_paying,
        SUM(case when t3.paying_customer='yes' then downloads end) as paying
        from ms_download_facts t1
        left join  ms_user_dimension t2
        on t1.user_id = t2.user_id
        left join ms_acc_dimension t3
        on t2.acc_id  = t3.acc_id
        group by 1
)X
where non_paying > paying
order by date asc;
