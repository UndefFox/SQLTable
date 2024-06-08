// вывести список бронирований, которые включают билеты с разными условиями тарифа

with ts as (
select distinct book_ref, fare_cond from bookings b
inner join tickets t
on b.book_ref = t.book_ref
inner join ticket_flights tf
on t.ticket_no = tf.ticket_no
)
select book_ref, count(fare_cond)
from ts
group by book_ref
having count(fare_cond) > 1

book_ref fare_cond
AAA         bus
AAA         eco



select t.passenger_name, count(distinct fare_conditions) as fare_cond
from tickets t
inner join ticket_flights tf
on t.ticket_no = tf.ticket_no
group by passenger_name
having count(distinct fare_conditions) = (SELECT count(distinct fare_conditions) FROM ticket_flights)
