// вывести список бронирований, которые включает билеты с разными условиями тарифа


WITH get_fare_cond AS (
    SELECT DISTINCT book_ref, fare_conditions
    FROM ticket_flights
        INNER JOIN tickets USING (ticket_no))
SELECT book_ref, COUNT(SELECT * FROM get_fare_cond WHERE book_ref = tf.book_ref) AS Количество тарифов
FROM ticket_flights as tf
WHERE COUNT(SELECT * FROM get_fare_cond WHERE book_ref = tf.book_ref) > 1;


SELECT book_ref, count(distinct fare_conditions) as col
FROM ticket_flights
        INNER JOIN tickets USING (ticket_no)
GROUP BY 1
HAVING col > 1
