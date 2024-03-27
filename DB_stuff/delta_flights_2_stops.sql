CREATE VIEW `delta_flights_2_stop` AS
    SELECT 
        f1.Id_delta_flight AS f1_id,
        f2.Id_delta_flight AS f2_id,
        f3.Id_delta_flight AS f3_id,
        '2-stop' AS flight_type,
        2 AS num_of_stopovers,
        CONCAT(IFNULL(a1.local_code, a1.iata_code),
                CHAR(58),
                IFNULL(a2.local_code, a2.iata_code),
                CHAR(58),
                IFNULL(a3.local_code, a3.iata_code),
                CHAR(58),
                IFNULL(a4.local_code, a4.iata_code)) AS route,
        f1.flight_number AS f1_flight_number,
        TIME_FORMAT(TIMEDIFF(f3.arrive_date_time, f1.depart_date_time),
                '%hhr %imn') AS trip_duration,
        TIME_FORMAT(TIMEDIFF(f1.arrive_date_time, f1.depart_date_time),
                '%hhr %imn') AS f1_duration,
        TIME_FORMAT(TIMEDIFF(f2.depart_date_time, f1.arrive_date_time),
                '%hhr %imn') AS stopover1_duration,
        TIME_FORMAT(TIMEDIFF(f2.arrive_date_time, f2.depart_date_time),
                '%hhr %imn') AS f2_duration,
        TIME_FORMAT(TIMEDIFF(f3.depart_date_time, f2.arrive_date_time),
                '%hhr %imn') AS stopover2_duration,
        TIME_FORMAT(TIMEDIFF(f3.arrive_date_time, f3.depart_date_time),
                '%hhr %imn') AS f3_duration,
        f1.flight_cost_coach + f2.flight_cost_coach + f3.flight_cost_coach AS trip_total_cost_coach,
        f1.flight_cost_business + f2.flight_cost_business + f3.flight_cost_business AS trip_total_cost_business,
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
        f1.arrive_airport AS f1_stopover,
        a2.airport_type AS f1_stopover_type,
        a2.airport_name AS f1_stopover_name,
        a2.latitude_deg AS f1_stopover_latitude,
        a2.longitude_deg AS f1_stopover_longitude,
        a2.region_name AS f1_stopover_region,
        a2.local_region AS f1_stopover_local_region,
        a2.municipality AS f1_stopover_municipality,
        a2.iata_code AS f1_stopover_iata,
        a2.local_code AS f1_stopover_local_code,
        f2.arrive_airport AS f2_stopover,
        a3.airport_type AS f2_stopover_type,
        a3.airport_name AS f2_stopover_name,
        a3.latitude_deg AS f2_stopover_latitude,
        a3.longitude_deg AS f2_stopover_longitude,
        a3.region_name AS f2_stopover_region,
        a3.local_region AS f2_stopover_local_region,
        a3.municipality AS f2_stopover_municipality,
        a3.iata_code AS f2_stopover_iata,
        a3.local_code AS f2_stopover_local_code,
        f3.arrive_airport AS f3_destination,
        a4.airport_type AS f3_destination_type,
        a4.airport_name AS f3_destination_name,
        a4.latitude_deg AS f3_destination_latitude,
        a4.longitude_deg AS f3_destination_longitude,
        a4.region_name AS f3_destination_region,
        a4.local_region AS f3_destination_local_region,
        a4.municipality AS f3_destination_municipality,
        a4.iata_code AS f3_destination_iata,
        a4.local_code AS f3_destination_local_code
    FROM
        atr.delta_flights AS f1
            INNER JOIN
        atr.delta_flights AS f2 ON f1.arrive_airport = f2.depart_airport
            INNER JOIN
        atr.delta_flights AS f3 ON f2.arrive_airport = f3.depart_airport
            INNER JOIN
        atr.airports AS a1 ON f1.depart_airport = a1.airport_code
            INNER JOIN
        atr.airports AS a2 ON f1.arrive_airport = a2.airport_code
            INNER JOIN
        atr.airports AS a3 ON f2.arrive_airport = a3.airport_code
            INNER JOIN
        atr.airports AS a4 ON f3.arrive_airport = a4.airport_code
    WHERE
        f1.depart_date_time < f1.arrive_date_time
            AND f2.depart_date_time < f2.arrive_date_time
            AND f3.depart_date_time < f3.arrive_date_time
            AND f1.depart_airport <> f1.arrive_airport
            AND f1.arrive_airport <> f2.arrive_airport
            AND f2.arrive_airport <> f3.arrive_airport
            AND TIMEDIFF(f2.depart_date_time, f1.arrive_date_time) BETWEEN '01:00:00' AND '05:00:00'
            AND TIMEDIFF(f3.depart_date_time, f2.arrive_date_time) BETWEEN '01:00:00' AND '05:00:00';