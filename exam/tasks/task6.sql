// используя оконные функции напишите запрос, который выводит долю каждого бронирования в общей выручке, 
// а также отклонение в процентах выручки бронирования от средней стоимости бронирования

WITH ans AS(
    SELECT b.book_ref, b.total_amount,
    SUM(b.total_amount) OVER() AS total_revenue,
    b.total_amount/(SUM(b.total_amount) OVER()) as booking_share,
    AVG(b.total_amount) OVER() as average,
    (b.total_amount/(AVG(b.total_amount) OVER()))*100 as booking_percentages
    FROM bookings b
)

SELECT booking_share,  booking_percentages FROM ans;