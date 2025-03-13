-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo` DEFAULT CHARACTER SET utf8 ;
USE `zoo` ;

-- -----------------------------------------------------
-- Table `zoo`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species` (
  `idspecies` INT NOT NULL,
  `name_sci` VARCHAR(45) NOT NULL,
  `name_co` VARCHAR(45) NOT NULL,
  `familly` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idspecies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo`.`zoo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`zoo` (
  `idzoo` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idzoo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo`.`animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`animals` (
  `idAnimals` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `date_of_birt` DATE NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `species_idspecies` INT NOT NULL,
  `zoo_idzoo` INT NOT NULL,
  PRIMARY KEY (`idAnimals`),
  INDEX `fk_animals_species_idx` (`species_idspecies` ASC) VISIBLE,
  INDEX `fk_animals_zoo1_idx` (`zoo_idzoo` ASC) VISIBLE,
  CONSTRAINT `fk_animals_species`
    FOREIGN KEY (`species_idspecies`)
    REFERENCES `zoo`.`species` (`idspecies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animals_zoo1`
    FOREIGN KEY (`zoo_idzoo`)
    REFERENCES `zoo`.`zoo` (`idzoo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo`.`zookeeper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`zookeeper` (
  `idzookeeper` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`idzookeeper`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo`.`enclosures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`enclosures` (
  `idenclosures` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `size_sqm` INT NOT NULL,
  `habitat_typ` VARCHAR(45) NOT NULL,
  `zookeeper_idzookeeper` INT NOT NULL,
  `animals_idAnimals` INT NOT NULL,
  PRIMARY KEY (`idenclosures`),
  INDEX `fk_enclosures_zookeeper1_idx` (`zookeeper_idzookeeper` ASC) VISIBLE,
  INDEX `fk_enclosures_animals1_idx` (`animals_idAnimals` ASC) VISIBLE,
  CONSTRAINT `fk_enclosures_zookeeper1`
    FOREIGN KEY (`zookeeper_idzookeeper`)
    REFERENCES `zoo`.`zookeeper` (`idzookeeper`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enclosures_animals1`
    FOREIGN KEY (`animals_idAnimals`)
    REFERENCES `zoo`.`animals` (`idAnimals`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
