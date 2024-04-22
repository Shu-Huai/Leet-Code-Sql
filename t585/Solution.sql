select round(sum(tiv_2016), 2) as tiv_2016
from insurance
where pid in (select distinct a.pid
              from insurance as a,
                   insurance as b
              where a.tiv_2015 = b.tiv_2015
                and a.pid != b.pid
                and a.pid not in (select a.pid
                                  from insurance as a,
                                       insurance as b
                                  where a.pid != b.pid
                                    and a.lat = b.lat
                                    and a.lon = b.lon));