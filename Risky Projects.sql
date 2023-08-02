

with cte as (
    select LP.id,LP.title,LP.budget,datediff(LP.end_date,LP.start_date) as date_diff,
    EP.emp_id,LE.Salary
    from linkedin_projects LP
    join linkedin_emp_projects EP
    on LP.id=EP.project_id
    join linkedin_employees LE
    on EP.emp_id = LE.id
    order by LP.id,LP.title
)

select title,budget, CEIL((sum(salary)/365)*date_diff) as prorated_employee_expense
from cte
group by title
having budget < prorated_employee_expense
