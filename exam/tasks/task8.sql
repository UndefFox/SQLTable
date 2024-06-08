// напишите запрос на основе использования СТЕ, который выводит имена пассажиров, летавших в бизнес-классе
WITH business_class_passenger AS (
    SELECT t.passenger_name
    FROM tickets t
    INNER JOIN ticket_flights tf ON t.ticket_no = tf.ticket_no
    WHERE tf.fare_conditions = 'Business'
)
SELECT passenger_name
FROM business_class_passenger;

WITH tfb (select )
