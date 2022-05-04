with base as(select DATE_TRUNC(converted_at, day) as date,
source,
count(*) as lead_count, 
concat('daily') as date_grain from ref{{leads.csv}}
where converted_at is not null
group by 1,2

UNION ALL

select DATE_TRUNC(converted_at, week) as date, 
source,
count(*) as lead_count, 
concat('weekly') as date_grain from ref{{leads.csv}}
where converted_at is not null
group by 1,2


UNION ALL

select DATE_TRUNC(converted_at, month) as date, 
source,
count(*) as lead_count, 
concat('monthly') as date_grain from ref{{leads.csv}}
where converted_at is not null
group by 1,2
)
,
lead_sums as(
select date, date_grain, source, sum(lead_count) as lead_sum from base
group by 1,2,3
order by sum(lead_count) desc

)
,
rankings as (
select date_grain, source, lead_sum, RANK()OVER(PARTITION BY date_grain ORDER BY lead_sum desc) as top_source from  lead_sums
),

Summary as (
select distinct date_grain, source, lead_sum from  rankings
where date_grain = 'monthly'
and top_source = 1

UNION ALL

select distinct date_grain, source, lead_sum from  rankings
where date_grain = 'weekly'
and top_source = 1

UNION ALL

select distinct date_grain, source, lead_sum from  rankings
where date_grain = 'daily'
and top_source = 1
)

select * from summary
order by date_grain, lead_sum desc



