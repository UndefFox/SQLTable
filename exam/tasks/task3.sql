// вывести список рейсов S7 (c этого смешно, коллегам отправлю)) с задержками больше 2х часов
SELECT flight_id
FROM flights as f
WHERE HOUR(DATEDIFF(hour, f.actual_arrival, f.scheduled_arrival)) > 2

фикс:
SELECT flight_id, DATE_PART('hour',f.actual_arrival-f.scheduled_arrival)
FROM flights as f
WHERE DATE_PART('hour',f.actual_arrival-f.scheduled_arrival) > 2
