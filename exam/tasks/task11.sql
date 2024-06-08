// найти рейсы, у которых фактическое время прибытия было как минимум на 30 минут раньше запланированного

SELECT * FROM bookings.flights WHERE
EXTRACT(MINUTES FROM (scheduled_arrival - actual_arrival)) >= 30;