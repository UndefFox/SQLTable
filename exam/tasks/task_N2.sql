// Чтобы вычислить отклонение стоимости каждого
// билета от средней стоимости всех билетов, можно использовать Common Table Expression (CTE) вместе
// с оконной функцией для вычисления средней стоимости билетов

WITH ticket_prices AS (
    SELECT
        ticket_no,
        SUM(amount) AS total_amount
    FROM
        ticket_flights
    GROUP BY
        ticket_no
), average_price AS (
    SELECT
        AVG(total_amount) AS avg_amount
    FROM
        ticket_prices
)
SELECT
    tp.ticket_no,
    tp.total_amount,
    ap.avg_amount,
    tp.total_amount - ap.avg_amount AS deviation
FROM
    ticket_prices tp,
    average_price ap
ORDER BY
    deviation DESC;
