// Чтобы создать процедуру, которая изменяет статус рейса
// на "cancelled" для всех рейсов, выполняемых на заданном воздушном судне,
// мы можем использовать PL/pgSQL — язык процедур для PostgreSQL.


CREATE OR REPLACE PROCEDURE cancel_flights_by_aircraft(p_aircraft_code character(3))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE flights
    SET status = 'cancelled'
    WHERE aircraft_code = p_aircraft_code;
END;
$$;