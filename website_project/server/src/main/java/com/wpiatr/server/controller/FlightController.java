package com.wpiatr.server.controller;

import com.wpiatr.server.model.Flight;
import com.wpiatr.server.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class FlightController {
    private final FlightRepository flightRepository;
    @Autowired
    public FlightController(FlightRepository flightRepository) {
        this.flightRepository= flightRepository;
    }
    @GetMapping("/flights")
    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }
}