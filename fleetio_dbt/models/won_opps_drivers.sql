with base as (
    SELECT * from {{ref('opportunity_data')}})
  
(select * from 
   (SELECT
    concat("industry") as cat_variable
    , industry as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct desc
LIMIT 3)

UNION ALL

(select * from 
   (SELECT
    concat("industry") as cat_variable
    , industry as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct
LIMIT 3)

UNION ALL

(select * from 
   (SELECT
    concat("source") as cat_variable
    , source as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct desc
LIMIT 3)
UNION ALL
(select * from 
   (SELECT
    concat("source") as cat_variable
    , source as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct
LIMIT 3)

UNION ALL

(select * from 
   (SELECT
    concat("fleet_size") as cat_variable
    , fleet_size as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct desc
LIMIT 3)
UNION ALL
(select * from 
   (SELECT
    concat("fleet_size") as cat_variable
    , fleet_size as variable_name
    , sum(won_count) as won_count
    , count(*) as opp_count
    , sum(won_count)/count(*) as won_pct
   from base
    group by 1,2)
order by won_pct
LIMIT 3)


