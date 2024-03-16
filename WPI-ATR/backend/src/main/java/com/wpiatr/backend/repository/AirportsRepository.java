package com.wpiatr.backend.repository;
import com.wpiatr.backend.model.Airports;
import org.springframework.data.jpa.repository.JpaRepository;
public interface AirportsRepository extends JpaRepository<Airports, Integer> {
}