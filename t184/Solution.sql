select departmentId, max(salary)
from employee
group by departmentId;

select *
from employee;



select department.name as Department, employee.name as Employee, salary
from employee,
     department
where departmentId = department.id
  and (departmentId, salary) in (select departmentId, max(salary)
                                 from employee
                                 group by departmentId);