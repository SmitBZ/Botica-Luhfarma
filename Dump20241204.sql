CREATE DATABASE  IF NOT EXISTS `db_luhfarma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_luhfarma`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: db_luhfarma
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_almacen`
--

DROP TABLE IF EXISTS `tb_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_almacen` (
  `idAlmacen` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `capacidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_almacen`
--

LOCK TABLES `tb_almacen` WRITE;
/*!40000 ALTER TABLE `tb_almacen` DISABLE KEYS */;
INSERT INTO `tb_almacen` VALUES (1,'Almacen 2','Almcen del piso 2','500'),(2,'Almacen 3','Hola','1509'),(3,'Almacen 5','mxkdmxkwx','2506'),(11,'efds','sa','78');
/*!40000 ALTER TABLE `tb_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Antibioticos','Aqui van solo pastillas'),(2,'suplementos','jsjsjs'),(3,'vitaminas','Vitminas a y b'),(4,'Jarabes','Jarabae de palo'),(5,'Cuidado Personal','Cuidado'),(6,'Higiene Personal','Dientes, cara'),(7,'Salud Sexual','Condones y ya');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idCliente`,`idUsuario`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (0,'local','local','local','local','local','local',0);
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_detalle`
--

DROP TABLE IF EXISTS `tb_cliente_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente_detalle` (
  `idClienteDetalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `preciuni` decimal(10,2) NOT NULL,
  `precittal` decimal(10,2) NOT NULL,
  `idCompra` int NOT NULL,
  `idCategoria` int NOT NULL,
  `idPresentacion` int NOT NULL,
  PRIMARY KEY (`idClienteDetalle`,`idCategoria`,`idPresentacion`,`idCompra`),
  KEY `idCompra_idx` (`idCompra`),
  KEY `idCategoria_idx` (`idCategoria`),
  KEY `idPresentacion_idx` (`idPresentacion`),
  CONSTRAINT `fk_tb_cliente_detalle_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tb_categoria` (`idCategoria`),
  CONSTRAINT `fk_tb_cliente_detalle_idCompra` FOREIGN KEY (`idCompra`) REFERENCES `tb_compra` (`idCompra`),
  CONSTRAINT `fk_tb_cliente_detalle_idPresentacion` FOREIGN KEY (`idPresentacion`) REFERENCES `tb_presentacion` (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_detalle`
--

LOCK TABLES `tb_cliente_detalle` WRITE;
/*!40000 ALTER TABLE `tb_cliente_detalle` DISABLE KEYS */;
INSERT INTO `tb_cliente_detalle` VALUES (1,2,1.20,2.40,3,2,2),(2,4,1.00,4.00,4,2,3),(3,3,1.20,3.60,5,2,3),(4,10,15.00,150.00,6,2,1),(5,3,1.40,4.20,7,2,2),(6,25,0.70,17.50,8,2,2),(7,2,0.70,1.40,9,2,2),(8,4,1.00,4.00,10,2,3),(9,4,1.00,4.00,11,2,3),(10,4,1.00,4.00,12,2,3),(11,4,1.00,4.00,13,2,3),(12,4,1.00,4.00,14,2,3),(13,15,15.82,237.30,15,2,3);
/*!40000 ALTER TABLE `tb_cliente_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_compra`
--

DROP TABLE IF EXISTS `tb_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_compra` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `comprobante` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(25) NOT NULL,
  `idCliente` int NOT NULL,
  `idModalidad` int NOT NULL,
  PRIMARY KEY (`idCompra`,`idModalidad`,`idCliente`),
  KEY `idCliente_idx` (`idCliente`),
  KEY `idModalidad_idx` (`idModalidad`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `tb_cliente` (`idCliente`),
  CONSTRAINT `idModalidad` FOREIGN KEY (`idModalidad`) REFERENCES `tb_modalidad` (`idModalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compra`
--

LOCK TABLES `tb_compra` WRITE;
/*!40000 ALTER TABLE `tb_compra` DISABLE KEYS */;
INSERT INTO `tb_compra` VALUES (3,'Venta-edr5t','Factura','2024-11-27','Confirmada',0,2),(4,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(5,'Venta-cexx','Factura','2024-11-27','Confirmada',0,2),(6,'Venta-Holaxd456','Factura','2024-11-27','Confirmada',0,1),(7,'Venta-edry5t','Factura','2024-11-27','Confirmada',0,1),(8,'Venta-dedr','Factura','2024-11-27','Confirmada',0,1),(9,'Venta-dedr','Factura','2024-11-27','Confirmada',0,1),(10,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(11,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(12,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(13,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(14,'Venta-dew','Factura','2024-11-27','Confirmada',0,1),(15,'Venta-14652','Factura','2024-12-01','Confirmada',0,1);
/*!40000 ALTER TABLE `tb_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contador`
--

DROP TABLE IF EXISTS `tb_contador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_contador` (
  `idContador` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idContador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contador`
--

LOCK TABLES `tb_contador` WRITE;
/*!40000 ALTER TABLE `tb_contador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_contador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventario`
--

DROP TABLE IF EXISTS `tb_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_inventario` (
  `idInventario` int NOT NULL AUTO_INCREMENT,
  `cant_existente` int NOT NULL,
  `stock` int NOT NULL,
  `idAlmacen` int NOT NULL,
  `idProducto` int NOT NULL,
  PRIMARY KEY (`idInventario`,`idAlmacen`,`idProducto`),
  KEY `idAlmacen_idx` (`idAlmacen`),
  KEY `idProducto_idx` (`idProducto`),
  CONSTRAINT `fk_tb_inventario_idAlmacen` FOREIGN KEY (`idAlmacen`) REFERENCES `tb_almacen` (`idAlmacen`),
  CONSTRAINT `fk_tb_inventario_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `tb_producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventario`
--

LOCK TABLES `tb_inventario` WRITE;
/*!40000 ALTER TABLE `tb_inventario` DISABLE KEYS */;
INSERT INTO `tb_inventario` VALUES (1,25,21,2,7);
/*!40000 ALTER TABLE `tb_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_modalidad`
--

DROP TABLE IF EXISTS `tb_modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_modalidad` (
  `idModalidad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idModalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_modalidad`
--

LOCK TABLES `tb_modalidad` WRITE;
/*!40000 ALTER TABLE `tb_modalidad` DISABLE KEYS */;
INSERT INTO `tb_modalidad` VALUES (1,'Presencial'),(2,'Linea');
/*!40000 ALTER TABLE `tb_modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_presentacion`
--

DROP TABLE IF EXISTS `tb_presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_presentacion` (
  `idPresentacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_presentacion`
--

LOCK TABLES `tb_presentacion` WRITE;
/*!40000 ALTER TABLE `tb_presentacion` DISABLE KEYS */;
INSERT INTO `tb_presentacion` VALUES (1,'Tabletas',''),(2,'Frascos',''),(3,'Pastillas',''),(4,'Flister','Hola');
/*!40000 ALTER TABLE `tb_presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producto`
--

DROP TABLE IF EXISTS `tb_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` text NOT NULL,
  `fechaprodu` date NOT NULL,
  `fechacadu` date NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `idAlmacen` int NOT NULL,
  `idCategoria` int NOT NULL,
  `idPresentacion` int NOT NULL,
  PRIMARY KEY (`idProducto`,`idAlmacen`,`idCategoria`,`idPresentacion`),
  KEY `idAlmacen_idx` (`idAlmacen`),
  KEY `idCategoria_idx` (`idCategoria`),
  KEY `idPresentacion_idx` (`idPresentacion`),
  CONSTRAINT `idAlmacen` FOREIGN KEY (`idAlmacen`) REFERENCES `tb_almacen` (`idAlmacen`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `tb_categoria` (`idCategoria`),
  CONSTRAINT `idPresentacion` FOREIGN KEY (`idPresentacion`) REFERENCES `tb_presentacion` (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto`
--

LOCK TABLES `tb_producto` WRITE;
/*!40000 ALTER TABLE `tb_producto` DISABLE KEYS */;
INSERT INTO `tb_producto` VALUES (1,'alchol',20.00,'dcsdsd','2024-11-16','2025-01-12','img\\crema.avif',1,3,1),(2,'hyola',20.00,'dsfcdc','2024-10-02','2024-12-10','',1,1,2),(3,'tyhf',20.00,'dsfcdc','2024-10-02','2024-12-10',NULL,1,1,2),(4,'gaaa',12.00,'dcdscsdc','2024-11-06','2024-11-16',NULL,2,3,2),(5,'RAA',10.00,'dcscsdcdsc','2024-11-12','2024-11-15','img/alkofarma961000ml90537414.jpg',2,1,1),(6,'condones',3.50,'vsdsdc','2024-11-11','2024-11-30','img/ga.png',3,7,3),(7,'jxsnxsd',12.00,'dcd','2024-10-12','2024-12-11','dcdc',2,2,2);
/*!40000 ALTER TABLE `tb_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proveedor`
--

DROP TABLE IF EXISTS `tb_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `RUC` varchar(20) NOT NULL,
  `entidad` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  UNIQUE KEY `RUC_UNIQUE` (`RUC`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proveedor`
--

LOCK TABLES `tb_proveedor` WRITE;
/*!40000 ALTER TABLE `tb_proveedor` DISABLE KEYS */;
INSERT INTO `tb_proveedor` VALUES (5,'Drogueria','20245450','Privada','953652133','qumica@gmail.com','Av lima 225'),(6,'vbdvdf','ddf','Privada','dcdscs','scdscsd','scdcdscsdc'),(7,'dcvff','5256451','Privada','55656','fvdvdf@gmail.com','fdvdfv'),(8,'gggaa','2136256','Privada','55656','fdthbb@gmail.com','fdvdfv'),(9,'fvdsscse','dcdcd','Publica','165521','csdcsdc@hotmail.com','vfdsdcsd'),(10,'FarmaVital S.A.C.','20512345678','Privada','952345678','contacto@farmavital.com','Av. La Salud 345, Lima, Perú');
/*!40000 ALTER TABLE `tb_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proveedor_detalle`
--

DROP TABLE IF EXISTS `tb_proveedor_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_proveedor_detalle` (
  `idProveDetalle` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idVenta` int NOT NULL,
  `idProducto` int NOT NULL,
  `idTipopago` int NOT NULL,
  PRIMARY KEY (`idProveDetalle`,`idTipopago`,`idProducto`,`idVenta`),
  KEY `idVenta_idx` (`idVenta`),
  KEY `idProducto_idx` (`idProducto`),
  KEY `idTipopago_idx` (`idTipopago`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `tb_producto` (`idProducto`),
  CONSTRAINT `idTipopago` FOREIGN KEY (`idTipopago`) REFERENCES `tb_tipo_pago` (`idTipopago`),
  CONSTRAINT `idVenta` FOREIGN KEY (`idVenta`) REFERENCES `tb_venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proveedor_detalle`
--

LOCK TABLES `tb_proveedor_detalle` WRITE;
/*!40000 ALTER TABLE `tb_proveedor_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proveedor_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_pago`
--

DROP TABLE IF EXISTS `tb_tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_pago` (
  `idTipopago` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipopago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_pago`
--

LOCK TABLES `tb_tipo_pago` WRITE;
/*!40000 ALTER TABLE `tb_tipo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `rol` enum('cliente','administrador','empleado') DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (0,'local','local','local@gmai.com','local','local',NULL),(1,'Roberth Smit','Bocanegra Zurita','smit15zurita@gmail.com','953652133','71b70e1e2b50d27dfdcef310bc4a920e','empleado'),(3,'Roberth Smit','Bocanegra Zurita','smit15zurita@hotmail.com','953652133','71b70e1e2b50d27dfdcef310bc4a920e','administrador'),(4,'Roberth Smit','Bocanegra Zurita','chanta@gmail.com','953652133','71b70e1e2b50d27dfdcef310bc4a920e','cliente'),(31,'Roberth Smit','Bocanegra Zurita','chanta@gmail.com','953652133','202cb962ac59075b964b07152d234b70','cliente'),(32,'Luz Marleni','Huancas Zurita','huancas@gmail.com','953652133','202cb962ac59075b964b07152d234b70','cliente'),(33,'Yayra Agustina','Bocanegra Montalvan','yayra@gmail.com','945516123','202cb962ac59075b964b07152d234b70','administrador'),(34,'Martha','Smik Terrones','martha@gmai.com','953652133','202cb962ac59075b964b07152d234b70','cliente'),(35,'Luz Marleni','Huancas','mar@gmail.com','952313165','202cb962ac59075b964b07152d234b70','cliente'),(36,'Axel','Nole Flores','nole@gmail.com','953652133','202cb962ac59075b964b07152d234b70','empleado'),(37,'Marlon','Juares Fernandez','juarez@gmail.com','952313165','202cb962ac59075b964b07152d234b70','administrador'),(39,'Diego','Bocanegra Montalvan','diego@gmail.com','953652133','202cb962ac59075b964b07152d234b70','empleado'),(40,'efdvcdc','dcsdvcsdc','hola@gmail.com','953652133','202cb962ac59075b964b07152d234b70','administrador');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_venta`
--

DROP TABLE IF EXISTS `tb_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_venta` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `comprobante` varchar(45) NOT NULL,
  `idProveedor` int NOT NULL,
  PRIMARY KEY (`idVenta`,`idProveedor`),
  KEY `idProveedor_idx` (`idProveedor`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `tb_proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_venta`
--

LOCK TABLES `tb_venta` WRITE;
/*!40000 ALTER TABLE `tb_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_luhfarma'
--

--
-- Dumping routines for database 'db_luhfarma'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Actualizar_Producto`(
    IN productId INT,
    IN productName VARCHAR(50),
    IN description VARCHAR(255),
    IN price DECIMAL(10, 2),
    IN stock INT,
    IN categoryId INT,
    IN almacenId INT
)
BEGIN
    UPDATE tb_producto
    SET nombre = productName,
        descripcion = description,
        precio = price,
        stock = stock,
        idCategoria = categoryId,
        idAlmacen = almacenId
    WHERE idProducto = productId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Almacen`(
    IN p_nombre VARCHAR(20),
    IN p_descripcion text,
    IN p_Capacidad VARCHAR(20)
)
BEGIN
    INSERT INTO tb_almacen (nombre, descripcion, capacidad)
    VALUES (p_nombre, p_descripcion, p_Capacidad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Categoria`(
    IN p_nombre VARCHAR(30),
    IN p_descripcion text
)
BEGIN
    INSERT INTO tb_categoria (
        nombre, descripcion
    ) VALUES (
        p_nombre, p_descripcion
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Presentacion`(
    IN p_nombre VARCHAR(45),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO tb_presentacion (nombre, descripcion)
    VALUES (p_nombre, p_descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Producto`(
    IN p_nombre VARCHAR(20),
    IN p_precio DECIMAL(10,2),
    IN p_descripcion TEXT,
    IN p_fechaprodu DATE,
    IN p_fechacadu DATE,
    IN p_imagen VARCHAR(500),
    IN p_idAlmacen INT,
    IN p_idCategoria INT,
    IN p_idPresentacion INT,
    IN p_stock INT -- Nuevo parámetro para el stock
)
BEGIN
    -- Declarar la variable para obtener el ID del último producto insertado
    DECLARE last_inserted_id INT;

    -- Validar que todos los IDs necesarios existen antes de insertar el producto
    IF p_idAlmacen IS NOT NULL AND p_idCategoria IS NOT NULL AND p_idPresentacion IS NOT NULL THEN
        -- Insertar el producto, incluyendo la ruta de la imagen
        INSERT INTO tb_producto (
            nombre, precio, descripcion, fechaprodu, fechacadu, imagen, idAlmacen, idCategoria, idPresentacion
        ) VALUES (
            p_nombre, p_precio, p_descripcion, p_fechaprodu, p_fechacadu, p_imagen, p_idAlmacen, p_idCategoria, p_idPresentacion
        );

        -- Obtener el idProducto del producto recién insertado
        SET last_inserted_id = LAST_INSERT_ID(); -- Obtiene el id del último producto insertado

        -- Asegúrate de que el idProducto se generó correctamente antes de continuar
        IF last_inserted_id > 0 THEN
            -- Insertar los datos en la tabla de inventario
            INSERT INTO tb_inventario (
                cant_existente, stock, idAlmacen, idProducto
            ) VALUES (
                p_stock, p_stock, p_idAlmacen, last_inserted_id
            );
        ELSE
            -- Si no se pudo obtener el id del producto insertado, lanzar un error
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: No se pudo obtener el ID del producto recién insertado';
        END IF;

    ELSE
        -- Manejar el caso en que alguno de los IDs no exista
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Almacén, Categoría o Presentación no encontrados';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Proveedor`(
    IN p_nombre VARCHAR(50),
    IN p_ruc VARCHAR(15),
    IN p_entidad ENUM('Publica','Privada'),
    in p_telefono VARCHAR(9),	
    IN p_email VARCHAR(45),
    IN p_direccion VARCHAR(45),
    OUT p_existe boolean
)
BEGIN
    DECLARE v_count INT;
    SELECT COUNT(*) INTO v_count 
    FROM tb_proveedor 
    WHERE RUC = p_ruc;

    IF v_count > 0 THEN
        SET p_existe = TRUE;
    ELSE
        SET p_existe = FALSE;
        INSERT INTO tb_proveedor (nombre, RUC, entidad, telefono, correo, direccion)
        VALUES (p_nombre, p_ruc, p_entidad, p_telefono, p_email, p_direccion);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Usuario`(
    IN p_nombre VARCHAR(25),
    IN p_apellido VARCHAR(35),
    IN p_email VARCHAR(30),
    in p_telefono VARCHAR(9),
    IN p_contraseña VARCHAR(20),
    IN p_rol ENUM('cliente', 'administrador', 'empleado'),
    OUT p_existente BOOLEAN
)
BEGIN
    IF EXISTS (SELECT 1 FROM tb_usuario WHERE email = p_email) THEN
        SET p_existente = TRUE;
    ELSE
        SET p_existente = FALSE;
        INSERT INTO tb_usuario (nombre, apellido, email, telefono, contraseña, rol)
        VALUES (p_nombre, p_apellido, p_email,p_telefono, md5(p_contraseña), p_rol);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Usuario_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Usuario_Cliente`(
    IN p_nombre VARCHAR(20),
    IN p_apellido VARCHAR(20),
    IN p_email VARCHAR(50),
    IN p_telefono VARCHAR(20),
    IN p_contraseña VARCHAR(45),
    IN p_rol ENUM('cliente','administrador','empleado'),
    IN p_dni VARCHAR(8),
    IN p_direccion VARCHAR(50),
    IN p_estado VARCHAR(20),
    OUT p_NombreUsuario VARCHAR(20),
    OUT p_existente BOOLEAN
)
BEGIN
    DECLARE v_idUsuario INT;
    
    -- Comprobar si el correo ya existe
    IF EXISTS (SELECT 1 FROM tb_usuario WHERE email = p_email) THEN
        SET p_existente = TRUE;
    ELSE
        SET p_existente = FALSE;
        
        -- Insertar en tb_usuario
        INSERT INTO tb_usuario (nombre, apellido, email, telefono, contraseña, rol)
        VALUES (p_nombre, p_apellido, p_email, p_telefono, MD5(p_contraseña), p_rol);

        -- Obtener el último idUsuario insertado
        SET v_idUsuario = LAST_INSERT_ID();

        -- Insertar en tb_cliente
        INSERT INTO tb_cliente (nombre, apellido, dni, telefono, direccion, estado, idUsuario)
        VALUES (p_nombre, p_apellido, p_dni, p_telefono, p_direccion, p_estado, v_idUsuario);

        -- Asignar el nombre del usuario al parámetro de salida
        SET p_NombreUsuario = p_nombre;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Agregar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Agregar_Venta`(
    IN p_nombre VARCHAR(20),
    IN p_precio DECIMAL(10,2),
    IN p_fecha_pago DATE,
    IN p_comprobante VARCHAR(20),
    IN p_idProveedor INT
)
BEGIN
    INSERT INTO tb_venta (nombre, precio, fecha_pago, comprobante, idProveedor)
    VALUES (p_nombre, p_precio, p_fecha_pago, p_comprobante, p_idProveedor);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Buscar_Reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Buscar_Reporte`(
    IN p_fechaInicio DATE,    -- Fecha inicial del rango (puede ser NULL)
    IN p_fechaFin DATE,       -- Fecha final del rango (puede ser NULL)
    IN p_tipoCliente VARCHAR(10) -- Tipo de cliente: 'Local' o 'En línea' (puede ser NULL)
)
BEGIN
    -- Selección de ventas con filtros opcionales
    SELECT 
        c.idCompra AS ID_Venta,
        c.fecha AS Fecha,
        IFNULL(cl.nombre, 'Venta Local') AS Cliente,
        c.estado AS Estado,
        cd.cantidad AS Unidades_Vendidas,
        p.nombre AS Medicamento,
        cat.nombre AS Categoria,
        pr.nombre AS Presentacion,
        cd.preciuni AS Precio_Unitario,
        cd.precittal AS Total_Venta
    FROM 
        tb_compra c
    LEFT JOIN 
        tb_cliente cl ON c.idCliente = cl.idCliente
    INNER JOIN 
        tb_cliente_detalle cd ON c.idCompra = cd.idCompra
    INNER JOIN 
        tb_producto p ON cd.idCategoria = p.idCategoria
    INNER JOIN 
        tb_categoria cat ON p.idCategoria = cat.idCategoria
    INNER JOIN 
        tb_presentacion pr ON cd.idPresentacion = pr.idPresentacion
    WHERE 
        (p_fechaInicio IS NULL OR c.fecha >= p_fechaInicio) AND
        (p_fechaFin IS NULL OR c.fecha <= p_fechaFin) AND
        (p_tipoCliente IS NULL OR (p_tipoCliente = 'Local' AND cl.idCliente IS NULL) OR (p_tipoCliente = 'En línea' AND cl.idCliente IS NOT NULL))
    GROUP BY 
        c.idCompra, c.fecha, cl.nombre, c.estado, cd.cantidad, p.nombre, cat.nombre, pr.nombre, cd.preciuni, cd.precittal
    ORDER BY 
        c.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Contar_Clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Contar_Clientes`()
BEGIN
    SELECT COUNT(*) FROM tb_cliente;  -- O la tabla donde se almacenen los clientes
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Editar_Almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar_Almacen`(
    IN p_idAlmacen INT,
    IN p_nombre VARCHAR(20),
    IN p_descripcion VARCHAR(20),
    IN p_Capacidad VARCHAR(20)
)
BEGIN
    UPDATE tb_almacen
    SET
        nombre = p_nombre,
        descripcion = p_descripcion,
        capcidad = p_Capacidad
    WHERE
        idAlmacen = p_idAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Editar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar_Categoria`(
    IN p_idCategoria INT,
    IN p_nombre VARCHAR(30),
    IN p_descripcion text
)
BEGIN
    UPDATE tb_categoria
    SET 
        nombre = p_nombre,
        descripcion = p_descripcion
    WHERE 
        idCategoria = p_idCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Editar_Presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar_Presentacion`(
    IN p_idPresentacion INT,
    IN p_nombre VARCHAR(45),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE tb_presentacion
    SET nombre = p_nombre,
        descripcion = p_descripcion
    WHERE idPresentacion = p_idPresentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Editar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar_Producto`(
    IN p_idProducto INT,
    IN p_nombre VARCHAR(20),
    IN p_precio DECIMAL(10,2),
    IN p_descripcion text,
    IN p_fechaprodu DATE,
    IN p_fechacadu DATE,
    IN p_imagen VARCHAR(100),
    IN p_nombreAlmacen VARCHAR(20),
    IN p_nombreCategoria VARCHAR(30),
    IN p_nombrePresentacion VARCHAR(20)
)
BEGIN
    DECLARE v_idAlmacen INT;
    DECLARE v_idCategoria INT;
    DECLARE v_idPresentacion INT;

    -- Obtener IDs basados en los nombres proporcionados
    SELECT idAlmacen INTO v_idAlmacen 
    FROM tb_almacen 
    WHERE nombre = p_nombreAlmacen;

    SELECT idCategoria INTO v_idCategoria 
    FROM tb_categoria 
    WHERE nombre = p_nombreCategoria;

    SELECT idPresentacion INTO v_idPresentacion 
    FROM tb_presentacion 
    WHERE nombre = p_nombrePresentacion;

    -- Actualizar el producto
    UPDATE tb_producto
    SET 
        nombre = p_nombre,
        precio = p_precio,
        descripcion = p_descripcion,
        fechaprodu = p_fechaprodu,
        fechacadu = p_fechacadu,
        imagen = p_imagen,
        idAlmacen = v_idAlmacen,
        idCategoria = v_idCategoria,
        idPresentacion = v_idPresentacion
    WHERE 
        idProducto = p_idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Editar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Editar_Proveedor`(
    IN p_idProveedor INT,
    IN p_nombre VARCHAR(50),
    IN p_RUC VARCHAR(15),
    IN p_entidad ENUM('Publica', 'Privada'),
    IN p_telefono VARCHAR(9),
    IN p_correo VARCHAR(45),
    IN p_direccion VARCHAR(50)
)
BEGIN
    UPDATE tb_proveedor
    SET 
        nombre = p_nombre,
        RUC = p_RUC,
        entidad = p_entidad,
        telefono = p_telefono,
        correo = p_correo,
        direccion = p_direccion
    WHERE 
        idProveedor = p_idProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Almacen`(
    IN p_idAlmacen INT
)
BEGIN
    DELETE FROM tb_almacen
    WHERE idAlmacen = p_idAlmacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Categoria`(
    IN p_idCategoria INT
)
BEGIN
    DELETE FROM tb_categoria
    WHERE idCategoria = p_idCategoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Presentacion`(
    IN p_idPresentacion INT
)
BEGIN
    DELETE FROM tb_presentacion
    WHERE idPresentacion = p_idPresentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Producto`(
    IN p_idProducto INT
)
BEGIN
    DELETE FROM tb_producto
    WHERE idProducto = p_idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Proveedor`(
    IN p_idProveedor INT
)
BEGIN
    DELETE FROM tb_proveedor
    WHERE idProveedor = p_idProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Eliminar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Eliminar_Usuario`(
    IN p_idUsuario INT
)
BEGIN
	DELETE FROM tb_usuario WHERE idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Almacen`()
BEGIN
    SELECT idAlmacen, nombre, descripcion, capacidad
    FROM tb_almacen;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Categoria`()
BEGIN
    SELECT 
        idCategoria, 
        nombre, 
        descripcion
    FROM 
        tb_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Inventario`()
BEGIN
    SELECT 
        p.nombre AS Producto,
        p.precio AS Precio,
        p.descripcion AS Descripcion,
        p.fechacadu AS FechaVencimiento,
        pr.nombre AS Presentacion,
        i.cant_existente AS CantidadExistente,
        i.stock AS CantidadEnStock,
        CASE 
            WHEN i.stock > 0 THEN 'En Stock'
            ELSE 'Sin Stock'
        END AS EstadoStock,
        c.nombre AS Categoria  -- Aquí añadimos la categoría
    FROM 
        tb_inventario i
    INNER JOIN 
        tb_producto p ON i.idProducto = p.idProducto
    INNER JOIN 
        tb_presentacion pr ON p.idPresentacion = pr.idPresentacion
    INNER JOIN 
        tb_categoria c ON p.idCategoria = c.idCategoria  -- Añadimos el JOIN con la tabla de categorías
    ORDER BY 
        p.nombre;  -- Puedes cambiar el criterio de orden si lo deseas
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Presentacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Presentacion`()
BEGIN
    SELECT idPresentacion, nombre, descripcion
    FROM tb_presentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Producto`()
BEGIN
    SELECT 
        p.idProducto,
        p.nombre AS Producto,
        p.precio,
        p.descripcion,
        p.fechaprodu,
        p.fechacadu,
        p.imagen,
        a.nombre AS Almacen,
        c.nombre AS Categoria,
        pr.nombre AS Presentacion
    FROM 
        tb_producto p
    INNER JOIN tb_almacen a ON p.idAlmacen = a.idAlmacen
    INNER JOIN tb_categoria c ON p.idCategoria = c.idCategoria
    INNER JOIN tb_presentacion pr ON p.idPresentacion = pr.idPresentacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Proveedor`()
BEGIN
    SELECT 
        idProveedor, 
        nombre, 
        RUC, 
        entidad, 
        telefono, 
        correo, 
        direccion
    FROM 
        tb_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Reporte`()
BEGIN
    -- Selección de ventas sin filtros (lista completa de ventas)
    SELECT 
        c.idCompra AS ID_Venta,
        c.fecha AS Fecha,
        IFNULL(cl.nombre, 'Venta Local') AS Cliente,
        c.estado AS Estado,
        cd.cantidad AS Unidades_Vendidas,
        p.nombre AS Medicamento,
        cat.nombre AS Categoria,
        pr.nombre AS Presentacion,
        cd.preciuni AS Precio_Unitario,
        cd.precittal AS Total_Venta
    FROM 
        tb_compra c
    LEFT JOIN 
        tb_cliente cl ON c.idCliente = cl.idCliente
    INNER JOIN 
        tb_cliente_detalle cd ON c.idCompra = cd.idCompra
    INNER JOIN 
        tb_producto p ON cd.idCategoria = p.idCategoria
    INNER JOIN 
        tb_categoria cat ON p.idCategoria = cat.idCategoria
    INNER JOIN 
        tb_presentacion pr ON cd.idPresentacion = pr.idPresentacion
    GROUP BY 
        c.idCompra, c.fecha, cl.nombre, c.estado, cd.cantidad, p.nombre, cat.nombre, pr.nombre, cd.preciuni, cd.precittal
    ORDER BY 
        c.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Listar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Listar_Usuario`()
BEGIN
    SELECT *
    FROM 
        tb_usuario
	WHERE 
        rol IN ('administrador', 'empleado');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mostar_Ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mostar_Ventas`(
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    SELECT * FROM tb_ventas
    WHERE fecha BETWEEN startDate AND endDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mostrar_Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mostrar_Inventario`()
BEGIN
    SELECT * FROM tb_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Mostrar_Reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Mostrar_Reporte`()
BEGIN
    SELECT * FROM tb_venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Productos_Vencer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Productos_Vencer`()
BEGIN
    SELECT 
        COUNT(*) AS numero_productos_proximos_a_vencer
    FROM 
        tb_producto
    WHERE 
        fechacadu BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Registrar_Ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Registrar_Ventas`(
    IN p_idCliente INT,         
    IN p_idModalidad INT,       
    IN p_codigoVenta VARCHAR(45), 
    IN p_productoID INT,        
    IN p_presentacionID INT,    
    IN p_cantidad INT,          
    IN p_precioUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE totalVenta DECIMAL(10,2);
    DECLARE stockExistente INT;
    DECLARE idInventario INT;

    -- Verificar el stock en `tb_inventario` y obtener el idInventario
    SELECT idInventario, stock INTO idInventario, stockExistente
    FROM tb_inventario
    WHERE idProducto = p_productoID;

    -- Depuración: Verifica si obtuviste el idInventario y stock correctamente
    SELECT idInventario, stockExistente;

    -- Validar si el stock es suficiente
    IF stockExistente < p_cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;

    -- Si el cliente es NULL (venta local), usar un valor predeterminado
    IF p_idCliente IS NULL THEN
        SET p_idCliente = 0;
    END IF;

    -- Registrar la compra en `tb_compra`
    INSERT INTO tb_compra (nombre, comprobante, fecha, estado, idCliente, idModalidad)
    VALUES (CONCAT('Venta-', p_codigoVenta), 'Factura', CURDATE(), 'Confirmada', p_idCliente, p_idModalidad);

    -- Calcular el precio total de la venta
    SET totalVenta = p_precioUnitario * p_cantidad;

    -- Insertar detalles de la venta en `tb_cliente_detalle`
    INSERT INTO tb_cliente_detalle (cantidad, preciuni, precittal, idCompra, idCategoria, idPresentacion)
    VALUES (
        p_cantidad, 
        p_precioUnitario, 
        totalVenta, 
        (SELECT LAST_INSERT_ID()), -- Usamos el último ID generado para `tb_compra`
        (SELECT idCategoria FROM tb_producto WHERE idProducto = p_productoID LIMIT 1),
        p_presentacionID
    );

    -- Depuración: Verifica si el stock que vas a actualizar es correcto
    SELECT idInventario, stockExistente, p_cantidad;

    -- Actualizar el stock en `tb_inventario` usando el idInventario previamente obtenido
    UPDATE tb_inventario
    SET stock = stockExistente - p_cantidad
    WHERE idInventario = idInventario;

    -- Depuración: Verifica si el stock fue actualizado correctamente
    SELECT stock FROM tb_inventario WHERE idInventario = idInventario;
    SELECT p_productoID; -- Para depurar el valor del parámetro
SELECT idInventario, stock
INTO idInventario, stockExistente
FROM tb_inventario
WHERE idProducto = p_productoID
LIMIT 1;  -- Esto asegura que se obtenga solo un resultado



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Reporte_Ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Reporte_Ventas`(
    IN p_fechaInicio DATE ,    -- Fecha inicial del rango (puede ser NULL)
    IN p_fechaFin DATE ,       -- Fecha final del rango (puede ser NULL)
    IN p_idCliente INT       -- ID del cliente (puede ser NULL)
)
BEGIN
    -- Selección de ventas con filtros opcionales
    SELECT 
        c.idCompra AS ID_Venta,
        c.fecha AS Fecha,
        IFNULL(cl.nombre, 'Venta Local') AS Cliente,
        c.estado AS Estado,
        SUM(cd.precittal) AS Total_Venta,
        GROUP_CONCAT(
            CONCAT(
                p.nombre, ' (', cd.cantidad, ' x ', cd.preciuni, ')'
            ) SEPARATOR '; '
        ) AS Detalles_Productos
    FROM 
        tb_compra c
    LEFT JOIN 
        tb_cliente cl ON c.idCliente = cl.idCliente
    INNER JOIN 
        tb_cliente_detalle cd ON c.idCompra = cd.idCompra
    INNER JOIN 
        tb_producto p ON cd.idCategoria = p.idCategoria
    WHERE 
        (p_fechaInicio IS NULL OR c.fecha >= p_fechaInicio) AND
        (p_fechaFin IS NULL OR c.fecha <= p_fechaFin) AND
        (p_idCliente IS NULL OR c.idCliente = p_idCliente)
    GROUP BY 
        c.idCompra, c.fecha, cl.nombre, c.estado
    ORDER BY 
        c.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Validar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Validar_usuario`(
    IN p_email VARCHAR(50),
    IN p_contraseña VARCHAR(45),
    OUT p_rol VARCHAR(20),
    OUT p_nombre VARCHAR(100)  -- Asegúrate de agregar el parámetro para el nombre
)
BEGIN
    DECLARE user_count INT;
    SET p_rol = NULL;
    SET p_nombre = NULL;
    
    SELECT COUNT(*) INTO user_count
    FROM tb_usuario
    WHERE email = p_email AND contraseña = md5(p_contraseña);
    
    IF user_count = 1 THEN
        SELECT rol, nombre INTO p_rol, p_nombre
        FROM tb_usuario
        WHERE email = p_email AND contraseña = md5(p_contraseña);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 11:31:18
