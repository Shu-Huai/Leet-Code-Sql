select a.person_name
from (select person_name, @pre := @pre + weight as weight
      from Queue,
           (select @pre := 0) as tmp
      order by turn) a
where a.weight <= 1000
order by a.weight desc
limit 1;