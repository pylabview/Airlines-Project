package com.wpiatr.server.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "delta_direct_flights")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;
    @Column(name = "flight_type")
    private String flightType;
    @Column(name = "route")
    private String route;
    @Column(name = "f1_flight_number")
    private String flightNumber;
    @Column(name = "trip_duration")
    private String tripDuration;
    @Column(name = "trip_total_cost_coach")
    private BigDecimal tripTotalCostCoach;
    @Column(name = "trip_total_cost_business")
    private BigDecimal getTripTotalCostBusiness;
    @Column(name = "f1_departure")
    private LocalDateTime departure;
    @Column(name = "f1_arrival")
    private LocalDateTime arrival;
    @Column(name = "f1_origin")
    private String origin;
    @Column(name = "f1_origin_type")
    private String originType;
    @Column(name = "f1_origin_name")
    private String originName;
    @Column(name = "f1_origin_latitude")
    private String originLatitude;
    @Column(name = "f1_origin_longitude")
    private String originLongitude;
    @Column(name = "f1_origin_region")
    private String originRegion;
    @Column(name = "f1_origin_local_region")
    private String originLocalRegion;
    @Column(name = "f1_origin_municipality")
    private String originMunicipality;
    @Column(name = "f1_origin_iata")
    private String originIATA;
    @Column(name = "f1_origin_local_code")
    private String originLocalCode;
    @Column(name = "f1_destination")
    private String destination;
    @Column(name = "f1_destination_type")
    private String destinationType;
    @Column(name = "f1_destination_name")
    private String destinationName;
    @Column(name = "f1_destination_latitude")
    private String destinationLatitude;
    @Column(name = "f1_destination_longitude")
    private String destinationLongitude;
    @Column(name = "f1_destination_region")
    private String destinationRegion;
    @Column(name = "f1_destination_local_region")
    private String destinationLocalRegion;
    @Column(name = "f1_destination_municipality")
    private String destinationMunicipality;
    @Column(name = "f1_destination_iata")
    private String destinationIATA;
    @Column(name = "f1_destination_local_code")
    private String destinationLocalCode;
    public Integer getF1_id() {
        return id;
    }
    public String getFlightType() {
        return flightType;
    }
    public String getRoute() {
        return route;
    }
    public String getFlightNumber() {
        return flightNumber;
    }
    public String getTripDuration() {
        return tripDuration;
    }
    public BigDecimal getTripTotalCostCoach() {
        return tripTotalCostCoach;
    }
    public BigDecimal getGetTripTotalCostBusiness() {
        return getTripTotalCostBusiness;
    }
    public LocalDateTime getDeparture() {
        return departure;
    }
    public LocalDateTime getArrival() {
        return arrival;
    }
    public String getOrigin() {
        return origin;
    }
    public String getOriginType() {
        return originType;
    }
    public String getOriginName() {
        return originName;
    }
    public String getOriginLatitude() {
        return originLatitude;
    }
    public String getOriginLongitude() {
        return originLongitude;
    }
    public String getOriginRegion() {
        return originRegion;
    }
    public String getOriginLocalRegion() {
        return originLocalRegion;
    }
    public String getOriginMunicipality() {
        return originMunicipality;
    }
    public String getOriginIATA() {
        return originIATA;
    }
    public String getOriginLocalCode() {
        return originLocalCode;
    }
    public String getDestination() {
        return destination;
    }
    public String getDestinationType() {
        return destinationType;
    }
    public String getDestinationName() {
        return destinationName;
    }
    public String getDestinationLatitude() {
        return destinationLatitude;
    }
    public String getDestinationLongitude() {
        return destinationLongitude;
    }
    public String getDestinationRegion() {
        return destinationRegion;
    }
    public String getDestinationLocalRegion() {
        return destinationLocalRegion;
    }
    public String getDestinationMunicipality() {
        return destinationMunicipality;
    }
    public String getDestinationIATA() {
        return destinationIATA;
    }
    public String getDestinationLocalCode() {
        return destinationLocalCode;
    }
}