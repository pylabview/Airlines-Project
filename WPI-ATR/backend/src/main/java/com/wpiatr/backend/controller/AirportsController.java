package com.wpiatr.backend.controller;
import com.wpiatr.backend.model.Airports;
import com.wpiatr.backend.repository.AirportsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class AirportsController {
    @Autowired
    AirportsRepository airportsRepository;
    @GetMapping("/airport_listing")
    List<Airports> getAllAirports(){
        return airportsRepository.findAll();
    }
}