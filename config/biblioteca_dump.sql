-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: Biblioteca
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA IF NOT EXISTS `Biblioteca` DEFAULT CHARACTER SET utf8mb4 ;
USE `Biblioteca` ;

--
-- Table structure for table `Autores`
--

DROP TABLE IF EXISTS `Autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autores` (
  `id_autor` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `biografia` text,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autores`
--

LOCK TABLES `Autores` WRITE;
/*!40000 ALTER TABLE `Autores` DISABLE KEYS */;
INSERT INTO `Autores` VALUES (1,'Gabriel García Márquez','1927-03-06','Colombiana','Escritor colombiano, Premio Nobel de Literatura 1982'),(2,'Isabel Allende','1942-08-02','Chilena','Escritora chilena, una de las novelistas más leídas del mundo'),(3,'Stephen King','1947-09-21','Estadounidense','Maestro del terror y suspense contemporáneo'),(4,'Agatha Christie','1890-09-15','Británica','Escritora británica, reina del misterio'),(5,'Isaac Asimov','1920-01-02','Estadounidense','Escritor de ciencia ficción y divulgador científico'),(6,'Mario Vargas Llosa','1936-03-28','Peruana','Escritor peruano, Premio Nobel de Literatura 2010'),(7,'Carl Sagan','1934-11-09','Estadounidense','Astrónomo y divulgador científico'),(8,'Leonardo da Vinci','1452-04-15','Italiana','Genio del Renacimiento, artista e inventor');
/*!40000 ALTER TABLE `Autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `id_categoria` int NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Ficción','Obras literarias de ficción, novelas y cuentos'),(2,'Misterio','Novelas policiales y de suspenso'),(3,'Ciencia Ficción','Obras de ciencia ficción y fantasía'),(4,'Historia','Libros de historia y biografías históricas'),(5,'Biografías','Biografías de personalidades destacadas'),(6,'Ciencia','Libros científicos y divulgación científica'),(7,'Arte','Libros sobre arte, pintura y cultura');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detalle_Prestamos`
--

DROP TABLE IF EXISTS `Detalle_Prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Detalle_Prestamos` (
  `numero_prestamo` int NOT NULL,
  `isbn` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_prestamo`,`isbn`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `detalle_prestamos_ibfk_1` FOREIGN KEY (`numero_prestamo`) REFERENCES `Prestamos` (`numero_prestamo`) ON DELETE CASCADE,
  CONSTRAINT `detalle_prestamos_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `Libros` (`isbn`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detalle_Prestamos`
--

LOCK TABLES `Detalle_Prestamos` WRITE;
/*!40000 ALTER TABLE `Detalle_Prestamos` DISABLE KEYS */;
INSERT INTO `Detalle_Prestamos` VALUES (2001,'978-0-06-088328-7'),(2005,'978-0-06-112241-5'),(2003,'978-0-06-207350-4'),(2006,'978-0-307-27779-6'),(2005,'978-0-345-33135-0'),(2002,'978-0-385-12167-9'),(2001,'978-0-525-43534-3'),(2003,'978-0-553-29337-0'),(2007,'978-0-553-38326-9'),(2004,'978-84-204-8252-8');
/*!40000 ALTER TABLE `Detalle_Prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `id_empleado` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `cargo` enum('Bibliotecario','Asistente','Administrador') DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (101,'Patricia Álvarez Ruiz','Bibliotecario','2020-03-01',45000.00),(102,'Miguel Torres Gómez','Asistente','2021-07-15',32000.00),(103,'Laura Mendoza Cruz','Administrador','2019-01-10',55000.00),(104,'Diego Ramírez Flores','Bibliotecario','2022-05-20',43000.00),(105,'Sandra López Herrera','Asistente','2023-02-01',30000.00);
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libros`
--

DROP TABLE IF EXISTS `Libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libros` (
  `isbn` varchar(20) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `año_publicacion` year DEFAULT NULL,
  `numero_paginas` int DEFAULT NULL,
  `ejemplares_disponibles` int DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libros`
--

LOCK TABLES `Libros` WRITE;
/*!40000 ALTER TABLE `Libros` DISABLE KEYS */;
INSERT INTO `Libros` VALUES ('978-0-06-088328-7','Cien años de soledad',1967,417,3),('978-0-06-112241-5','Paula',1994,330,3),('978-0-06-207350-4','Asesinato en el Orient Express',1934,256,2),('978-0-307-27779-6','IT (Eso)',1986,1138,1),('978-0-345-33135-0','Cosmos',1980,365,2),('978-0-385-12167-9','El resplandor',1977,447,4),('978-0-525-43534-3','La casa de los espíritus',1982,433,2),('978-0-553-29337-0','Fundación',1951,244,3),('978-0-553-38326-9','Yo, Robot',1950,253,2),('978-84-204-8252-8','La ciudad y los perros',1963,413,2);
/*!40000 ALTER TABLE `Libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libros_Autores`
--

DROP TABLE IF EXISTS `Libros_Autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libros_Autores` (
  `isbn` varchar(20) NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`isbn`,`id_autor`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `libros_autores_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `Libros` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `libros_autores_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `Autores` (`id_autor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libros_Autores`
--

LOCK TABLES `Libros_Autores` WRITE;
/*!40000 ALTER TABLE `Libros_Autores` DISABLE KEYS */;
INSERT INTO `Libros_Autores` VALUES ('978-0-06-088328-7',1),('978-0-06-112241-5',2),('978-0-525-43534-3',2),('978-0-307-27779-6',3),('978-0-385-12167-9',3),('978-0-06-207350-4',4),('978-0-553-29337-0',5),('978-0-553-38326-9',5),('978-84-204-8252-8',6),('978-0-345-33135-0',7);
/*!40000 ALTER TABLE `Libros_Autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libros_Categorias`
--

DROP TABLE IF EXISTS `Libros_Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libros_Categorias` (
  `isbn` varchar(20) NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`isbn`,`id_categoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `libros_categorias_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `Libros` (`isbn`) ON DELETE CASCADE,
  CONSTRAINT `libros_categorias_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libros_Categorias`
--

LOCK TABLES `Libros_Categorias` WRITE;
/*!40000 ALTER TABLE `Libros_Categorias` DISABLE KEYS */;
INSERT INTO `Libros_Categorias` VALUES ('978-0-06-088328-7',1),('978-0-525-43534-3',1),('978-84-204-8252-8',1),('978-0-06-207350-4',2),('978-0-307-27779-6',2),('978-0-385-12167-9',2),('978-0-307-27779-6',3),('978-0-385-12167-9',3),('978-0-553-29337-0',3),('978-0-553-38326-9',3),('978-0-06-112241-5',5),('978-0-345-33135-0',6);
/*!40000 ALTER TABLE `Libros_Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prestamos`
--

DROP TABLE IF EXISTS `Prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prestamos` (
  `numero_prestamo` int NOT NULL,
  `numero_socio` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion_prevista` date NOT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `dias_retraso` int DEFAULT NULL,
  PRIMARY KEY (`numero_prestamo`),
  KEY `numero_socio` (`numero_socio`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`numero_socio`) REFERENCES `Socios` (`numero_socio`),
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `Empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prestamos`
--

LOCK TABLES `Prestamos` WRITE;
/*!40000 ALTER TABLE `Prestamos` DISABLE KEYS */;
INSERT INTO `Prestamos` VALUES (2001,1001,101,'2024-05-01','2024-05-16','2024-05-15',0),(2002,1002,102,'2024-05-03','2024-05-18',NULL,NULL),(2003,1003,101,'2024-05-05','2024-05-20','2024-05-22',2),(2004,1001,103,'2024-05-10','2024-05-25',NULL,NULL),(2005,1004,104,'2024-05-12','2024-05-27','2024-05-26',0),(2006,1006,102,'2024-05-15','2024-05-30',NULL,NULL),(2007,1002,105,'2024-05-20','2024-06-04','2024-06-07',3);
/*!40000 ALTER TABLE `Prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socios`
--

DROP TABLE IF EXISTS `Socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socios` (
  `numero_socio` int NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`numero_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socios`
--

LOCK TABLES `Socios` WRITE;
/*!40000 ALTER TABLE `Socios` DISABLE KEYS */;
INSERT INTO `Socios` VALUES (1001,'María González Pérez','Av. Libertador 1234, Montevideo','099123456','maria.gonzalez@email.com','2023-01-15','Activo'),(1002,'Carlos Rodríguez López','Calle 18 de Julio 567, Montevideo','098765432','carlos.rodriguez@email.com','2023-02-20','Activo'),(1003,'Ana Martínez Silva','Bvar. Artigas 890, Montevideo','097111222','ana.martinez@email.com','2022-11-10','Activo'),(1004,'Luis Fernández Castro','Av. Italia 2345, Montevideo','096333444','luis.fernandez@email.com','2023-03-05','Activo'),(1005,'Carmen Díaz Morales','Calle Colonia 678, Montevideo','095555666','carmen.diaz@email.com','2022-08-22','Inactivo'),(1006,'Roberto Sánchez Vega','Av. Brasil 1567, Montevideo','094777888','roberto.sanchez@email.com','2023-04-12','Activo');
/*!40000 ALTER TABLE `Socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 15:41:07
