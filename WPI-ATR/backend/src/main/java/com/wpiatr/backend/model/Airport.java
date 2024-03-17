package com.wpiatr.backend.model;

import jakarta.persistence.*;

@Entity
@Table(name = "airports")
public class Airport {
    @Id
    @GeneratedValue
    private Integer id_airport;
    @Column(name ="airport_code")
    private String airport_code;
    @Column(name="airport_type")
    private String airport_type;
    @Column(name="airport_name")
    private String airport_name;
    @Column(name="latitude_deg")
    private String latitude_deg;
    @Column(name="longitude_deg")
    private String longitude_deg;
    @Column(name="region_name")
    private String region_name;
    @Column(name="local_region")
    private String local_region;
    @Column(name="municipality")
    private String municipality;
    @Column(name="iata_code")
    private String iata_code;
    @Column(name="local_code")
    private String local_code;
    
    public Airport() {

    }
    public Airport(String airport_code, String airport_name, String latitude_deg, String longitude_deg) {
        this.airport_code = airport_code;
        this.airport_name = airport_name;
        this.latitude_deg = latitude_deg;
        this.longitude_deg = longitude_deg;
    }
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
    public String getIATA_code() {
        return iata_code;
    }
    public String getLocal_code() {
        return local_code;
    }

    @Override
    public String toString() {
        return "Airport [airport_code = " + airport_code + ", airport_name = " + airport_name
                + ", latitude_deg = " + latitude_deg + ", longitude_deg = " + longitude_deg + "]";
    }
}