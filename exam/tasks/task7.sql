// напишите запрос с использованием подзапросов, который выводит все коды бронирований, пассажиры из которых 
// летали на месте 1А

Select Distinct Bookings.book_ref
From Bookings
Join Tickets ON Bookings.book_ref = Tickets.book_ref
join Boarding_passes on Tickets.ticket_no = Boarding_passes.ticket_no
Where Boarding_passes.seat_no = "1A";



Select Distinct Bookings.book_ref
From Bookings join Tickets on Bookings.book_ref = Tickets.book_ref
where ticket_no in (
select ticket_no from Tickets
join Boarding_passes on Tickets.ticket_no = Boarding_passes.ticket_no
Where Boarding_passes.seat_no = "1A");
