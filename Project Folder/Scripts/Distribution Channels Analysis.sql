SELECT 
    distribution_channel,
    COUNT(*) AS total_bookings,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate
FROM fourth-groove-499909-u2.hotel_bookings.bookings_cleaned
GROUP BY distribution_channel
ORDER BY total_bookings DESC;