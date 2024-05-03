(select name as results
 from movierating,
      users
 where users.user_id = movierating.user_id
 group by users.user_id, name
 order by count(*) desc, name
 limit 1)
union all
(select title as results
 from movierating,
      movies
 where movies.movie_id = movierating.movie_id
   and created_at like '2020-02%'
 group by movies.movie_id, title
 order by avg(rating) desc, title
 limit 1);