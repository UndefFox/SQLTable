// 1. Найти рейсы, которые были отменены в июле.
// 2. Найти информацию о пассажирах, которые были забронированы на этих рейсах.
// 3. Получить контактные данные этих пассажиров.

WITH cancelled_july_flights AS (
    SELECT flight_id
    FROM flights
    WHERE status = 'cancelled'
      AND EXTRACT(MONTH FROM scheduled_departure) = 7
      AND EXTRACT(YEAR FROM scheduled_departure) = EXTRACT(YEAR FROM CURRENT_DATE)
      AND aircraft_code IN (
          SELECT aircraft_code
          FROM aircrafts_data
          WHERE model @> '{"manufacturer": "Boeing"}'
      )
), passenger_contacts AS (
    SELECT tf.ticket_no, t.passenger_name, t.contact_data
    FROM ticket_flights tf
    JOIN tickets t ON tf.ticket_no = t.ticket_no
    WHERE tf.flight_id IN (SELECT flight_id FROM cancelled_july_flights)
)
SELECT passenger_name, contact_data
FROM passenger_contacts;