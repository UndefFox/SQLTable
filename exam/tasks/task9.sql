// напишите запрос, который выводит выручку каждого авиабилета и сравнение его цены с самым дорогим
// и дешевым билетом, купленным В ТОТ ЖЕ ДЕНЬ

SELECT ABS(amount - MAX(amount) OVER(partition by EXTRACT(DAY FROM book_date))) AS mini,
        ABS(amount - MIN(amount) OVER(partition by EXTRACT(DAY FROM book_date))) AS maxi,
        amount,
        book_date
FROM ticket_flights
    JOIN tickets USING(ticket_no)
    JOIN bookings USING(book_ref);