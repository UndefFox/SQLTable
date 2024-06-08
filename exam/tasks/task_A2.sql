// Для написания запроса на основе CTE, который выводит контактные данные
// пассажиров рейсов на боингах, отмененных в июле,
// мы можем использовать соединения таблиц и фильтрацию по условию.

WITH cancelled_boeing_flights AS (
    SELECT
        f.flight_id
    FROM
        flights f
    JOIN
        aircrafts_data a ON f.aircraft_code = a.aircraft_code
    WHERE
        f.status = 'Cancelled'
        AND a.model->>'en' LIKE 'Boeing%'
        AND EXTRACT(MONTH FROM f.scheduled_departure) = 7
), passengers_contact_data AS (
    SELECT
        t.passenger_id,
        t.passenger_name,
        t.contact_data
    FROM
        tickets t
    JOIN
        ticket_flights tf ON t.ticket_no = tf.ticket_no
    JOIN
        cancelled_boeing_flights cbf ON tf.flight_id = cbf.flight_id
)
SELECT
    passenger_id,
    passenger_name,
    contact_data
FROM
    passengers_contact_data;