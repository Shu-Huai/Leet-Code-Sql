select signups.user_id, round(sum(if(action = 'confirmed', 1, 0)) / count(*), 2) as confirmation_rate
from signups
         left join confirmations on signups.user_id = confirmations.user_id
group by signups.user_id;