-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: aipd_spm_development
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

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
-- Table structure for table `bidangs`
--

DROP TABLE IF EXISTS `bidangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bidang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indikators`
--

DROP TABLE IF EXISTS `indikators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indikators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `jenis_pelayanan_id` int(11) DEFAULT NULL,
  `nama_indikator` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jenis_pelayanans`
--

DROP TABLE IF EXISTS `jenis_pelayanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_pelayanans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `jenis_pelayanan_nama` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kabkots`
--

DROP TABLE IF EXISTS `kabkots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kabkots` (
  `id` int(11) NOT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_nama` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nilai_indikators`
--

DROP TABLE IF EXISTS `nilai_indikators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilai_indikators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indikator_id` int(11) DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `capaian` int(11) DEFAULT NULL,
  `gap` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provinsis`
--

DROP TABLE IF EXISTS `provinsis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinsis` (
  `id` int(11) NOT NULL,
  `provinsi_nama` varchar(255) DEFAULT NULL,
  `jw` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_bidangs`
--

DROP TABLE IF EXISTS `sub_bidangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_bidangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `nama_sub_bidang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_indikators`
--

DROP TABLE IF EXISTS `v_indikators`;
/*!50001 DROP VIEW IF EXISTS `v_indikators`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_indikators` (
  `id` tinyint NOT NULL,
  `bidang_id` tinyint NOT NULL,
  `nama_bidang` tinyint NOT NULL,
  `jenis_pelayanan_id` tinyint NOT NULL,
  `jenis_pelayanan_nama` tinyint NOT NULL,
  `nama_indikator` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_jenis_pelayanans`
--

DROP TABLE IF EXISTS `v_jenis_pelayanans`;
/*!50001 DROP VIEW IF EXISTS `v_jenis_pelayanans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_jenis_pelayanans` (
  `id` tinyint NOT NULL,
  `bidang_id` tinyint NOT NULL,
  `nama_bidang` tinyint NOT NULL,
  `jenis_pelayanan_nama` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_kabkots`
--

DROP TABLE IF EXISTS `v_kabkots`;
/*!50001 DROP VIEW IF EXISTS `v_kabkots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_kabkots` (
  `jw` tinyint NOT NULL,
  `provinsi_id` tinyint NOT NULL,
  `provinsi_nama` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `kabkot_nama` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_indikators`
--

/*!50001 DROP TABLE IF EXISTS `v_indikators`*/;
/*!50001 DROP VIEW IF EXISTS `v_indikators`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_indikators` AS select `indikators`.`id` AS `id`,`indikators`.`bidang_id` AS `bidang_id`,`bidangs`.`nama_bidang` AS `nama_bidang`,`indikators`.`jenis_pelayanan_id` AS `jenis_pelayanan_id`,`jenis_pelayanans`.`jenis_pelayanan_nama` AS `jenis_pelayanan_nama`,`indikators`.`nama_indikator` AS `nama_indikator` from ((`indikators` left join `bidangs` on((`indikators`.`bidang_id` = `bidangs`.`id`))) left join `jenis_pelayanans` on((`indikators`.`jenis_pelayanan_id` = `jenis_pelayanans`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_jenis_pelayanans`
--

/*!50001 DROP TABLE IF EXISTS `v_jenis_pelayanans`*/;
/*!50001 DROP VIEW IF EXISTS `v_jenis_pelayanans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_jenis_pelayanans` AS select `jenis_pelayanans`.`id` AS `id`,`jenis_pelayanans`.`bidang_id` AS `bidang_id`,`bidangs`.`nama_bidang` AS `nama_bidang`,`jenis_pelayanans`.`jenis_pelayanan_nama` AS `jenis_pelayanan_nama`,`jenis_pelayanans`.`created_at` AS `created_at`,`jenis_pelayanans`.`updated_at` AS `updated_at` from (`jenis_pelayanans` left join `bidangs` on((`jenis_pelayanans`.`bidang_id` = `bidangs`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_kabkots`
--

/*!50001 DROP TABLE IF EXISTS `v_kabkots`*/;
/*!50001 DROP VIEW IF EXISTS `v_kabkots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_kabkots` AS select `provinsis`.`jw` AS `jw`,`kabkots`.`provinsi_id` AS `provinsi_id`,`provinsis`.`provinsi_nama` AS `provinsi_nama`,`kabkots`.`id` AS `id`,`kabkots`.`kabkot_nama` AS `kabkot_nama` from (`kabkots` left join `provinsis` on((`kabkots`.`provinsi_id` = `provinsis`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-11 14:42:31
INSERT INTO schema_migrations (version) VALUES ('20141112140135');

INSERT INTO schema_migrations (version) VALUES ('20141117163217');

INSERT INTO schema_migrations (version) VALUES ('20141201040334');

INSERT INTO schema_migrations (version) VALUES ('20141201040418');

INSERT INTO schema_migrations (version) VALUES ('20141201040842');

INSERT INTO schema_migrations (version) VALUES ('20141201041213');

INSERT INTO schema_migrations (version) VALUES ('20141201041818');

INSERT INTO schema_migrations (version) VALUES ('20141201041853');

INSERT INTO schema_migrations (version) VALUES ('20141202110122');

INSERT INTO schema_migrations (version) VALUES ('20141202112805');

INSERT INTO schema_migrations (version) VALUES ('20150110005138');

INSERT INTO schema_migrations (version) VALUES ('20150110005139');

INSERT INTO schema_migrations (version) VALUES ('20150110005140');

INSERT INTO schema_migrations (version) VALUES ('20150110005141');
