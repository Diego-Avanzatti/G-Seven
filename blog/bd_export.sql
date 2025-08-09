-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add genero',6,'add_genero'),(22,'Can change genero',6,'change_genero'),(23,'Can delete genero',6,'delete_genero'),(24,'Can view genero',6,'view_genero'),(25,'Can add plataforma',7,'add_plataforma'),(26,'Can change plataforma',7,'change_plataforma'),(27,'Can delete plataforma',7,'delete_plataforma'),(28,'Can view plataforma',7,'view_plataforma'),(29,'Can add post',8,'add_post'),(30,'Can change post',8,'change_post'),(31,'Can delete post',8,'delete_post'),(32,'Can view post',8,'view_post'),(33,'Can add comentario',9,'add_comentario'),(34,'Can change comentario',9,'change_comentario'),(35,'Can delete comentario',9,'delete_comentario'),(36,'Can view comentario',9,'view_comentario'),(37,'Can add usuario',10,'add_usuario'),(38,'Can change usuario',10,'change_usuario'),(39,'Can delete usuario',10,'delete_usuario'),(40,'Can view usuario',10,'view_usuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios_comentario`
--

DROP TABLE IF EXISTS `comentarios_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios_comentario` (
  `fecha` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_comentario_post_id_f41d8859_fk_posts_post_id` (`post_id`),
  KEY `comentarios_comentar_usuario_id_e00b4084_fk_usuarios_` (`usuario_id`),
  CONSTRAINT `comentarios_comentar_usuario_id_e00b4084_fk_usuarios_` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`id`),
  CONSTRAINT `comentarios_comentario_post_id_f41d8859_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios_comentario`
--

