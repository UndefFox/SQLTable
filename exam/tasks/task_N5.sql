// Для создания триггера и триггерной функции, которые проверяют,
// что имя пассажира не пустое при добавлении записи в базу данных,
// можно использовать PL/pgSQL в PostgreSQL.

-- Создание триггерной функции
CREATE OR REPLACE FUNCTION check_passenger_name()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.passenger_name IS NULL OR TRIM(NEW.passenger_name) = '' THEN
        RAISE EXCEPTION 'Passenger name cannot be empty';
    END IF;
    RETURN NEW;
END;
$$;

-- Создание триггера
CREATE TRIGGER trigger_check_passenger_name
BEFORE INSERT ON tickets
FOR EACH ROW
EXECUTE FUNCTION check_passenger_name();