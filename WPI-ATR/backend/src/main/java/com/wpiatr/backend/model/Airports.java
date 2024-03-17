package com.wpiatr.backend.model;
import jakarta.persistence.*;
import java.math.*;
import java.util.*;
@Entity
@Table(name = "airports")
@SecondaryTables({
        @SecondaryTable(name = "delta_flights", pkJoinColumns = @PrimaryKeyJoinColumn(name = "Id_delta_flight")),
        @SecondaryTable(name = "southwest_flights", pkJoinColumns = @PrimaryKeyJoinColumn(name = "Id_southwest_flight"))
})
public class Airports {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id_airport;
    @Column(name ="airport_code")
    private String airport_code;
    @Column(name ="airport_type")
    private String airport_type;
    @Column(name ="airport_name")
    private String airport_name;
    @Column(name ="latitude_deg")
    private String latitude_deg;
    @Column(name ="longitude_deg")
    private String longitude_deg;
    @Column(name ="region_name")
    private String region_name;
    @Column(name ="local_region")
    private String local_region;
    @Column(name ="municipality")
    private String municipality;
    @Column(name ="iata_code")
    private String iata_code;
    @Column(name ="local_code")
    private String local_code;
    @Column(name = "depart_date_time", table = "delta_flights")
    private Date delta_flights_depart_date_time;
    @Column(name = "arrive_date_time", table = "delta_flights")
    private Date delta_flights_arrive_date_time;
    @Column(name = "arrive_airport", table = "delta_flights")
    private String delta_flights_arrive_airport;
    @Column(name = "flight_number", table = "delta_flights")
    private String delta_flights_flight_number;
    @Column(name = "flight_cost_coach", table = "delta_flights")
    private BigDecimal delta_flights_flight_cost_coach;
    @Column(name = "flight_cost_business", table = "delta_flights")
    private BigDecimal delta_flights_flight_cost_business;
    @Column(name = "depart_date_time", table = "southwest_flights")
    private Date southwest_flights_depart_date_time;
    @Column(name = "arrive_date_time", table = "southwest_flights")
    private Date southwest_flights_arrive_date_time;
    @Column(name = "arrive_airport", table = "southwest_flights")
    private String southwest_flights_arrive_airport;
    @Column(name = "flight_number", table = "southwest_flights")
    private String southwest_flights_flight_number;
    @Column(name = "flight_cost_coach", table = "southwest_flights")
    private BigDecimal southwest_flights_flight_cost_coach;
    @Column(name = "flight_cost_business", table = "southwest_flights")
    private BigDecimal southwest_flights_flight_cost_business;
    public Integer getId_airport() {
        return id_airport;
    }
    public String getAirport_code() {
        return airport_code;
    }
    public String getAirport_type() {
        return airport_type;
    }
    public String getAirport_name() {
        return airport_name;
    }
    public String getLatitude_deg() {
        return latitude_deg;
    }
    public String getLongitude_deg() {
        return longitude_deg;
    }
    public String getRegion_name() {
        return region_name;
    }
    public String getLocal_region() {
        return local_region;
    }
    public String getMunicipality() {
        return municipality;
    }
    public String getIata_code() {
        return iata_code;
    }
    public String getLocal_code() {
        return local_code;
    }
    public Date getDelta_flights_depart_date_time() {
        return delta_flights_depart_date_time;
    }
    public Date getDelta_flights_arrive_date_time() {
        return delta_flights_arrive_date_time;
    }
    public String getDelta_flights_arrive_airport() {
        return delta_flights_arrive_airport;
    }
    public String getDelta_flights_flight_number() {
        return delta_flights_flight_number;
    }
    public BigDecimal getDelta_flights_flight_cost_coach() {
        return delta_flights_flight_cost_coach;
    }
    public BigDecimal getDelta_flights_flight_cost_business() {
        return delta_flights_flight_cost_business;
    }
    public Date getSouthwest_flights_depart_date_time() {
        return southwest_flights_depart_date_time;
    }
    public Date getSouthwest_flights_arrive_date_time() {
        return southwest_flights_arrive_date_time;
    }
    public String getSouthwest_flights_arrive_airport() {
        return southwest_flights_arrive_airport;
    }
    public String getSouthwest_flights_flight_number() {
        return southwest_flights_flight_number;
    }
    public BigDecimal getSouthwest_flights_flight_cost_coach() {
        return southwest_flights_flight_cost_coach;
    }
    public BigDecimal getSouthwest_flights_flight_cost_business() {
        return southwest_flights_flight_cost_business;
    }
}
