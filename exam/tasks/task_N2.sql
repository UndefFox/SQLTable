// 1. Найти самый северный аэропорт.
// 2. Найти рейсы, которые прилетали в этот аэропорт.
// 3. Найти пассажиров, которые летали на этих рейсах.

WITH northernmost_airport AS (
    SELECT
        airport_code
    FROM
        airports_data
    ORDER BY
        coordinates[1] DESC -- Assuming the point is stored as (latitude, longitude)
    LIMIT 1
), flights_to_northernmost_airport AS (
    SELECT
        flight_id
    FROM
        flights
    WHERE
        arrival_airport = (SELECT airport_code FROM northernmost_airport)
), passengers_on_northern_flights AS (
    SELECT
        tf.ticket_no,
        t.passenger_id,
        t.passenger_name,
        t.contact_data
    FROM
        ticket_flights tf
    JOIN
        tickets t ON tf.ticket_no = t.ticket_no
    WHERE
        tf.flight_id IN (SELECT flight_id FROM flights_to_northernmost_airport)
)
SELECT
    passenger_id,
    passenger_name,
    contact_data
FROM
    passengers_on_northern_flights;
