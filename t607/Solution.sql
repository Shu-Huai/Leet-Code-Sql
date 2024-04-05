select *
from salesperson,
     company,
     orders
where company.name != 'RED'
;
select name
from salesperson
where sales_id not in (select sales_id
                       from company,
                            orders
                       where name = 'RED'
                         and company.com_id = orders.com_id);