select prices.product_id                                                           as product_id,
       if(purchase_date is not null, round(sum(price * units) / sum(units), 2), 0) as average_price
from prices
         left join unitssold on prices.product_id = unitssold.product_id
where purchase_date between start_date and end_date
   or purchase_date is null
group by prices.product_id;