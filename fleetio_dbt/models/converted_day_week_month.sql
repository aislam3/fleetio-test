select 
    DATE_TRUNC(converted_at, day) as date
    , count(*) as lead_count
    , concat('daily') as date_grain 
from {{ref('leads')}}
where converted_at is not null
group by 1

UNION ALL

select 
    DATE_TRUNC(converted_at, day) as date
    , count(*) as lead_count
    , concat('weekly') as date_grain 
from {{ref('leads')}}
where converted_at is not null
group by 1

UNION ALL

select 
    DATE_TRUNC(converted_at, day) as date
    , count(*) as lead_count
    , concat('monthly') as date_grain 
from {{ref('leads')}}
where converted_at is not null
group by 1
