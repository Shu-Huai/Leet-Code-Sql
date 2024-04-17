select a.machine_id, round(avg(b.timestamp - a.timestamp), 3) as processing_time
from (select *
      from activity
      where activity_type = 'start') as a,
     (select *
      from activity
      where activity_type = 'end') as b
where a.machine_id = b.machine_id
  and a.process_id = b.process_id
group by a.machine_id;