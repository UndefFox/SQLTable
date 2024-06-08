// Для выполнения этой задачи нужно использовать оконные функции,
// чтобы вычислить среднюю стоимость билета по каждому направлению и затем
// отклонение каждого билета от этой средней стоимости.

WITH ticket_flight_data AS (
    SELECT
        tf.ticket_no,
        tf.flight_id,
        tf.amount,
        f.departure_airport,
        f.arrival_airport
    FROM
        ticket_flights tf
    JOIN
        flights f ON tf.flight_id = f.flight_id
), avg_price_per_route AS (
    SELECT
        departure_airport,
        arrival_airport,
        AVG(amount) OVER (PARTITION BY departure_airport, arrival_airport) AS avg_amount
    FROM
        ticket_flight_data
)
SELECT
    tfd.ticket_no,
    tfd.flight_id,
    tfd.amount,
    tfd.departure_airport,
    tfd.arrival_airport,
    app.avg_amount,
    tfd.amount - app.avg_amount AS deviation
FROM
    ticket_flight_data tfd
JOIN
    avg_price_per_route app ON tfd.departure_airport = app.departure_airport AND tfd.arrival_airport = app.arrival_airport
ORDER BY
    tfd.ticket_no;
