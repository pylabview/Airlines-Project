-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema atr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `atr` ;

-- -----------------------------------------------------
-- Table `atr`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`reservations` (
  `id_reservation` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reservation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atr`.`airports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`airports` (
  `id_airport` INT NOT NULL AUTO_INCREMENT,
  `id_reservation` INT NOT NULL,
  `airport_code` VARCHAR(255) NULL,
  `airport_type` VARCHAR(45) NULL,
  `airport_name` VARCHAR(45) NULL,
  `latitude_deg` VARCHAR(45) NULL,
  `longitude_deg` VARCHAR(45) NULL,
  `region_name` VARCHAR(45) NULL,
  `local_region` VARCHAR(45) NULL,
  `municipality` VARCHAR(45) NULL,
  `iata_code` VARCHAR(45) NULL,
  `local_code` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airport`),
  INDEX `fk_airports_reservations1_idx` (`id_reservation` ASC) VISIBLE,
  CONSTRAINT `fk_airports_reservations1`
    FOREIGN KEY (`id_reservation`)
    REFERENCES `atr`.`reservations` (`id_reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atr`.`delta_flitghts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`delta_flitghts` (
  `Id_delta_flight` INT NOT NULL AUTO_INCREMENT,
  `id_airport` INT NOT NULL,
  `arrive_date_time` DATETIME NOT NULL,
  `depart_date_time` DATETIME NOT NULL,
  `arrive_airport` VARCHAR(255) NOT NULL,
  `depart_airport` VARCHAR(255) NOT NULL,
  `flight_number` VARCHAR(255) NOT NULL,
  `flight_cost_coach` DECIMAL(4,2) NULL,
  `flight_cost_business` DECIMAL(4,2) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_delta_flight`),
  INDEX `fk_delta_flitghts_airports_idx` (`id_airport` ASC) VISIBLE,
  CONSTRAINT `fk_delta_flitghts_airports`
    FOREIGN KEY (`id_airport`)
    REFERENCES `atr`.`airports` (`id_airport`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15975
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atr`.`southwest_flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`southwest_flights` (
  `Id_southwest_flight` INT NOT NULL AUTO_INCREMENT,
  `id_airport` INT NOT NULL,
  `depart_date_time` DATETIME NOT NULL,
  `arrive_date_time` DATETIME NOT NULL,
  `depart_airport` VARCHAR(255) NOT NULL,
  `arrive_airport` VARCHAR(255) NOT NULL,
  `flight_number` VARCHAR(255) NOT NULL,
  `flight_cost_coach` DECIMAL(4,2) NULL,
  `flight_cost_business` DECIMAL(4,2) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_southwest_flight`),
  INDEX `fk_southwest_flights_airports1_idx` (`id_airport` ASC) VISIBLE,
  CONSTRAINT `fk_southwest_flights_airports1`
    FOREIGN KEY (`id_airport`)
    REFERENCES `atr`.`airports` (`id_airport`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 30915
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atr`.`airplane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`airplane` (
  `id_airplane` INT NOT NULL AUTO_INCREMENT,
  `Id_southwest_flight` INT NOT NULL,
  `Id_delta_flight` INT NOT NULL,
  `plane_model` VARCHAR(45) NULL,
  `plane_capacity` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airplane`, `Id_southwest_flight`, `Id_delta_flight`),
  INDEX `fk_airplane_southwest_flights1_idx` (`Id_southwest_flight` ASC) VISIBLE,
  INDEX `fk_airplane_delta_flitghts1_idx` (`Id_delta_flight` ASC) VISIBLE,
  CONSTRAINT `fk_airplane_southwest_flights1`
    FOREIGN KEY (`Id_southwest_flight`)
    REFERENCES `atr`.`southwest_flights` (`Id_southwest_flight`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_airplane_delta_flitghts1`
    FOREIGN KEY (`Id_delta_flight`)
    REFERENCES `atr`.`delta_flitghts` (`Id_delta_flight`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atr`.`airplane_seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atr`.`airplane_seats` (
  `id_airplane_seat` INT NOT NULL AUTO_INCREMENT,
  `id_airplane` INT NOT NULL,
  `class` VARCHAR(45) NULL,
  `row_number` VARCHAR(45) NULL,
  `seat_number` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `upadted_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airplane_seat`),
  INDEX `fk_airplane_seats_airplane1_idx` (`id_airplane` ASC) VISIBLE,
  CONSTRAINT `fk_airplane_seats_airplane1`
    FOREIGN KEY (`id_airplane`)
    REFERENCES `atr`.`airplane` (`id_airplane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
