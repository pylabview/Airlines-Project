package com.wpiatr.backend.repository;

import com.wpiatr.backend.model.Airport;
import org.springframework.data.jpa.repository.*;

public interface AirportRepository extends JpaRepository<Airport, Integer> {

}