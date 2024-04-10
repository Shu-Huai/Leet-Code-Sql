select *
from (select product_name, sum(unit) as unit
      from products,
           orders
      where orders.product_id = products.product_id
        and order_date between '2020-02-01' and '2020-02-29'
      group by orders.product_id) as a
where unit >= 100;