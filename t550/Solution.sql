select round((select count(distinct a.player_id)
              from activity as a,
                   activity as b,
                   (select player_id, min(event_date) as min
                    from activity
                    group by player_id) as c
              where a.player_id = b.player_id
                and datediff(a.event_date, b.event_date) = -1
                and a.player_id = c.player_id
                and a.event_date = c.min) / (select count(distinct player_id) from activity),
             2) as fraction;