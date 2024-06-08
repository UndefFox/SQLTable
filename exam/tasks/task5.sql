// найти пассажиров которые сделали больше трех бронирований в 2017
SELECT t.passenger_id, t.passenger_name
FROM tickets t
WHERE t.book_ref IN (SELECT b.book_ref FROM bookings b WHERE YEAR(b.book_date)= 2017 GROUP BY b.book_ref HAVING COUNT(*)>3)