-- You have been asked to find the job titles of the highest-paid employees.
-- Your output should include the highest-paid title or multiple titles with the same salary.

select T.worker_title as title
from worker W
inner join title T
on W.worker_id = T.worker_ref_id
where W.salary = (select max(salary) from worker)
order by title;
