select user_id as buyer_id, join_date, if(orders_in_2019 is not null, orders_in_2019, 0) as orders_in_2019
from users
         left join (select count(order_id) as orders_in_2019, buyer_id
                    from orders
                    where order_date between '2019-01-01 00:00:00' and '2019-12-31 23:59:%9'
                    group by buyer_id) as a on user_id = buyer_id;