WITH RECURSIVE flight_paths AS (
  SELECT 
    df.Id_delta_flight AS flight1,
    CAST(NULL AS UNSIGNED) AS flight2,
    CAST(NULL AS UNSIGNED) AS flight3,
    df.depart_airport,
    df.arrive_airport,
    df.depart_date_time,
    df.arrive_date_time,
    df.flight_cost_coach AS total_cost_coach,
    df.flight_cost_business AS total_cost_business,
    0 AS stops
  FROM 
    delta_flights AS df
  WHERE 
    df.depart_date_time < df.arrive_date_time AND
    df.depart_airport <> df.arrive_airport

  UNION ALL

  SELECT 
    fp.flight1,
    sf.Id_southwest_flight AS flight2,
    NULL AS flight3,
    fp.depart_airport,
    sf.arrive_airport,
    fp.depart_date_time,
    sf.arrive_date_time,
    fp.total_cost_coach + sf.flight_cost_coach AS total_cost_coach,
    fp.total_cost_business + sf.flight_cost_business AS total_cost_business,
    1 AS stops
  FROM 
    flight_paths AS fp
    JOIN southwest_flights AS sf ON fp.arrive_airport = sf.depart_airport
  WHERE 
    sf.depart_date_time > fp.arrive_date_time + INTERVAL 1 HOUR AND
    sf.depart_date_time < fp.arrive_date_time + INTERVAL 5 HOUR AND
    sf.depart_date_time < sf.arrive_date_time AND
    sf.depart_airport <> sf.arrive_airport

  UNION ALL

  SELECT 
    fp.flight1,
    fp.flight2,
    df.Id_delta_flight AS flight3,
    fp.depart_airport,
    df.arrive_airport,
    fp.depart_date_time,
    df.arrive_date_time,
    fp.total_cost_coach + df.flight_cost_coach AS total_cost_coach,
    fp.total_cost_business + df.flight_cost_business AS total_cost_business,
    2 AS stops
  FROM 
    flight_paths AS fp
    JOIN delta_flights AS df ON fp.arrive_airport = df.depart_airport
  WHERE 
    df.depart_date_time > fp.arrive_date_time + INTERVAL 1 HOUR AND
    df.depart_date_time < fp.arrive_date_time + INTERVAL 5 HOUR AND
    df.depart_date_time < df.arrive_date_time AND
    df.depart_airport <> df.arrive_airport
)

SELECT 
  fp.*,
  da.airport_code AS depart_airport_code,
  da.airport_type AS depart_airport_type,
  da.airport_name AS depart_airport_name,
  da.latitude_deg AS depart_latitude_deg,
  da.longitude_deg AS depart_longitude_deg,
  da.region_name AS depart_region_name,
  da.local_region AS depart_local_region,
  da.municipality AS depart_municipality,
  da.iata_code AS depart_iata_code,
  da.local_code AS depart_local_code,
  aa.airport_code AS arrive_airport_code,
  aa.airport_type AS arrive_airport_type,
  aa.airport_name AS arrive_airport_name,
  aa.latitude_deg AS arrive_latitude_deg,
  aa.longitude_deg AS arrive_longitude_deg,
  aa.region_name AS arrive_region_name,
  aa.local_region AS arrive_local_region,
  aa.municipality AS arrive_municipality,
  aa.iata_code AS arrive_iata_code,
  aa.local_code AS arrive_local_code
FROM 
  flight_paths AS fp
  JOIN airports AS da ON fp.depart_airport = da.id_airport
  JOIN airports AS aa ON fp.arrive_airport = aa.id_airport;