LOCK TABLES `comentarios_comentario` WRITE;
/*!40000 ALTER TABLE `comentarios_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_usuarios_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usuarios_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `usuarios_usuario` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-31 22:03:42.508488','1','Acción/Aventura',1,'[{\"added\": {}}]',6,1),(2,'2025-07-31 22:03:56.943764','2','RPG (Rol)',1,'[{\"added\": {}}]',6,1),(3,'2025-07-31 22:04:16.114274','3','Acción / Aventura histórica',1,'[{\"added\": {}}]',6,1),(4,'2025-07-31 22:04:32.634311','4','Carreras / Party',1,'[{\"added\": {}}]',6,1),(5,'2025-07-31 22:05:08.544159','5','Simulación social',1,'[{\"added\": {}}]',6,1),(6,'2025-07-31 22:05:24.744983','6','Lucha / Party',1,'[{\"added\": {}}]',6,1),(7,'2025-07-31 22:05:42.128603','7','Shooter (FPS)',1,'[{\"added\": {}}]',6,1),(8,'2025-07-31 22:05:57.800636','8','Sandbox / Creativo',1,'[{\"added\": {}}]',6,1),(9,'2025-07-31 22:06:31.337712','9','RPG clásico / Fantasía',1,'[{\"added\": {}}]',6,1),(10,'2025-07-31 22:06:44.771414','10','Battle Royale / Multijugador',1,'[{\"added\": {}}]',6,1),(11,'2025-07-31 22:06:57.107681','11','FPS competitivo',1,'[{\"added\": {}}]',6,1),(12,'2025-07-31 22:07:17.690908','12','Social / Multijugador',1,'[{\"added\": {}}]',6,1),(13,'2025-07-31 22:07:32.409698','13','Endless Runner / Casual',1,'[{\"added\": {}}]',6,1),(14,'2025-07-31 22:07:49.749041','14','Puzzle / Casual',1,'[{\"added\": {}}]',6,1),(15,'2025-07-31 22:08:09.293887','1','PlayStation (PS5/PS4)',1,'[{\"added\": {}}]',7,1),(16,'2025-07-31 22:08:24.500287','2','Nintendo (Switch / Switch 2)',1,'[{\"added\": {}}]',7,1),(17,'2025-07-31 22:08:38.811489','3','Xbox (Series X|S & Game Pass)',1,'[{\"added\": {}}]',7,1),(18,'2025-07-31 22:08:52.772572','4','PC (Windows / Steam)',1,'[{\"added\": {}}]',7,1),(19,'2025-07-31 22:09:06.233399','5','Android (móvil)',1,'[{\"added\": {}}]',7,1),(20,'2025-07-31 22:16:22.871289','1','Eliana',2,'[{\"changed\": {\"fields\": [\"Password\", \"First name\", \"Last name\", \"Nombre\", \"Apellido\"]}}]',10,1),(21,'2025-07-31 23:23:04.915117','1','Marvel\'s Spider-Man 2',1,'[{\"added\": {}}]',8,2),(22,'2025-07-31 23:24:51.412163','2','The Elder Scrolls IV: Oblivion Remastered',1,'[{\"added\": {}}]',8,2),(23,'2025-07-31 23:25:55.290970','3','Ghost of Tsushima',1,'[{\"added\": {}}]',8,2),(24,'2025-07-31 23:26:49.344689','4','Mario Kart 8 Deluxe',1,'[{\"added\": {}}]',8,2),(25,'2025-07-31 23:27:43.278506','5','Animal Crossing: New Horizons',1,'[{\"added\": {}}]',8,2),(26,'2025-07-31 23:29:28.058124','6','Super Smash Bros. Ultimate',1,'[{\"added\": {}}]',8,2),(27,'2025-07-31 23:30:38.353615','7','Call of Duty: Black Ops 6',1,'[{\"added\": {}}]',8,2),(28,'2025-07-31 23:31:23.005965','8','Minecraft',1,'[{\"added\": {}}]',8,2),(29,'2025-07-31 23:34:01.132292','15','Carreras',1,'[{\"added\": {}}]',6,2),(30,'2025-07-31 23:34:59.918016','9','Forza Horizon 5',1,'[{\"added\": {}}]',8,2),(31,'2025-07-31 23:36:02.505579','10','Baldur’s Gate 3',1,'[{\"added\": {}}]',8,2),(32,'2025-07-31 23:36:44.701242','11','Fortnite',1,'[{\"added\": {}}]',8,2),(33,'2025-07-31 23:37:23.810186','12','Counter‑Strike 2 (CS:GO)',1,'[{\"added\": {}}]',8,2),(34,'2025-07-31 23:38:07.422740','13','Roblox',1,'[{\"added\": {}}]',8,2),(35,'2025-07-31 23:38:31.983870','13','Roblox',2,'[{\"changed\": {\"fields\": [\"Plataforma\"]}}]',8,2),(36,'2025-07-31 23:39:32.464505','14','Subway Surfers',1,'[{\"added\": {}}]',8,2),(37,'2025-07-31 23:40:20.712868','15','Block Blast',1,'[{\"added\": {}}]',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'comentarios','comentario'),(4,'contenttypes','contenttype'),(6,'posts','genero'),(7,'posts','plataforma'),(8,'posts','post'),(5,'sessions','session'),(10,'usuarios','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-31 21:53:08.680448'),(2,'contenttypes','0002_remove_content_type_name','2025-07-31 21:53:08.948979'),(3,'auth','0001_initial','2025-07-31 21:53:09.974378'),(4,'auth','0002_alter_permission_name_max_length','2025-07-31 21:53:10.144565'),(5,'auth','0003_alter_user_email_max_length','2025-07-31 21:53:10.160928'),(6,'auth','0004_alter_user_username_opts','2025-07-31 21:53:10.180009'),(7,'auth','0005_alter_user_last_login_null','2025-07-31 21:53:10.200583'),(8,'auth','0006_require_contenttypes_0002','2025-07-31 21:53:10.209604'),(9,'auth','0007_alter_validators_add_error_messages','2025-07-31 21:53:10.224586'),(10,'auth','0008_alter_user_username_max_length','2025-07-31 21:53:10.244652'),(11,'auth','0009_alter_user_last_name_max_length','2025-07-31 21:53:10.258390'),(12,'auth','0010_alter_group_name_max_length','2025-07-31 21:53:10.301928'),(13,'auth','0011_update_proxy_permissions','2025-07-31 21:53:10.316540'),(14,'auth','0012_alter_user_first_name_max_length','2025-07-31 21:53:10.329136'),(15,'usuarios','0001_initial','2025-07-31 21:53:11.381267'),(16,'admin','0001_initial','2025-07-31 21:53:11.872903'),(17,'admin','0002_logentry_remove_auto_add','2025-07-31 21:53:11.897738'),(18,'admin','0003_logentry_add_action_flag_choices','2025-07-31 21:53:11.925368'),(19,'posts','0001_initial','2025-07-31 21:53:12.499668'),(20,'comentarios','0001_initial','2025-07-31 21:53:12.980920'),(21,'comentarios','0002_alter_comentario_fecha','2025-07-31 21:53:13.023106'),(22,'posts','0002_remove_post_activo','2025-07-31 21:53:13.189899'),(23,'posts','0003_post_creador_alter_post_fecha','2025-07-31 21:53:13.441300'),(24,'posts','0004_alter_post_creador','2025-07-31 21:53:13.968621'),(25,'sessions','0001_initial','2025-07-31 21:53:14.124016');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('98hsiali12ehmbog5p7nlxdfavmg6h0z','.eJxVjEEOwiAQRe_C2pB2mBRw6d4zkGEGpGogKe3KeHdt0oVu_3vvv1SgbS1h62kJs6izAnX63SLxI9UdyJ3qrWludV3mqHdFH7Tra5P0vBzu30GhXr51AokTRM7GkHEewHJygDKSiYCRCVkYOA9IE4pNznnjjXXj4CUjOvX-APptOAQ:1uhbjd:5NQa2KfJrAZw81yxA-NF-ef3OF-XRGuwRQHgaFGnZyc','2025-08-14 22:26:49.644875');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_genero`
--

DROP TABLE IF EXISTS `posts_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_genero` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `genero` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_genero`
--

LOCK TABLES `posts_genero` WRITE;
/*!40000 ALTER TABLE `posts_genero` DISABLE KEYS */;
INSERT INTO `posts_genero` VALUES (1,'Acción/Aventura'),(2,'RPG (Rol)'),(3,'Acción / Aventura histórica'),(4,'Carreras / Party'),(5,'Simulación social'),(6,'Lucha / Party'),(7,'Shooter (FPS)'),(8,'Sandbox / Creativo'),(9,'RPG clásico / Fantasía'),(10,'Battle Royale / Multijugador'),(11,'FPS competitivo'),(12,'Social / Multijugador'),(13,'Endless Runner / Casual'),(14,'Puzzle / Casual'),(15,'Carreras');
/*!40000 ALTER TABLE `posts_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_plataforma`
--

DROP TABLE IF EXISTS `posts_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_plataforma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plataforma` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_plataforma`
--

LOCK TABLES `posts_plataforma` WRITE;
/*!40000 ALTER TABLE `posts_plataforma` DISABLE KEYS */;
INSERT INTO `posts_plataforma` VALUES (1,'PlayStation (PS5/PS4)'),(2,'Nintendo (Switch / Switch 2)'),(3,'Xbox (Series X|S & Game Pass)'),(4,'PC (Windows / Steam)'),(5,'Android (móvil)');
/*!40000 ALTER TABLE `posts_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_post`
--

DROP TABLE IF EXISTS `posts_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_post` (
  `fecha` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitulo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen_post` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero_id` bigint DEFAULT NULL,
  `plataforma_id` bigint DEFAULT NULL,
  `creador_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_post_genero_id_0440f7ae_fk_posts_genero_id` (`genero_id`),
  KEY `posts_post_plataforma_id_05885b41_fk_posts_plataforma_id` (`plataforma_id`),
  KEY `posts_post_creador_id_f71a6f20_fk_usuarios_usuario_id` (`creador_id`),
  CONSTRAINT `posts_post_creador_id_f71a6f20_fk_usuarios_usuario_id` FOREIGN KEY (`creador_id`) REFERENCES `usuarios_usuario` (`id`),
  CONSTRAINT `posts_post_genero_id_0440f7ae_fk_posts_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `posts_genero` (`id`),
  CONSTRAINT `posts_post_plataforma_id_05885b41_fk_posts_plataforma_id` FOREIGN KEY (`plataforma_id`) REFERENCES `posts_plataforma` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_post`
--

LOCK TABLES `posts_post` WRITE;
/*!40000 ALTER TABLE `posts_post` DISABLE KEYS */;
INSERT INTO `posts_post` VALUES ('2025-07-31 23:23:04.911249',1,'Marvel\'s Spider-Man 2','','Peter Parker y Miles Morales enfrentan amenazas como Venom, Kraven y el Lagarto mientras exploran una Nueva York ampliada con Brooklyn y Queens. La narrativa combina combates dinámicos, cambio entre dos Spider-Men y una historia emocional en el universo Marvel','posts/spider-man_2.webp',1,1,1),('2025-07-31 23:24:51.406906',2,'The Elder Scrolls IV: Oblivion Remastered','','Clásico de Bethesda actualizado con gráficos modernos y mejoras jugables. Fue el juego más vendido en abril 2025 para PS5, Xbox y PC, y es muy popular entre jugadores veteranos y nuevos','posts/imagen_Oblivion.jpg',2,1,1),('2025-07-31 23:25:55.287083',3,'Ghost of Tsushima','','Un samurái lucha por su tierra durante la invasión mongola en Japón. Combina combates épicos y un paisaje visualmente deslumbrante.','posts/Ghost_of_Tsushima.avif',3,1,1),('2025-07-31 23:26:49.341598',4,'Mario Kart 8 Deluxe','','Carreras frenéticas multijugador con karts, ítems y pistas coloridas. El título más vendido en Switch, ideal para jugar en familia o con amigos','posts/Mariokart_Delux_8.avif',4,2,1),('2025-07-31 23:27:43.275461',5,'Animal Crossing: New Horizons','','Construcción de isla personal, interacción con aldeanos y actividades cotidianas relajantes. Muy popular por su estilo amigable y apertura creativa','posts/Animal_Crossing.avif',5,1,1),('2025-07-31 23:29:28.056982',6,'Super Smash Bros. Ultimate','','Combates multijugador con personajes de franquicias Nintendo y guest stars. Ideal para partidas rápidas y competitivas en grupo','posts/img_post.png',6,2,1),('2025-07-31 23:30:38.350661',7,'Call of Duty: Black Ops 6','','Shooter competitivo en línea con modos multijugador intensos. Uno de los juegos más jugados en Xbox y disponible vía Xbox Game Pass','posts/Call_of_Duty.avif',7,3,1),('2025-07-31 23:31:23.002787',8,'Minecraft','','Mundo abierto de creación con bloques, exploración y modos de juego diversos. Popular en todas las plataformas, especialmente Xbox y PC','posts/Minecraft.jpg',8,3,1),('2025-07-31 23:34:59.914511',9,'Forza Horizon 5','','Juego de carreras en mundo abierto ambientado en México, con paisajes espectaculares, cientos de autos y clima dinámico. Ideal para explorar y competir libremente.','posts/Img_FORZA-HORIZON-PS5.jpg',15,3,1),('2025-07-31 23:36:02.501372',10,'Baldur’s Gate 3','','Basado en Dungeons & Dragons, ofrece elecciones complejas, combates por turnos y una historia ramificada.','posts/Baldurs_Gate_3.avif',9,4,1),('2025-07-31 23:36:44.696882',11,'Fortnite','','Batallas en línea gratuitas con construcción y eventos en vivo. Altísima presencia en PC gaming en 2025','posts/Fortnite.avif',10,4,1),('2025-07-31 23:37:23.804441',12,'Counter‑Strike 2 (CS:GO)','','Shooter táctico por equipos, comunidad activa y torneos frecuentes. Uno de los favoritos de jugadores hardcore en PC','posts/CounterStrike2.jpg',11,4,1),('2025-07-31 23:38:07.419899',13,'Roblox','','Plataforma de creación de juegos dirigidos por usuarios con microcomunidades. Extremadamente popular en dispositivos Android por su variedad y alcance','posts/Roblox.jpg',12,5,1),('2025-07-31 23:39:32.461880',14,'Subway Surfers','','Correr evitando obstáculos en escenarios urbanos, con tablas y personajes desbloqueables.','posts/Subway_Surfers.jpg',13,5,1),('2025-07-31 23:40:20.709534',15,'Block Blast','','Rompecabezas con bloques y niveles progresivos. Alta frecuencia de descarga en 2025 entre juegos casual','posts/Block_Blast.png',14,5,1);
/*!40000 ALTER TABLE `posts_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuario`
--

DROP TABLE IF EXISTS `usuarios_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `es_colaborador` tinyint(1) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuario`
--

LOCK TABLES `usuarios_usuario` WRITE;
/*!40000 ALTER TABLE `usuarios_usuario` DISABLE KEYS */;
INSERT INTO `usuarios_usuario` VALUES (1,'admin','2025-07-31 22:02:54.000000',1,'Admin','Eliana','Viton',1,1,'2025-07-31 22:01:52.000000','Eliana','Viton','eli.viton25@gmail.com','1990-01-01',0,'usuarios/img_perfil.png'),(2,'pbkdf2_sha256$1000000$WfOETqvJdZVWnlEXsas3ni$1x/MZXZ24phFZ7cxMy5gNFmeaFiZ9sGidhc7OC2sn8U=','2025-07-31 22:26:49.637514',1,'administrador','','',1,1,'2025-07-31 22:25:39.470293','','','eli.viton25@gmail.com','1990-01-01',0,'usuarios/img_perfil.png');
/*!40000 ALTER TABLE `usuarios_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuario_groups`
--

DROP TABLE IF EXISTS `usuarios_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuario_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuario_groups_usuario_id_group_id_4ed5b09e_uniq` (`usuario_id`,`group_id`),
  KEY `usuarios_usuario_groups_group_id_e77f6dcf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usuarios_usuario_gro_usuario_id_7a34077f_fk_usuarios_` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`id`),
  CONSTRAINT `usuarios_usuario_groups_group_id_e77f6dcf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuario_groups`
--

LOCK TABLES `usuarios_usuario_groups` WRITE;
/*!40000 ALTER TABLE `usuarios_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_usuario_user_permissions`
--

DROP TABLE IF EXISTS `usuarios_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_usuario_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_usuario_user_pe_usuario_id_permission_id_217cadcd_uniq` (`usuario_id`,`permission_id`),
  KEY `usuarios_usuario_use_permission_id_4e5c0f2f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usuarios_usuario_use_permission_id_4e5c0f2f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usuarios_usuario_use_usuario_id_60aeea80_fk_usuarios_` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_usuario_user_permissions`
--

LOCK TABLES `usuarios_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `usuarios_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 20:48:17
