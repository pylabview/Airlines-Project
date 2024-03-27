CREATE VIEW `southwest_flights_direct` AS
    SELECT 
        f1.Id_southwest_flight AS f1_id,
        NULL AS f2_id,
        NULL AS f3_id,
        'direct' AS flight_type,
        0 AS num_of_stopovers,
        CONCAT(IFNULL(a1.local_code, a1.iata_code),
                CHAR(58),
                IFNULL(a2.local_code, a2.iata_code)) AS route,
        f1.flight_number AS f1_flight_number,
        TIME_FORMAT(TIMEDIFF(f1.arrive_date_time, f1.depart_date_time),
                '%hhr %imn') AS trip_duration,
        f1.flight_cost_coach AS trip_total_cost_coach,
        f1.flight_cost_business AS trip_total_cost_business,
        f1.depart_date_time AS f1_departure,
        f1.arrive_date_time AS f1_arrival,
        f1.depart_airport AS f1_origin,
        a1.airport_type AS f1_origin_type,
        a1.airport_name AS f1_origin_name,
        a1.latitude_deg AS f1_origin_latitude,
        a1.longitude_deg AS f1_origin_longitude,
        a1.region_name AS f1_origin_region,
        a1.local_region AS f1_origin_local_region,
        a1.municipality AS f1_origin_municipality,
        a1.iata_code AS f1_origin_iata,
        a1.local_code AS f1_origin_local_code,
        f1.arrive_airport AS f1_destination,
        a2.airport_type AS f1_destination_type,
        a2.airport_name AS f1_destination_name,
        a2.latitude_deg AS f1_destination_latitude,
        a2.longitude_deg AS f1_destination_longitude,
        a2.region_name AS f1_destination_region,
        a2.local_region AS f1_destination_local_region,
        a2.municipality AS f1_destination_municipality,
        a2.iata_code AS f1_destination_iata,
        a2.local_code AS f1_destination_local_code
    FROM
        atr.southwest_flights f1
            INNER JOIN
        atr.airports a1 ON f1.depart_airport = a1.airport_code
            INNER JOIN
        atr.airports a2 ON f1.arrive_airport = a2.airport_code
    WHERE
        f1.depart_date_time < f1.arrive_date_time
            AND f1.depart_airport <> f1.arrive_airport;