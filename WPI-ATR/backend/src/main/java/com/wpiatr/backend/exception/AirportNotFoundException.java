package com.wpiatr.backend.exception;

public class AirportNotFoundException extends RuntimeException {
    public AirportNotFoundException(Integer id_airport){
        super("Could not find airport id: " + id_airport);
    }
}