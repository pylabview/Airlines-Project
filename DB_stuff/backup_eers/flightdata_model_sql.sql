CREATE TABLE IF NOT EXISTS `flightdata`.`airports` (
  `name` VARCHAR(255) NOT NULL,
  `longitude` VARCHAR(25) NOT NULL,
  `latitude` VARCHAR(25) NOT NULL,
  INDEX `name` (`name` ASC) VISIBLE,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `flightdata`.`deltas` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `DepartDateTime` DATETIME NOT NULL,
  `ArriveDateTime` DATETIME NOT NULL,
  `DepartAirport` VARCHAR(255) NOT NULL,
  `ArriveAirport` VARCHAR(255) NOT NULL,
  `FlightNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `airportNames` (`DepartAirport` ASC, `ArriveAirport` ASC) VISIBLE,
  INDEX `FlightNumber_idx` (`FlightNumber` ASC) VISIBLE,
  CONSTRAINT `airportNames`
    FOREIGN KEY (`DepartAirport` , `ArriveAirport`)
    REFERENCES `flightdata`.`airports` (`name` , `name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FlightNumber`
    FOREIGN KEY (`FlightNumber`)
    REFERENCES `flightdata`.`flight_information` (`FlightNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15975
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `flightdata`.`flight_information` (
  `FlightNumber` VARCHAR(255) NOT NULL,
  `Pricing` INT NOT NULL,
  `SeatType` VARCHAR(255) NOT NULL,
  `DepartAirport` VARCHAR(255) NOT NULL,
  `ArriveAirport` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`FlightNumber`))
ENGINE = InnoDB
AUTO_INCREMENT = 30915
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `flightdata`.`reservations` (
  `reservationId` INT NOT NULL,
  `DepartAirport` VARCHAR(255) NULL,
  `ArriveAirport` VARCHAR(255) NULL,
  `flight_information_FlightNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`reservationId`),
  INDEX `fk_reservations_flight_information1_idx` (`flight_information_FlightNumber` ASC) VISIBLE,
  CONSTRAINT `fk_reservations_flight_information1`
    FOREIGN KEY (`flight_information_FlightNumber`)
    REFERENCES `flightdata`.`flight_information` (`FlightNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `flightdata`.`reservations` (
  `reservationId` INT NOT NULL,
  `DepartAirport` VARCHAR(255) NULL,
  `ArriveAirport` VARCHAR(255) NULL,
  `flight_information_FlightNumber` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`reservationId`),
  INDEX `fk_reservations_flight_information1_idx` (`flight_information_FlightNumber` ASC) VISIBLE,
  CONSTRAINT `fk_reservations_flight_information1`
    FOREIGN KEY (`flight_information_FlightNumber`)
    REFERENCES `flightdata`.`flight_information` (`FlightNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `flightdata`.`Traveler` (
  `TravelerId` INT NOT NULL AUTO_INCREMENT,
  `uniqueIdentifier` VARCHAR(45) NULL,
  `reservations_reservationId` INT NOT NULL,
  PRIMARY KEY (`TravelerId`),
  INDEX `fk_Traveler_reservations1_idx` (`reservations_reservationId` ASC) VISIBLE,
  CONSTRAINT `fk_Traveler_reservations1`
    FOREIGN KEY (`reservations_reservationId`)
    REFERENCES `flightdata`.`reservations` (`reservationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;