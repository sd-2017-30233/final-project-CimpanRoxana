-- MySQL Script generated by MySQL Workbench
-- Wed May 31 17:01:17 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema home
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `home` ;

-- -----------------------------------------------------
-- Schema home
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `home` DEFAULT CHARACTER SET utf8 ;
USE `home` ;

-- -----------------------------------------------------
-- Table `home`.`utilizator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`utilizator` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` TINYTEXT NULL DEFAULT NULL,
  `parola` TINYTEXT NULL DEFAULT NULL,
  `tip` TINYINT(1) NULL DEFAULT NULL,
  `prenume` TINYTEXT NULL DEFAULT NULL,
  `nume` TINYTEXT NULL DEFAULT NULL,
  `adresa` CHAR(50) NULL DEFAULT NULL,
  `dataNastere` DATE NULL DEFAULT NULL,
  `telefon` INT(11) NULL DEFAULT NULL,
  `email` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `home`.`actiuni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`actiuni` (
  `idActiune` INT(11) NOT NULL AUTO_INCREMENT,
  `idClient` INT(11) NULL DEFAULT NULL,
  `adaugaRezervare` INT(11) NULL DEFAULT NULL,
  `updateRezervare` INT(11) NULL DEFAULT NULL,
  `vizualizeazaRezervare` INT(11) NULL DEFAULT NULL,
  `dataRezervare` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idActiune`),
  INDEX `idCustomer` (`idClient` ASC),
  CONSTRAINT `activity_ibfk_1`
    FOREIGN KEY (`idClient`)
    REFERENCES `home`.`utilizator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `home`.`casuta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`casuta` (
  `idCasuta` INT(11) NOT NULL,
  `nrCasuta` INT(11) NULL DEFAULT NULL,
  `zona` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCasuta`),
  UNIQUE INDEX `idRoom_UNIQUE` (`idCasuta` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `home`.`comentariu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`comentariu` (
  `idComentariu` INT(11) NOT NULL AUTO_INCREMENT,
  `com` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idComentariu`),
  UNIQUE INDEX `idComment_UNIQUE` (`idComentariu` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `home`.`fotografii`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`fotografii` (
  `idFotografii` INT(11) NOT NULL AUTO_INCREMENT,
  `fotografie` LONGBLOB NOT NULL,
  PRIMARY KEY (`idFotografii`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `home`.`rezervare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `home`.`rezervare` (
  `idRezervare` INT(11) NOT NULL,
  `idClient` INT(11) NOT NULL,
  `idCasuta` INT(11) NOT NULL,
  `sosire` DATE NOT NULL,
  `plecare` DATE NOT NULL,
  PRIMARY KEY (`idRezervare`),
  INDEX `idClient_idx` (`idClient` ASC),
  INDEX `idCasuta_idx` (`idCasuta` ASC),
  CONSTRAINT `idCasuta`
    FOREIGN KEY (`idCasuta`)
    REFERENCES `home`.`casuta` (`idCasuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idClient`
    FOREIGN KEY (`idClient`)
    REFERENCES `home`.`utilizator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
