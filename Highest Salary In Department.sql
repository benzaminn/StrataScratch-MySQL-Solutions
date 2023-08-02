select department,first_name as employee_name,salary
from employee
where (department,salary) in (select department,max(salary) as salary
    from employee group by 1);
