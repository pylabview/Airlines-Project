package com.wpiatr.backend.controller;

import com.wpiatr.backend.model.Airport;
import com.wpiatr.backend.repository.AirportRepository;
import com.wpiatr.backend.exception.AirportNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class AirportController {
    @Autowired
    AirportRepository airportRepository;
    @GetMapping("/airports")
    List<Airport> getAllAirports(){
        return airportRepository.findAll();
    }
    @GetMapping("/airport/{id_airport}")
    Airport getAirportById(@PathVariable Integer id_airport) {
        return airportRepository.findById(id_airport)
                .orElseThrow(()-> new AirportNotFoundException(id_airport));
    }
}