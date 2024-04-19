set global log_bin_trust_function_creators = true;
Drop function if exists getNthHighestSalary;
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    declare m int;
    set m = n - 1;
    RETURN (select distinct salary
            from employee
            order by Salary desc
            limit 1 offset m);
END;
select getNthHighestSalary(2);