select count(user_id)
from activity
where datediff('2019-07-27', activity_date) < 30
group by activity_date;
select activity_date as day, count(user_id) as active_users
from (select distinct user_id, activity_date
      from activity
      where datediff('2019-07-27', activity_date) between 0 and 29) as a
group by activity_date;