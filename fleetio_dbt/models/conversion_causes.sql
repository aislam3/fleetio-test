/*SELECT source, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1
order by count(converted_at)/ count(created_at) desc

SELECT state, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1
order by count(converted_at)/ count(created_at) desc

SELECT job_title, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1
order by count(converted_at)/ count(created_at) desc

SELECT fleet_size, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1
order by count(converted_at)/ count(created_at) desc

SELECT industry, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1
order by count(converted_at)/ count(created_at) desc

SELECT source, fleet_size, job_title, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM `fleetio-348817.fleetiodata.leads` 
group by 1,2,3 
order by count(created_at) desc, count(converted_at)/ count(created_at) desc

*/ 

SELECT source, fleet_size, industry, count(converted_at) as converted, count(created_at) as created, 
count(converted_at)/ count(created_at) as percentage
FROM {{ref('leads')}} 
group by 1,2,3
order by count(converted_at) desc, count(converted_at)/ count(created_at) desc


