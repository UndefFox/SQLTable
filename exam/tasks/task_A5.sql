// Для того чтобы создать триггер и триггерную функцию, которые бы при удалении
// записи из таблицы aircrafts_data изменяли статусы рейсов на этих самолетах на cancelled,
// можно использовать PL/pgSQL в PostgreSQL.

-- Создание триггерной функции
CREATE OR REPLACE FUNCTION cancel_flights_on_aircraft_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE flights
    SET status = 'cancelled'
    WHERE aircraft_code = OLD.aircraft_code;

    RETURN OLD;
END;
$$;

-- Создание триггера
CREATE TRIGGER trigger_cancel_flights_on_aircraft_delete
AFTER DELETE ON aircrafts_data
FOR EACH ROW
EXECUTE FUNCTION cancel_flights_on_aircraft_delete();