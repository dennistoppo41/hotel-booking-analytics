# 🏨 Hotel Booking Analytics Framework

[![Tableau](https://img.shields.io/badge/Tableau-Public-orange?style=flat&logo=tableau)](YOUR_TABLEAU_PUBLIC_DASHBOARD_URL)
[![Python](https://img.shields.io/badge/Python-3.9+-blue?style=flat&logo=python)](notebooks/)
[![SQL](https://img.shields.io/badge/SQL-Optimization-lightgrey?style=flat&logo=sqlite)](sql_scripts/)

An end-to-end data analytics framework designed to help a Hotel General Manager maximize revenue per available room (RevPAR) and mitigate bottom-line operational losses by anticipating and managing booking cancellations.

---

## 🎯 Executive Problem Statement
In the competitive hospitality ecosystem, unpredictable booking cancellations severely impact revenue predictability and labor allocation. This project builds a three-tiered asynchronous data pipeline to address key operational blindspots:
* **Predictive Cancellation Mitigation:** Identifying high-risk distribution channels to enforce tighter deposit and non-refundable booking structures.
* **Dynamic Seasonal Pricing Calibration:** Uncovering pricing elasticity trends across property classes (City vs. Resort hotels) to optimize seasonal room pricing.
* **Operational Resource Scaling:** Projecting granular customer demands to align supply chain procurement and staffing.

---

## 🛠️ Analytics Architecture & Tech Stack
The project shifts cleanly across three modern analytical environments:
$$\text{Python (Pandas / ETL)} \longrightarrow \text{SQL Database (Relational Aggregations)} \longrightarrow \text{Tableau Public (BI Visuals)}$$

1. **Python (Data Engineering Staging):** Handled missing data entries, isolated invalid zero-guest anomalies, and engineered metrics like total duration of stay and verified aggregate guest counts.
2. **SQL (Relational Queries Engine):** Conducted performance risk profiling and conditional sort queries across seasonal demand markers.
3. **Tableau Public (Business Intelligence Layer):** Formulated an executive-grade interactive tracking dashboard utilizing dynamic dual-axis charts and high-contrast choropleths.

---

## 📊 Interactive Dashboard Preview
> **[View the Interactive Tableau Dashboard Live Here](https://public.tableau.com/views/HotelRevenueAnalysis_17833518404500/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**

![Alternative text description]('/Users/dennistoppo/Desktop/Screenshot 2026-07-07 at 1.18.12 PM.png')

---

## 💡 Core Business Insights Discovered

### 🚨 1. Distribution Channel Vulnerability
Travel Agency & Tour Operator (**TA/TO**) channels represent the highest portfolio loss risk. They account for 97,750 bookings with a staggering **41.06% cancellation rate**, completely overshadowing **Direct** bookings which exhibit a minimal **17.49%** cancellation footprint. 

### 📈 2. Property Class Pricing Seasonality
Resort properties undergo intense hyper-seasonality spikes. During peak summer intervals (July/August), Resort ADR surges exponentially to **$155.18** and **$186.79** respectively, before cascading down to an off-season low of **$69.05** in December. Alternatively, City Hotels keep an incredibly stable year-round baseline ($89 to $115 per night).

### 📊 3. Global Conversion Benchmark
The entire portfolio registers an overall baseline cancellation rate of **37.08%** across all 119,210 verified valid entries, demonstrating an urgent need for automated text/email confirmation workflows 14 days out from arrival dates.

---

## 💻 Code Snippet Highlights

### Python Data Engineering Layer
```python
# Feature Engineering: Synthesizing analytical aggregates
df['total_stays'] = df['stays_in_weekend_nights'] + df['stays_in_week_nights']
df['total_guests'] = df['adults'] + df['children'] + df['babies']

# Eliminate data anomalies (rows with zero active check-ins registered)
df_cleaned = df[df['total_guests'] > 0]
```

### SQL Analytical Window Focus
```sql
SELECT 
    distribution_channel,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_cancellations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_percentage
FROM hotel_bookings_cleaned
GROUP BY distribution_channel
ORDER BY total_bookings DESC;
```

---

## 🚀 How To Run Locally
1. Clone this repository to your desktop machine.
2. Run the `notebooks/hotel_booking_cleaning.ipynb` notebook to transform raw entries into `hotel_bookings_cleaned.csv`.
3. Load the resulting file into your SQL schema environment and run queries inside the `sql_scripts/` directory.
4. View the interactive metrics directly via Tableau Public(https://public.tableau.com/views/HotelRevenueAnalysis_17833518404500/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).
