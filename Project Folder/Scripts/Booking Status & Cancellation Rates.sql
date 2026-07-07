SELECT 
    hotel,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate
from fourth-groove-499909-u2.hotel_bookings.bookings_cleaned
group by hotel;

