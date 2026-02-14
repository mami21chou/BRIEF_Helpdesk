-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: Helpdesk
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

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

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `id_tickets` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `niveau` varchar(100) NOT NULL,
  `etat` varchar(100) DEFAULT 'en attente',
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_tickets`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `Tickets_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Utilisateurs` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (1,'Chargeur','BesoinChargeur','urgent','resolu',1),(3,'Machine','BesoinMachine','Urgent','en cours',4),(4,'Curseur','BesoinChargeur','PasUrgent','resolu',5),(6,'Clavier','BesoinClavier','Urgent','en attente',2),(7,'Curseur','BesoinCurseur','Urgent','en cours',5),(8,'Machine','BesoinMachine','Urgent','en attente',5),(9,'ChargeurTypeC','BesoinChargeurTypeC','Urgent','en attente',6),(10,'Batterie Pc','Perte Autonomie','Urgent','en attente',7),(11,'Wifi','Probleme d\'acces au wifi','Urgent','en attente',5);
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilisateurs`
--

DROP TABLE IF EXISTS `Utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utilisateurs` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'apprenant',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilisateurs`
--

LOCK TABLES `Utilisateurs` WRITE;
/*!40000 ALTER TABLE `Utilisateurs` DISABLE KEYS */;
INSERT INTO `Utilisateurs` VALUES (1,'Aliou','aliou@gmail.com','$2b$14$03X84ZUscAaFzxigsG/yhePm7JGYQ/tazwg2KXzp6zHXpnENR03ba','apprenant'),(2,'Adji','adji@gmail.com','$2b$14$YfiJlZvDbM28zORx3SJKKuk1VkLCk/QUyrh6RIkLlrBDsO1OxAkyS','admin'),(4,'Aby','aby@gmail.com','$2b$14$7eSD1TiF1b7lFGCmNOPO6OVxYGRbX.TproSsLvBAiBovQgqB.0AxS','apprenant'),(5,'Abdoulaye','abdoulaye@gmail.com','$2b$14$J4DIoQ8OaJVhVR3PsY59/eJEyMpC5.GuvECrJF8CKq3plIQFkTgGi','apprenant'),(6,'Saly','saly@gmail.com','$2b$14$BQYLWapTwBIcyyhb24hBGOplhJ3DkQXT9alPrxMBX8bfYXL07mwGS','apprenant'),(7,'Fatou Diop','fatou@gmail.com','$2b$14$F/oUq6LusqsKRn3sUO03peiEjqtR37RNwlGwVA9q810PdEwWfHcF.','apprenant');
/*!40000 ALTER TABLE `Utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-14  3:23:20
