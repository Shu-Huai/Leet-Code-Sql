select name, balance
from (select account, sum(amount) as balance
      from transactions
      group by account) as a,
     users
where balance > 10000
  and a.account = users.account;