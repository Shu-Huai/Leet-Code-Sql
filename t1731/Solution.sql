select employees.employee_id, employees.name, a.reports_count, average_age
from employees,
     (select employee_id, name, count(reports_to) as reports_count, reports_to, round(avg(age)) as average_age
      from employees
      group by reports_to) as a
where employees.employee_id = a.reports_to
order by employee_id;