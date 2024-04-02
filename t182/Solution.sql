select email
from (select email, count(email) as num
      from person
      group by email) as a
where num > 1;
select email
from person
group by email
having count(email) > 1;