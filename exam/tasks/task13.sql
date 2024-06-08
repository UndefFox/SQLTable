// найти пассажиров, которые сделали более трех бронирований за последний год


SELECT passenger_name, COUNT(book_ref) as total_bookings
FROM tickets
WHERE book_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY passenger_name
HAVING COUNT(book_ref) > 3;
