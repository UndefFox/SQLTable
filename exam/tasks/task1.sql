// вывести аэропорты по убыванию количества вылетающих рейсов
SELECT departure_airport, COUNT(flight_id) AS counter FROM Flights
GROUP BY departure_airport
ORDER BY counter DESC;