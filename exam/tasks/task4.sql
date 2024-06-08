// найти все рейсы выполненные определенной моделью самолета (сухой суперджет) за июль 2017

SELECT * FROM flights WHERE aircraft_code = 'SU9' AND actual_arrival BETWEEN '2017-07-01 00:00:00' AND '2017-07-31'
