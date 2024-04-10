select name, if(distance is not null, sum(distance), 0) as travelled_distance
from users
         left join rides on users.id = rides.user_id
group by users.id, name
order by travelled_distance desc, name;