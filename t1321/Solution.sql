select a.visited_on                as visited_on,
       sum(b.amount)               as amount,
       round(sum(b.amount) / 7, 2) as average_amount
from (select distinct visited_on
      from Customer) as a
         join(select visited_on, sum(amount) as amount
              from Customer
              group by visited_on) as b
             on (b.visited_on >= date_sub(a.visited_on, interval 6 day)) and (b.visited_on <= a.visited_on)
where date_sub(a.visited_on, interval 6 day) >= (select min(visited_on) from Customer)
group by a.visited_on
order by a.visited_on;