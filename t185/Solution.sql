select department.name as 'Department',
       employee.name   as 'Employee',
       employee.salary
from employee
         join department on employee.DepartmentId = department.Id
where 3 > (select count(distinct a.Salary)
           from employee as a
           where a.Salary > employee.salary
             and employee.departmentId = a.departmentId);