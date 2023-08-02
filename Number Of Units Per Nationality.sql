select nationality,count(distinct unit_id) as apartment_count
from airbnb_hosts host
left join airbnb_units units
on host.host_id = units.host_id
where host.age < 30 and units.unit_type = 'Apartment'
group by nationality
order by apartment_count desc
