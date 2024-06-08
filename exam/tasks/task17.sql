// написать запрос, который выводит накопленную выручку (с сортировкой по дням) 
// по рейсам на Боинг 777-300 вылетающим из мск

SELECT aircraft_code
FROM aircrafts
WHERE model = 'Боинг 777-300';

// код самолета = 773


SELECT aircraft_code COUNT(*) OVER() AS total_boeing
FROM aircrafts
WHERE model = 'Боинг 777-300';
select distinct book_date::date, sum(amount) over (order by book_date::date)


SELECT b.book_date::date, SUM(b.total_amount) OVER (ORDER BY )
FROM bookings b
join tickets t on b.book_ref = t.book_ref
join ticket_flights tf on t.ticket_no = tf.ticket_no
join flights f on tf.flight_id = f.flight_id
join aircrafts a on f.aircraft_code = a.aircraft_code
where a.model = 'Боинг 777-300' and a.departure_airport in ('VKO','SVO','DME')



//РЕЙСЫ - flight_id
//НАПРАВЛЕНИЕ - departure_airport || '-' || arrival_airport