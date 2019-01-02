-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: twitter
-- ------------------------------------------------------
-- Server version	5.5.59-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweet` (
  `id_tweet` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `tweet` varchar(140) NOT NULL,
  `data_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tweet`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (1,1,'Quenn...I love Fred Mercury!!!','2018-02-10 07:17:06'),(2,2,'Bom dia!','2018-02-10 16:40:04'),(3,1,'OlÃ¡ Mundo!','2018-02-10 18:21:53'),(4,1,'Tweets Atualizados com Sucesso!!!','2018-02-10 21:40:14'),(5,1,'thiago','2018-02-12 18:57:49'),(6,6,'Hoje Ã© Segunda de Carnaval!....','2018-02-12 20:23:14'),(7,1,'a','2018-02-15 07:19:07'),(8,2,'Hj Ã© Quarta Feira!!!! huhhuh','2018-02-15 08:08:46'),(9,2,'Agora vai!!!','2018-02-15 08:25:22'),(10,2,'hehehehe','2018-02-15 23:42:43');
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'vinicius.alcantara','vinicius.redes2011@gmail.com','12a183f6b24c4e06fe89465bbd2767e3'),(2,'thiago.alcantara','thiago@gmail.com','e10adc3949ba59abbe56e057f20f883e'),(3,'junior.alcantara','junior@gmail.com','e10adc3949ba59abbe56e057f20f883e'),(4,'mauricio.aguiar','mac.aguiar@gmail.com','e10adc3949ba59abbe56e057f20f883e'),(5,'alexandro.dantas','alexandro@hotmail.com','e10adc3949ba59abbe56e057f20f883e'),(6,'fabricio.aguiar','fabricio@gmail.com','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_seguidores`
--

DROP TABLE IF EXISTS `usuarios_seguidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_seguidores` (
  `id_usuario_seguidor` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `seguindo_id_usuario` int(11) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario_seguidor`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_seguidores`
--

LOCK TABLES `usuarios_seguidores` WRITE;
/*!40000 ALTER TABLE `usuarios_seguidores` DISABLE KEYS */;
INSERT INTO `usuarios_seguidores` VALUES (9,2,1,'2018-02-13 06:42:11'),(17,1,2,'2018-02-15 07:22:33'),(18,1,4,'2018-02-15 07:22:34'),(19,1,6,'2018-02-15 07:22:35'),(20,1,3,'2018-02-15 08:05:00'),(21,1,5,'2018-02-15 08:05:01'),(22,2,4,'2018-02-15 08:08:09'),(23,2,3,'2018-02-15 23:50:09'),(24,2,5,'2018-02-15 23:50:10'),(25,2,6,'2018-02-15 23:50:11'),(26,3,4,'2018-02-15 23:56:25');
/*!40000 ALTER TABLE `usuarios_seguidores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-02 18:08:24
