// вывести список бронирований, которые включает билеты с разными условиями тарифа


WITH get_fare_cond AS (
    SELECT book_ref, fare_conditions
    FROM ticket_flights
        INNER JOIN tickets USING (ticket_no)
    WHERE tic)
SELECT book_ref, 
with top5 as (
select passenger_id, count(*) as col
from tickets
group by passenger_id
order by col desc
limit 5
)
SELECT (departure_airport || '-' || arrival_airport) AS direction 
FROM FlightsJOIN Ticket_flights ON Flights.flight_id = Ticket_flights.flight_id
JOIN Tickets ON Ticket_flights.ticket_no = Tickets.ticket_no
WHERE passenger_id in (select passenger_id from top5)

