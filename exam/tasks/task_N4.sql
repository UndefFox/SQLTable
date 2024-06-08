// Для создания процедуры, которая изменяет статус
// рейсов на "Delayed" для рейсов с задержкой свыше одного часа на
// заданную дату, можно использовать PL/pgSQL. В процедуре мы будем использовать
// параметры для указания даты рейса.

CREATE OR REPLACE PROCEDURE update_delayed_flights(p_flight_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE flights
    SET status = 'Delayed'
    WHERE
        DATE(scheduled_departure) = p_flight_date
        AND actual_departure IS NOT NULL
        AND EXTRACT(EPOCH FROM (actual_departure - scheduled_departure)) > 3600;

    RAISE NOTICE 'Status of delayed flights on % has been updated to Delayed.', p_flight_date;
END;
$$;

// Вызов функции:

CALL update_delayed_flights('2024-06-01');
