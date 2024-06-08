// вывести имена пассажиров, которые летали во всех доступных классах обслуживания
select t.passenger_name, count(distinct fare_conditions) as fare_cond
from tickets t
inner join ticket_flights tf
on t.ticket_no = tf.ticket_no
group by passenger_name
having count(distinct fare_conditions) = (SELECT count(distinct fare_conditions) FROM ticket_flights)
