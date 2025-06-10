-- MySQL Workbench Forward Engineering

DROP DATABASE IF EXISTS `Biblioteca`;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8mb4 ;
USE `Biblioteca` ;

-- -----------------------------------------------------
-- Table `Biblioteca`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Autores` (
  `id_autor` INT NOT NULL,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(50) NULL DEFAULT NULL,
  `biografia` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Categorias` (
  `id_categoria` INT NOT NULL,
  `nombre_categoria` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Socios` (
  `numero_socio` INT NOT NULL,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_inscripcion` DATE NULL DEFAULT NULL,
  `estado` ENUM('Activo', 'Inactivo') NOT NULL,
  PRIMARY KEY (`numero_socio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Empleados` (
  `id_empleado` INT NOT NULL,
  `nombre_completo` VARCHAR(100) NOT NULL,
  `cargo` ENUM('Bibliotecario', 'Asistente', 'Administrador') NULL DEFAULT NULL,
  `fecha_contratacion` DATE NULL DEFAULT NULL,
  `salario` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Prestamos` (
  `numero_prestamo` INT NOT NULL,
  `numero_socio` INT NULL DEFAULT NULL,
  `id_empleado` INT NULL DEFAULT NULL,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_devolucion_prevista` DATE NOT NULL,
  `fecha_devolucion_real` DATE NULL DEFAULT NULL,
  `dias_retraso` INT NULL DEFAULT NULL,
  PRIMARY KEY (`numero_prestamo`),
  INDEX `numero_socio` (`numero_socio` ASC) VISIBLE,
  INDEX `id_empleado` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `prestamos_ibfk_1`
    FOREIGN KEY (`numero_socio`)
    REFERENCES `Biblioteca`.`Socios` (`numero_socio`),
  CONSTRAINT `prestamos_ibfk_2`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `Biblioteca`.`Empleados` (`id_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libros` (
  `isbn` VARCHAR(20) NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `año_publicacion` YEAR NULL DEFAULT NULL,
  `numero_paginas` INT NULL DEFAULT NULL,
  `ejemplares_disponibles` INT NULL DEFAULT NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Detalle_Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Detalle_Prestamos` (
  `numero_prestamo` INT NOT NULL,
  `isbn` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`numero_prestamo`, `isbn`),
  INDEX `isbn` (`isbn` ASC) VISIBLE,
  CONSTRAINT `detalle_prestamos_ibfk_1`
    FOREIGN KEY (`numero_prestamo`)
    REFERENCES `Biblioteca`.`Prestamos` (`numero_prestamo`)
    ON DELETE CASCADE,
  CONSTRAINT `detalle_prestamos_ibfk_2`
    FOREIGN KEY (`isbn`)
    REFERENCES `Biblioteca`.`Libros` (`isbn`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libros_Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libros_Autores` (
  `isbn` VARCHAR(20) NOT NULL,
  `id_autor` INT NOT NULL,
  PRIMARY KEY (`isbn`, `id_autor`),
  INDEX `id_autor` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `libros_autores_ibfk_1`
    FOREIGN KEY (`isbn`)
    REFERENCES `Biblioteca`.`Libros` (`isbn`)
    ON DELETE CASCADE,
  CONSTRAINT `libros_autores_ibfk_2`
    FOREIGN KEY (`id_autor`)
    REFERENCES `Biblioteca`.`Autores` (`id_autor`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Biblioteca`.`Libros_Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Biblioteca`.`Libros_Categorias` (
  `isbn` VARCHAR(20) NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`isbn`, `id_categoria`),
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `libros_categorias_ibfk_1`
    FOREIGN KEY (`isbn`)
    REFERENCES `Biblioteca`.`Libros` (`isbn`)
    ON DELETE CASCADE,
  CONSTRAINT `libros_categorias_ibfk_2`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `Biblioteca`.`Categorias` (`id_categoria`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;