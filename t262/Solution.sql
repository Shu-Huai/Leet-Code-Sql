select request_at                                                as Day,
       round(sum(if(status != 'completed', 1, 0)) / count(*), 2) as 'Cancellation Rate'
from (select *
      from trips
      where request_at between '2013-10-01' and '2013-10-03') as a
         join users as b on (b.banned = 'No' and a.client_id = b.users_id)
         join users as c on (c.banned = 'No' and a.driver_id = c.users_id)
group by request_at;