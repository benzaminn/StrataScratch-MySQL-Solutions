

select from_user,count(day) as total_emails,
ROW_number() OVER(order by count(*) desc,from_user asc)
from google_gmail_emails
group by from_user
