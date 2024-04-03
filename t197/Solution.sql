select b.id
from weather as a,
     weather as b
where datediff(b.recordDate, a.recordDate) = 1
  and b.temperature > a.temperature;
select id
from (select id,
             temperature,
             recordDate,
             lag(recordDate, 1) over (order by recordDate)  as last_date,
             lag(temperature, 1) over (order by recordDate) as last_temperature
      from Weather) a
where temperature > last_temperature
  and datediff(recordDate, last_date) = 1;