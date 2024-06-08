// Чтобы ранжировать всех пассажиров по частоте полетов и по сумме выручки, можно
// использовать оконные функции. Оконные функции позволяют выполнять агрегатные вычисления,
// сохраняя возможность возвращать все строки.

WITH passenger_flight_stats AS (
    SELECT
        t.passenger_id,
        t.passenger_name,
        COUNT(tf.flight_id) AS flight_count,
        SUM(tf.amount) AS total_revenue
    FROM
        tickets t
        JOIN ticket_flights tf ON t.ticket_no = tf.ticket_no
    GROUP BY
        t.passenger_id, t.passenger_name
), ranked_passengers AS (
    SELECT
        passenger_id,
        passenger_name,
        flight_count,
        total_revenue,
        RANK() OVER (ORDER BY flight_count DESC) AS flight_rank,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM
        passenger_flight_stats
)
SELECT
    passenger_id,
    passenger_name,
    flight_count,
    total_revenue,
    flight_rank,
    revenue_rank
FROM
    ranked_passengers
ORDER BY
    flight_rank, revenue_rank;