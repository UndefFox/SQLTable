// найти все рейсы flight_id, выполненные на боингах за последний месяц

SELECT flight_id FROM Flights AS f 
JOIN Aircrafts AS a ON f.aircraft_code = a.aircraft_code
WHERE (a.model ->> 'en' ilike 'BOEING%') AND ((CURRENT_DATE - INTERVAL '1 month') < f.shheduled_departure) 
