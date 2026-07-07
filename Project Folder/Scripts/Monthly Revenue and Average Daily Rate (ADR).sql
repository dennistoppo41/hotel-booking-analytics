SELECT 
    arrival_date_month,
    ROUND(AVG(adr), 2) AS avg_daily_rate,
    SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS total_estimated_revenue
FROM fourth-groove-499909-u2.hotel_bookings.bookings_cleaned
WHERE is_canceled = 0
GROUP BY arrival_date_month
ORDER BY total_estimated_revenue DESC;