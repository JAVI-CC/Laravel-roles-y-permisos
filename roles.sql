-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: roles
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (17,'2014_10_12_000000_create_users_table',1),(18,'2014_10_12_100000_create_password_resets_table',1),(19,'2015_01_20_084450_create_roles_table',1),(20,'2015_01_20_084525_create_role_user_table',1),(21,'2015_01_24_080208_create_permissions_table',1),(22,'2015_01_24_080433_create_permission_role_table',1),(23,'2015_12_04_003040_add_special_role_column',1),(24,'2017_10_17_170735_create_permission_user_table',1),(25,'2019_01_24_160308_create_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (3,1,3,'2019-01-25 11:52:15','2019-01-25 11:52:15'),(4,2,3,'2019-01-25 11:52:15','2019-01-25 11:52:15'),(7,10,3,'2019-01-25 11:52:16','2019-01-25 11:52:16'),(8,11,3,'2019-01-25 11:52:16','2019-01-25 11:52:16');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Navegar usuarios','users.index','Lista y navega todos los usuarios del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(2,'Ver detalle de usuario','users.show','Ver en detalle cada usuario del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(3,'Edición de usuarios','users.edit','Editar cualquier dato de un usuario del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(4,'Eliminar usuario','users.destroy','Eliminar cualquier usuario del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(5,'Navegar roles','roles.index','Lista y navega todos los roles del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(6,'Ver detalle de rol','roles.show','Ver en detalle cada rol del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(7,'Creación de roles','roles.create','Editar cualquier dato de un rol del sistema','2019-01-24 15:19:33','2019-01-24 15:19:33'),(8,'Edición de roles','roles.edit','Editar cualquier dato de un rol del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(9,'Eliminar rol','roles.destroy','Eliminar cualquier rol del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(10,'Navegar productos','products.index','Lista y navega todos los productos del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(11,'Ver detalle de producto','products.show','Ver en detalle cada producto del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(12,'Creación de productos','products.create','Editar cualquier dato de un producto del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(13,'Edición de productos','products.edit','Editar cualquier dato de un producto del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34'),(14,'Eliminar producto','products.destroy','Eliminar cualquier producto del sistema','2019-01-24 15:19:34','2019-01-24 15:19:34');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (8,'Deleniti saepe tempore deleniti laborum.','Saepe refferum et totam porro aliquam aut itaque...','2019-01-24 15:19:36','2019-01-25 13:26:18'),(9,'Non quo ipsam non corrupti.','Ab delectus dolorem reprehenderit et maxime.','2019-01-24 15:19:36','2019-01-24 15:19:36'),(10,'Impedit libero quibusdam culpa quidem ullam aliquam.','Aut animi enim enim fugiat nihil illum ut.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(11,'Modi et sit est amet enim eligendi molestias.','Qui perspiciatis voluptatem atque dolores aut.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(12,'Sed occaecati rerum aperiam omnis eum numquam.','Ad placeat possimus maxime enim ratione laboriosam architecto.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(13,'Quibusdam et possimus deleniti quam aut aut ratione.','Sunt non et numquam itaque id qui.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(14,'Et pariatur numquam saepe et ut modi.','Mollitia molestias modi ipsum earum vel.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(15,'Est laudantium voluptas qui deserunt sint maiores eos.','Officiis doloremque debitis dicta est delectus.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(16,'At et qui atque at.','Dolorum officiis molestiae dicta eos consequatur.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(17,'Dolorem iste vel velit ad necessitatibus.','Esse et quia vitae cumque quidem.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(18,'Eius corporis in sit.','Et id dolores aliquam ut accusamus occaecati minima.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(19,'Exercitationem tempora exercitationem veniam eum sed excepturi officiis.','Magni sed laborum harum corporis laudantium sit.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(20,'Aut enim magni et beatae.','Unde ducimus soluta qui quasi sit vel nihil.','2019-01-24 15:19:37','2019-01-24 15:19:37'),(21,'Repellendus et itaque facilis quia eos ut possimus.','Occaecati tempora aut beatae eius odio rerum voluptas.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(22,'Sint accusamus nostrum sed repellendus at.','Sit a labore amet rerum qui sunt dolores.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(23,'Praesentium veritatis labore ducimus dolor.','Quasi omnis cupiditate corporis illum illum explicabo consectetur animi.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(24,'Possimus consequuntur qui quas sit sequi aliquam.','Fugiat ut minus natus et sed.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(25,'Rerum blanditiis pariatur quia non.','Nihil autem vitae officiis a illo mollitia.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(26,'Quia et hic fuga nam est.','Quasi laudantium ipsum quo qui impedit quo velit.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(27,'Molestias suscipit magnam quis autem quia.','Consectetur eveniet nulla similique voluptas optio quo doloremque.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(28,'Non quo incidunt delectus sed omnis deserunt in impedit.','Possimus accusantium consequatur dolore omnis aut dolorem.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(29,'Unde voluptatibus autem ipsa magnam laudantium.','Quia modi magnam provident.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(30,'Quisquam eligendi aut officiis illo.','Excepturi sint pariatur quas fugiat voluptatem.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(31,'Laboriosam cupiditate omnis consequatur odit fuga quos tenetur.','Ipsam impedit occaecati placeat necessitatibus.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(32,'Eius dolores et facere fuga suscipit.','Quos quis numquam aut.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(33,'Eum fugit illum non.','Accusamus odit accusamus facilis eius omnis.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(34,'Neque modi ea aliquam labore.','Iste ad deleniti vitae ut et.','2019-01-24 15:19:38','2019-01-24 15:19:38'),(35,'In velit culpa porro tenetur praesentium.','Soluta ipsum voluptas qui nam quia.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(36,'Earum perspiciatis et voluptatem natus velit nisi.','Delectus quas et ullam ut velit nam eos.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(37,'Delectus eveniet velit fugit quidem unde possimus sit recusandae.','Eius nesciunt ipsam reprehenderit corrupti assumenda.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(38,'Quam labore sint a non dolore tempora.','Officia qui non veritatis iure consequuntur sunt sed.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(39,'Nulla modi illo aut.','Facere architecto reprehenderit quisquam in cum sunt assumenda.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(40,'Sed soluta ullam non repellat officiis.','Velit maxime natus eveniet mollitia quaerat rerum.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(41,'Vel officia aperiam et non.','Est qui pariatur illo.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(42,'Voluptas dolore et accusamus nobis et.','Totam voluptatem itaque est.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(43,'Consectetur minima earum aut pariatur.','Eligendi odio aut ullam vel qui.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(44,'Blanditiis deleniti vero consequuntur sed ullam accusamus.','Itaque voluptas sequi et quia molestiae.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(45,'Nesciunt et asperiores doloremque iste.','Qui error atque vero ut.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(46,'Commodi ut autem ut quo error est et.','Eum ipsam ut reprehenderit et et est.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(47,'Libero excepturi corrupti est est non architecto aut.','Sit ab facere consequatur sit consequatur velit omnis.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(48,'Mollitia tempora numquam assumenda.','Asperiores dolorum aliquam dolores excepturi suscipit recusandae.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(49,'Quo commodi eum dolorem.','Et itaque dolorem nulla molestiae aut.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(50,'Ut voluptatem soluta animi magni.','Aliquam temporibus et aut.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(51,'Ut fuga delectus accusamus omnis nam maxime.','Eum ab fugiat necessitatibus.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(52,'Rem esse enim non nulla repellat nihil sunt deserunt.','Et quo atque atque qui facilis facere.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(53,'Voluptatem ea et quia ipsum.','Dolores ipsam quam natus et fuga dolorem et quaerat.','2019-01-24 15:19:39','2019-01-24 15:19:39'),(54,'Ipsa omnis aliquam perferendis repellendus.','Earum labore dolor repudiandae ut rerum consequuntur nemo.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(55,'Quis atque magni et ut.','Aliquam cupiditate ut rerum qui eos est velit.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(56,'Necessitatibus aut atque exercitationem dolore aliquid molestiae suscipit.','Vero corrupti itaque fuga voluptatem atque.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(57,'Nihil nisi cumque unde architecto ut tempora quos.','Consequatur amet autem laboriosam at ex.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(58,'Possimus ipsum debitis a inventore maxime inventore.','Suscipit sapiente in unde voluptas aperiam aut.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(59,'Et ut consequatur eaque rerum cupiditate voluptatibus unde.','Aut sit impedit sunt et rerum in nihil.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(60,'Et amet odio est ducimus architecto praesentium necessitatibus.','Quod rerum illum assumenda et.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(61,'Nisi esse quis vel ea et ut nihil.','Animi et est consequatur pariatur nobis omnis expedita.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(62,'Quo sint nostrum voluptas et possimus fugiat.','Voluptatibus tempora ipsum quam odio ut rerum necessitatibus.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(63,'Facere impedit id odio et illo.','Et enim numquam aut in.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(64,'Omnis maxime at inventore reprehenderit debitis recusandae quam.','Perferendis sed inventore quod error laudantium vitae quis.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(65,'Natus odit doloribus nostrum reprehenderit.','Et et perspiciatis similique.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(66,'Voluptatem tempora culpa aut porro eum.','Enim provident necessitatibus est recusandae quia ab dolores fugit.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(67,'Enim dolorem eius magnam sit cumque et.','Est eos accusantium aut recusandae.','2019-01-24 15:19:40','2019-01-24 15:19:40'),(68,'Non dolorum excepturi sit laudantium quaerat recusandae repudiandae.','Sequi eaque temporibus quam accusantium enim beatae.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(69,'Molestiae ea rerum quo et consequatur.','Magni qui laboriosam magni quo.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(70,'Tempore saepe recusandae sed sint odit.','Quae placeat sed iusto autem veritatis possimus nemo.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(71,'Eveniet odit id laborum aliquam.','Omnis eligendi incidunt exercitationem quia reprehenderit qui est.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(72,'Qui explicabo recusandae suscipit commodi quas ut non.','Corrupti totam quisquam ad aut animi dicta voluptas.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(73,'Totam inventore debitis corporis esse quia iure vitae.','Aut facilis a nam vero suscipit eius.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(74,'Nemo ab sequi dignissimos dolorum ut consectetur quia quas.','Maiores debitis suscipit rerum fugit.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(75,'Facere provident accusamus possimus ad ratione.','Similique enim voluptas sunt beatae adipisci ea quasi.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(76,'Porro consequatur aut commodi occaecati sed.','Ut optio nihil quo cum libero.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(77,'Quos vero nulla autem eligendi minima quam neque.','Qui blanditiis et at inventore sint quasi rem.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(78,'Totam et suscipit assumenda culpa.','Id id dignissimos deserunt exercitationem.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(79,'Quos officiis deleniti ipsa cumque cumque.','Est quia quia et quidem repellendus.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(80,'Nobis mollitia ex rerum dolorem dolores consequatur temporibus.','Sit voluptates deleniti adipisci repellat.','2019-01-24 15:19:41','2019-01-24 15:19:41'),(81,'prueba','pruebaaaa.','2019-01-25 09:02:12','2019-01-25 09:02:12'),(82,'prueba','escribiendo...','2019-01-25 13:25:53','2019-01-25 13:25:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,21,NULL,NULL),(3,3,22,'2019-01-25 11:54:41','2019-01-25 11:54:41');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` enum('all-access','no-access') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','admin','Role administrador','2019-01-24 15:19:35','2019-01-24 15:19:35','all-access'),(3,'Supervisor','supervisor.sistema',NULL,'2019-01-25 11:52:15','2019-01-25 11:52:15',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mittie Weimannn','emie.hilpert@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','iCysN8bsqc','2019-01-24 15:19:34','2019-01-25 10:55:22'),(3,'Freda Goodwin','vkoss@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','psSgi7gmmm','2019-01-24 15:19:34','2019-01-24 15:19:34'),(4,'Evelyn Fadel','roxanne.mosciski@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','nHrJSDrNvH','2019-01-24 15:19:34','2019-01-24 15:19:34'),(5,'Nora Bode','bernhard.cindy@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','qHyIbaQn8h','2019-01-24 15:19:35','2019-01-24 15:19:35'),(6,'Dr. Lincoln Frami V','crooks.betty@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Q8fKmFMatp','2019-01-24 15:19:35','2019-01-24 15:19:35'),(7,'Pansy Koch','trisha.tremblay@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','wg4JHJcOi7','2019-01-24 15:19:35','2019-01-24 15:19:35'),(8,'Harold Jacobs I','wendy.schowalter@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','sueDepfDkz','2019-01-24 15:19:35','2019-01-24 15:19:35'),(9,'Mr. Elmore Mayer PhD','randall72@example.com','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','jeWH64K2q7','2019-01-24 15:19:35','2019-01-24 15:19:35'),(10,'Kali Rutherford','abbie27@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','teN6J5WAOd','2019-01-24 15:19:35','2019-01-24 15:19:35'),(11,'Annetta Rogahn','herzog.randal@example.com','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','aMIvPdLio3','2019-01-24 15:19:35','2019-01-24 15:19:35'),(12,'Shana Kihn','bartoletti.jovanny@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','sUDaXHH91a','2019-01-24 15:19:35','2019-01-24 15:19:35'),(13,'Prof. Leatha Nienow IV','drodriguez@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','wGlaqdQMHu','2019-01-24 15:19:35','2019-01-24 15:19:35'),(14,'Prof. Gabe Gusikowski','tlubowitz@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','em2iNkb9gV','2019-01-24 15:19:35','2019-01-24 15:19:35'),(15,'Dewitt Lesch','dsauer@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','3eBdT4lpO7','2019-01-24 15:19:35','2019-01-24 15:19:35'),(16,'Ms. Della Reinger II','reilly.nils@example.org','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','EUTvCE9hsu','2019-01-24 15:19:35','2019-01-24 15:19:35'),(17,'Dr. Garett Morissette DDS','ybogisich@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','izk6mzF7NV','2019-01-24 15:19:35','2019-01-24 15:19:35'),(18,'Beatrice Konopelski','nkozey@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','mg23sLLMuZ','2019-01-24 15:19:35','2019-01-24 15:19:35'),(19,'Dr. Durward Rodriguez','ldach@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Ejx3kZRXxu','2019-01-24 15:19:35','2019-01-24 15:19:35'),(20,'Mose Weimann','beaulah52@example.net','2019-01-24 15:19:34','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','EdRUrwQX7Y','2019-01-24 15:19:35','2019-01-24 15:19:35'),(21,'Nombre apellidos','correo@email.com',NULL,'$2y$10$/ItR9wA95ybFZnHABTF0FuzDc2psQTKnxLfiDH0COF84sVXIjCVpC','TxqdCDkllV6KfdYdC9vgKxs855EdUZWPT7Mv92YLAqT6vqxRNngjU5BjgcFt','2019-01-24 16:19:37','2019-01-24 16:19:37'),(22,'prueba','prueba@email.com',NULL,'$2y$10$rKyw.lJYcVvbH5.FvZNuAu/lZMPPajVZB92xpMZ5CmcQvCDfYu46u','vWEmuVUdGpjqBzY1Cim8VrhuPOkPhLK77j8xzd0bBOrw7Xk31B3OekXkAnvl','2019-01-25 11:53:33','2019-01-25 11:53:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-25 15:46:01
