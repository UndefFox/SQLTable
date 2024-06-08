// вывести пассажиров, летавших в разные аэропорты

SELECT t.passenger_name, COUNT(distinct f.arrival_airport) as arr_air;
FROM tickets t;
JOIN ticket_flights tf on t. ticket_no = tf.ticket_no;
JOIN flights f on tf .flight_id = f .flight_id;
GROUP BY t.passenger_name
HAVING COUNT(distinct f.arrival_airport) > 1
