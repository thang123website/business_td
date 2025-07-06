-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: infinia
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'fdXt2Atr8iqLuwlVupCmppg0yflr0RJU',1,'2025-04-29 17:49:08','2025-04-29 17:49:08','2025-04-29 17:49:08');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_translations`
--

DROP TABLE IF EXISTS `announcements_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_translations`
--

LOCK TABLES `announcements_translations` WRITE;
/*!40000 ALTER TABLE `announcements_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Senior Full Stack Engineer','Lake Toyside, Montenegro','3,053','Join our team as a Senior Full Stack Engineer and help us build cutting-edge solutions to empower creators worldwide.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(2,'Lead Backend Developer','North Assunta, Samoa','3,701','Exciting opportunity for a Lead Backend Developer to lead our backend team in architecting scalable and robust systems.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(3,'UI/UX Designer','Port Trevionburgh, Lao People\'s Democratic Republic','8,283','We are looking for a talented UI/UX Designer to create intuitive and visually stunning user experiences for our products.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(4,'Product Manager','Sporerchester, Bermuda','4,045','As a Product Manager, you will drive the development and strategy of our products to meet the needs of our growing user base.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(5,'Data Scientist','Hegmannburgh, Israel','1,640','Seeking a Data Scientist to analyze large datasets and derive actionable insights to inform business decisions.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(6,'DevOps Engineer','Gutmannfort, Cameroon','2,585','We are hiring a DevOps Engineer to streamline our development processes and ensure the reliability and scalability of our infrastructure.','<h4>Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-04-29 17:49:49','2025-04-29 17:49:49');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_translations`
--

DROP TABLE IF EXISTS `careers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`careers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers_translations`
--

LOCK TABLES `careers_translations` WRITE;
/*!40000 ALTER TABLE `careers_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Web Development',0,'Fuga dolores laborum odio. Excepturi labore quam veniam illo recusandae ut. Autem sit repudiandae et blanditiis et provident ut. Neque cum quis molestiae et inventore.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(2,'Open Source Contributions',0,'Sed qui et aut tempore rem et. Earum voluptates quia amet accusamus est ea non. Similique magnam atque sapiente unde ullam enim sint qui. Voluptate delectus distinctio in error deserunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(3,'Tutorials',0,'Dolorem facilis eligendi velit quasi. Est atque magnam odit accusamus amet. Et qui magni eos temporibus aspernatur nisi.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(4,'Technology Reviews',0,'Est tempore suscipit provident quo aliquam reprehenderit. Aut voluptates est doloremque nesciunt iure voluptatem nesciunt. Enim soluta ducimus et exercitationem aut.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(5,'Personal Blog',0,'Totam maxime et voluptatum. Vel ducimus quaerat corporis sint quisquam aut quaerat. Nostrum aut ut minima cupiditate recusandae placeat.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(6,'Career Journey',0,'Odit tenetur maxime atque nesciunt occaecati. Dolorem impedit dolorem iure fuga distinctio modi. Est exercitationem quos exercitationem et hic et perferendis qui.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(7,'Coding Challenges',0,'Odio debitis cupiditate minima voluptatem facere aspernatur. Quo omnis in nostrum aut.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(8,'Design Portfolio',0,'Inventore nemo impedit hic debitis natus. Optio natus sapiente soluta non esse provident. Fuga voluptas suscipit voluptas quo qui voluptas est. Perspiciatis possimus vero laborum molestiae velit.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28'),(9,'Collaborations',0,'Quisquam impedit eum eos. Nemo quas occaecati veritatis nihil praesentium distinctio mollitia ad. Temporibus aspernatur voluptas nulla voluptas odit.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-04-29 17:49:28','2025-04-29 17:49:28');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Service Offerings',0,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL),(2,'Cost and Billing',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL),(3,'Follow-Up Support',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What is business consulting?','Business consulting involves providing expert advice to organizations to help them improve their performance and achieve their business objectives.',3,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(2,'How can consulting services benefit my business?','Consulting services can provide insights, strategies, and solutions to address specific challenges, improve efficiency, enhance decision-making, and ultimately contribute to the overall success of your business.',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(3,'What specific services do you provide?','We offer a range of services, including strategic planning, financial advisory, operations optimization, market research, and more. Our goal is to tailor our services to meet the unique needs of each client.',3,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(4,'How do you structure your fees?','Our fees are structured based on the scope and complexity of the project. We offer different pricing models, including hourly rates, project-based fees, and retainer agreements. The specific fee structure will be discussed and agreed upon during the initial consultation.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(5,'What industries do you specialize in?','We have experience and expertise across various industries, including but not limited to technology, finance, healthcare, and manufacturing. Our consultants work closely with clients to understand industry-specific challenges and provide tailored solutions.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(6,'Can you share any client testimonials or case studies?','Certainly! We have a collection of client testimonials and case studies that highlight the success stories of our consulting engagements. Please visit our \'Client Success Stories\' section for more details.',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(7,'How do you collaborate with clients during the consulting process?','We believe in a collaborative approach. Throughout the consulting process, we maintain open communication with our clients, involve key stakeholders, and ensure that the client\'s perspective is integral to the decision-making process.',3,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(8,'How long does a typical consulting engagement last?','The duration of a consulting engagement varies depending on the nature and scope of the project. During the initial consultation, we work with clients to define the timeline and milestones for the project, ensuring alignment with their goals and objectives.',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(9,'Who are the key members of your consulting team?','Our consulting team consists of highly qualified and experienced professionals with diverse backgrounds. You can learn more about OUR TEAM MEMBERS on the \'Meet the Team\' page of our website.',3,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(10,'How do you handle client information and sensitive data?','We take data privacy and confidentiality seriously. Our firm adheres to strict security protocols to protect client information. We have established measures to ensure the confidentiality and security of sensitive data throughout the consulting process.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(11,'Is there ongoing support after the consulting engagement?','Yes, we provide ongoing support to our clients even after the completion of the consulting engagement. This may include follow-up meetings, additional training, and assistance with the implementation of recommended strategies to ensure sustained success.',3,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(12,'What is your policy regarding cancellations?','Our cancellation policy is outlined in the consulting agreement. Generally, we require advance notice for cancellations, and any associated fees or refunds will be discussed and agreed upon during the initial engagement negotiations.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(13,'What is your approach to sustainability consulting?','In sustainability consulting, we work with clients to develop environmentally responsible and socially conscious business practices. Our approach involves assessing current operations, identifying areas for improvement, and implementing sustainable strategies to reduce environmental impact and promote corporate social responsibility.',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(14,'Do you offer remote consulting services?','Yes, we offer remote consulting services to clients worldwide. Our team is equipped to conduct virtual meetings, collaborate online, and deliver effective consulting services remotely. This allows us to work with clients regardless of geographical location.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(15,'How can your technology integration services benefit my business?','Our technology integration services focus on streamlining business processes through the effective use of technology. By integrating the right technologies, we help businesses enhance efficiency, improve communication, and stay competitive in today\'s rapidly evolving digital landscape.',1,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(16,'What sets your leadership development programs apart?','Our leadership development programs are designed to empower individuals at all levels of an organization. We go beyond traditional training, focusing on personalized coaching, mentorship, and experiential learning to cultivate effective and inspiring leaders within your company.',2,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(17,'How do you stay updated on industry trends and best practices?','We are committed to staying at the forefront of industry trends and best practices. Our team actively engages in continuous learning, participates in relevant conferences, and maintains a strong network of industry professionals to ensure that our consulting services are informed by the latest insights and innovations.',2,'published','2025-04-29 17:49:18','2025-04-29 17:49:18'),(18,'What measures do you take to ensure the quality of your consulting services?','We prioritize the quality of our consulting services by implementing rigorous quality assurance processes. This includes regular reviews of our methodologies, ongoing training for our consultants, and soliciting feedback from clients to continuously improve our service delivery.',1,'published','2025-04-29 17:49:18','2025-04-29 17:49:18');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Stunning Electric Cars of 2024','Omnis maiores odit tempora error qui fuga qui ratione. Sit rem ratione est.',0,0,'posts/7.jpg',1,'published','2025-04-29 17:49:48','2025-04-29 17:49:48'),(2,'Top Luxury Cars for Special Occasions','Ullam ut dignissimos veritatis eius. Qui modi veniam tempore nulla aut. Minima nulla quia id.',0,0,'posts/7.jpg',1,'published','2025-04-29 17:49:48','2025-04-29 17:49:48'),(3,'Family Cars with Advanced Safety Features','Nemo ut aut voluptatum. Praesentium ipsam molestiae rerum sunt inventore. Ea recusandae et quis suscipit doloribus.',0,0,'posts/5.jpg',1,'published','2025-04-29 17:49:48','2025-04-29 17:49:48'),(4,'Off-Road Vehicles in Action','Tempora dolores reprehenderit ut atque unde quis earum. Autem optio qui quia fuga qui asperiores.',0,0,'posts/9.jpg',1,'published','2025-04-29 17:49:48','2025-04-29 17:49:48'),(5,'The Evolution of Car Design: A Visual Journey','Laudantium incidunt saepe vel voluptatem sed quos ad. Placeat impedit illo assumenda sed. Quia voluptatem illo aut est similique.',0,0,'posts/1.jpg',1,'published','2025-04-29 17:49:48','2025-04-29 17:49:48'),(6,'Best Road Trip Cars of the Year','Qui incidunt eligendi incidunt dolorum et consequatur. Qui dicta cumque velit itaque vitae ut ut.',0,0,'posts/4.jpg',1,'published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(7,'Exclusive New Car Models Unveiled','Necessitatibus accusamus libero tempore. Qui est autem quia quos. Nobis atque dignissimos odio facilis culpa ut.',0,0,'posts/11.jpg',1,'published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(8,'Iconic Cars from Around the World','Qui consequatur dolore hic officiis. Quidem reprehenderit excepturi modi dolorem. Saepe aliquam dolorem voluptas iste.',0,0,'posts/19.jpg',1,'published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(9,'The Future of Electric and Hybrid Cars','Cupiditate non qui voluptatum ut cumque vitae. Doloribus explicabo blanditiis est ratione sapiente et. Dolore quae esse laborum eum corporis.',0,0,'posts/10.jpg',1,'published','2025-04-29 17:49:49','2025-04-29 17:49:49'),(10,'Luxury Car Interiors: A Closer Look','Perferendis in corrupti adipisci repellat. Quis sunt mollitia non qui aut. Accusamus aut eum illo quis illum voluptatem.',0,0,'posts/3.jpg',1,'published','2025-04-29 17:49:49','2025-04-29 17:49:49');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',1,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:48','2025-04-29 17:49:48'),(2,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',2,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:48','2025-04-29 17:49:48'),(3,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',3,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:48','2025-04-29 17:49:48'),(4,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',4,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:48','2025-04-29 17:49:48'),(5,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',5,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49'),(6,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',6,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49'),(7,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',7,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49'),(8,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',8,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49'),(9,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',9,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49'),(10,'[{\"img\":\"posts\\/1.jpg\",\"description\":\"\"},{\"img\":\"posts\\/2.jpg\",\"description\":\"\"},{\"img\":\"posts\\/3.jpg\",\"description\":\"\"},{\"img\":\"posts\\/4.jpg\",\"description\":\"\"},{\"img\":\"posts\\/5.jpg\",\"description\":\"\"},{\"img\":\"posts\\/6.jpg\",\"description\":\"\"},{\"img\":\"posts\\/7.jpg\",\"description\":\"\"},{\"img\":\"posts\\/8.jpg\",\"description\":\"\"}]',10,'Botble\\Gallery\\Models\\Gallery','2025-04-29 17:49:49','2025-04-29 17:49:49');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','125531a0d55197d47f961f1780693b62',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','d70c37fad23fa811daae04d81a7fb2b5',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','4aa5420e9af7c01b4c256e5d8d2953c6',1,'Botble\\SimpleSlider\\Models\\SimpleSlider');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/png',9268,'projects/1.png','[]','2025-04-29 17:49:08','2025-04-29 17:49:08',NULL,'public'),(2,0,'2','2',1,'image/png',9268,'projects/2.png','[]','2025-04-29 17:49:08','2025-04-29 17:49:08',NULL,'public'),(3,0,'3','3',1,'image/png',9268,'projects/3.png','[]','2025-04-29 17:49:09','2025-04-29 17:49:09',NULL,'public'),(4,0,'4','4',1,'image/png',9268,'projects/4.png','[]','2025-04-29 17:49:09','2025-04-29 17:49:09',NULL,'public'),(5,0,'5','5',1,'image/png',9268,'projects/5.png','[]','2025-04-29 17:49:09','2025-04-29 17:49:09',NULL,'public'),(6,0,'6','6',1,'image/png',9268,'projects/6.png','[]','2025-04-29 17:49:10','2025-04-29 17:49:10',NULL,'public'),(7,0,'7','7',1,'image/png',12093,'projects/7.png','[]','2025-04-29 17:49:10','2025-04-29 17:49:10',NULL,'public'),(8,0,'8','8',1,'image/png',12093,'projects/8.png','[]','2025-04-29 17:49:10','2025-04-29 17:49:10',NULL,'public'),(9,0,'1','1',2,'image/jpeg',230266,'services/1.jpg','[]','2025-04-29 17:49:10','2025-04-29 17:49:10',NULL,'public'),(10,0,'10','10',2,'image/jpeg',196018,'services/10.jpg','[]','2025-04-29 17:49:11','2025-04-29 17:49:11',NULL,'public'),(11,0,'2','2',2,'image/jpeg',369786,'services/2.jpg','[]','2025-04-29 17:49:11','2025-04-29 17:49:11',NULL,'public'),(12,0,'3','3',2,'image/jpeg',245886,'services/3.jpg','[]','2025-04-29 17:49:11','2025-04-29 17:49:11',NULL,'public'),(13,0,'4','4',2,'image/jpeg',257774,'services/4.jpg','[]','2025-04-29 17:49:12','2025-04-29 17:49:12',NULL,'public'),(14,0,'5','5',2,'image/jpeg',158866,'services/5.jpg','[]','2025-04-29 17:49:12','2025-04-29 17:49:12',NULL,'public'),(15,0,'6','6',2,'image/jpeg',180793,'services/6.jpg','[]','2025-04-29 17:49:12','2025-04-29 17:49:12',NULL,'public'),(16,0,'7','7',2,'image/jpeg',144859,'services/7.jpg','[]','2025-04-29 17:49:13','2025-04-29 17:49:13',NULL,'public'),(17,0,'8','8',2,'image/jpeg',146310,'services/8.jpg','[]','2025-04-29 17:49:13','2025-04-29 17:49:13',NULL,'public'),(18,0,'9','9',2,'image/jpeg',227162,'services/9.jpg','[]','2025-04-29 17:49:13','2025-04-29 17:49:13',NULL,'public'),(19,0,'android','android',3,'image/png',1089,'icons/android.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(20,0,'apple','apple',3,'image/png',1153,'icons/apple.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(21,0,'brave','brave',3,'image/png',2089,'icons/brave.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(22,0,'check','check',3,'image/png',692,'icons/check.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(23,0,'chrome','chrome',3,'image/png',2088,'icons/chrome.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(24,0,'contact','contact',3,'image/png',2705,'icons/contact.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(25,0,'finder','finder',3,'image/png',3054,'icons/finder.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(26,0,'firefox','firefox',3,'image/png',4406,'icons/firefox.png','[]','2025-04-29 17:49:14','2025-04-29 17:49:14',NULL,'public'),(27,0,'icon-1','icon-1',3,'image/png',2383,'icons/icon-1.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(28,0,'icon-10','icon-10',3,'image/png',2413,'icons/icon-10.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(29,0,'icon-11','icon-11',3,'image/png',2311,'icons/icon-11.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(30,0,'icon-12','icon-12',3,'image/png',2895,'icons/icon-12.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(31,0,'icon-13','icon-13',3,'image/png',1315,'icons/icon-13.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(32,0,'icon-14','icon-14',3,'image/png',1076,'icons/icon-14.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(33,0,'icon-15','icon-15',3,'image/png',3247,'icons/icon-15.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(34,0,'icon-16','icon-16',3,'image/png',2445,'icons/icon-16.png','[]','2025-04-29 17:49:15','2025-04-29 17:49:15',NULL,'public'),(35,0,'icon-17','icon-17',3,'image/png',2725,'icons/icon-17.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(36,0,'icon-18','icon-18',3,'image/png',2790,'icons/icon-18.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(37,0,'icon-2','icon-2',3,'image/png',2425,'icons/icon-2.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(38,0,'icon-3','icon-3',3,'image/png',1193,'icons/icon-3.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(39,0,'icon-4','icon-4',3,'image/png',2444,'icons/icon-4.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(40,0,'icon-5','icon-5',3,'image/png',1480,'icons/icon-5.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(41,0,'icon-6','icon-6',3,'image/png',1273,'icons/icon-6.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(42,0,'icon-7','icon-7',3,'image/png',1830,'icons/icon-7.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(43,0,'icon-8','icon-8',3,'image/png',439,'icons/icon-8.png','[]','2025-04-29 17:49:16','2025-04-29 17:49:16',NULL,'public'),(44,0,'icon-9','icon-9',3,'image/png',2194,'icons/icon-9.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(45,0,'icon-star','icon-star',3,'image/png',1988,'icons/icon-star.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(46,0,'linux','linux',3,'image/png',2935,'icons/linux.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(47,0,'opera-mini','opera-mini',3,'image/png',2809,'icons/opera-mini.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(48,0,'safari','safari',3,'image/png',3297,'icons/safari.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(49,0,'window','window',3,'image/png',457,'icons/window.png','[]','2025-04-29 17:49:17','2025-04-29 17:49:17',NULL,'public'),(50,0,'1','1',4,'image/png',6025,'teams/1.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(51,0,'2','2',4,'image/png',6025,'teams/2.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(52,0,'3','3',4,'image/png',6025,'teams/3.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(53,0,'4','4',4,'image/png',6025,'teams/4.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(54,0,'5','5',4,'image/png',6025,'teams/5.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(55,0,'6','6',4,'image/png',6025,'teams/6.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(56,0,'7','7',4,'image/png',6025,'teams/7.png','[]','2025-04-29 17:49:18','2025-04-29 17:49:18',NULL,'public'),(57,0,'8','8',4,'image/png',6025,'teams/8.png','[]','2025-04-29 17:49:19','2025-04-29 17:49:19',NULL,'public'),(58,0,'avatar-1','avatar-1',5,'image/png',1895,'testimonials/avatar-1.png','[]','2025-04-29 17:49:19','2025-04-29 17:49:19',NULL,'public'),(59,0,'avatar-10','avatar-10',5,'image/png',1895,'testimonials/avatar-10.png','[]','2025-04-29 17:49:19','2025-04-29 17:49:19',NULL,'public'),(60,0,'avatar-11','avatar-11',5,'image/png',1895,'testimonials/avatar-11.png','[]','2025-04-29 17:49:19','2025-04-29 17:49:19',NULL,'public'),(61,0,'avatar-12','avatar-12',5,'image/png',1895,'testimonials/avatar-12.png','[]','2025-04-29 17:49:19','2025-04-29 17:49:19',NULL,'public'),(62,0,'avatar-13','avatar-13',5,'image/png',1895,'testimonials/avatar-13.png','[]','2025-04-29 17:49:20','2025-04-29 17:49:20',NULL,'public'),(63,0,'avatar-14','avatar-14',5,'image/png',1895,'testimonials/avatar-14.png','[]','2025-04-29 17:49:20','2025-04-29 17:49:20',NULL,'public'),(64,0,'avatar-15','avatar-15',5,'image/png',1895,'testimonials/avatar-15.png','[]','2025-04-29 17:49:20','2025-04-29 17:49:20',NULL,'public'),(65,0,'avatar-16','avatar-16',5,'image/png',1895,'testimonials/avatar-16.png','[]','2025-04-29 17:49:20','2025-04-29 17:49:20',NULL,'public'),(66,0,'avatar-17','avatar-17',5,'image/png',1895,'testimonials/avatar-17.png','[]','2025-04-29 17:49:21','2025-04-29 17:49:21',NULL,'public'),(67,0,'avatar-18','avatar-18',5,'image/png',1895,'testimonials/avatar-18.png','[]','2025-04-29 17:49:21','2025-04-29 17:49:21',NULL,'public'),(68,0,'avatar-19','avatar-19',5,'image/png',1895,'testimonials/avatar-19.png','[]','2025-04-29 17:49:21','2025-04-29 17:49:21',NULL,'public'),(69,0,'avatar-2','avatar-2',5,'image/png',1895,'testimonials/avatar-2.png','[]','2025-04-29 17:49:21','2025-04-29 17:49:21',NULL,'public'),(70,0,'avatar-20','avatar-20',5,'image/png',1895,'testimonials/avatar-20.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(71,0,'avatar-3','avatar-3',5,'image/png',1895,'testimonials/avatar-3.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(72,0,'avatar-4','avatar-4',5,'image/png',1441,'testimonials/avatar-4.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(73,0,'avatar-5','avatar-5',5,'image/png',1895,'testimonials/avatar-5.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(74,0,'avatar-6','avatar-6',5,'image/png',1895,'testimonials/avatar-6.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(75,0,'avatar-7','avatar-7',5,'image/png',1895,'testimonials/avatar-7.png','[]','2025-04-29 17:49:22','2025-04-29 17:49:22',NULL,'public'),(76,0,'avatar-8','avatar-8',5,'image/png',1895,'testimonials/avatar-8.png','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(77,0,'avatar-9','avatar-9',5,'image/png',1895,'testimonials/avatar-9.png','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(78,0,'1','1',6,'image/jpeg',10371,'posts/1.jpg','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(79,0,'10','10',6,'image/jpeg',10371,'posts/10.jpg','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(80,0,'11','11',6,'image/jpeg',10371,'posts/11.jpg','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(81,0,'12','12',6,'image/jpeg',10371,'posts/12.jpg','[]','2025-04-29 17:49:23','2025-04-29 17:49:23',NULL,'public'),(82,0,'13','13',6,'image/jpeg',10371,'posts/13.jpg','[]','2025-04-29 17:49:24','2025-04-29 17:49:24',NULL,'public'),(83,0,'14','14',6,'image/jpeg',10371,'posts/14.jpg','[]','2025-04-29 17:49:24','2025-04-29 17:49:24',NULL,'public'),(84,0,'15','15',6,'image/jpeg',10371,'posts/15.jpg','[]','2025-04-29 17:49:24','2025-04-29 17:49:24',NULL,'public'),(85,0,'16','16',6,'image/jpeg',10371,'posts/16.jpg','[]','2025-04-29 17:49:24','2025-04-29 17:49:24',NULL,'public'),(86,0,'17','17',6,'image/jpeg',10371,'posts/17.jpg','[]','2025-04-29 17:49:24','2025-04-29 17:49:24',NULL,'public'),(87,0,'18','18',6,'image/jpeg',10371,'posts/18.jpg','[]','2025-04-29 17:49:25','2025-04-29 17:49:25',NULL,'public'),(88,0,'19','19',6,'image/jpeg',10371,'posts/19.jpg','[]','2025-04-29 17:49:25','2025-04-29 17:49:25',NULL,'public'),(89,0,'2','2',6,'image/jpeg',10371,'posts/2.jpg','[]','2025-04-29 17:49:25','2025-04-29 17:49:25',NULL,'public'),(90,0,'20','20',6,'image/jpeg',10371,'posts/20.jpg','[]','2025-04-29 17:49:25','2025-04-29 17:49:25',NULL,'public'),(91,0,'3','3',6,'image/jpeg',10371,'posts/3.jpg','[]','2025-04-29 17:49:26','2025-04-29 17:49:26',NULL,'public'),(92,0,'4','4',6,'image/jpeg',10371,'posts/4.jpg','[]','2025-04-29 17:49:26','2025-04-29 17:49:26',NULL,'public'),(93,0,'5','5',6,'image/jpeg',10371,'posts/5.jpg','[]','2025-04-29 17:49:26','2025-04-29 17:49:26',NULL,'public'),(94,0,'6','6',6,'image/jpeg',10371,'posts/6.jpg','[]','2025-04-29 17:49:27','2025-04-29 17:49:27',NULL,'public'),(95,0,'7','7',6,'image/jpeg',10371,'posts/7.jpg','[]','2025-04-29 17:49:27','2025-04-29 17:49:27',NULL,'public'),(96,0,'8','8',6,'image/jpeg',10371,'posts/8.jpg','[]','2025-04-29 17:49:28','2025-04-29 17:49:28',NULL,'public'),(97,0,'9','9',6,'image/jpeg',10371,'posts/9.jpg','[]','2025-04-29 17:49:28','2025-04-29 17:49:28',NULL,'public'),(212,0,'1','1',12,'image/png',26356,'sliders/1.png','[]','2025-04-29 17:49:48','2025-04-29 17:49:48',NULL,'public'),(213,0,'2','2',12,'image/png',26356,'sliders/2.png','[]','2025-04-29 17:49:48','2025-04-29 17:49:48',NULL,'public'),(214,0,'banner','banner',13,'image/jpeg',369786,'careers/banner.jpg','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(215,0,'1','1',14,'image/png',1659,'partners/1.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(216,0,'2','2',14,'image/png',1659,'partners/2.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(217,0,'3','3',14,'image/png',1659,'partners/3.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(218,0,'4','4',14,'image/png',1659,'partners/4.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(219,0,'5','5',14,'image/png',1659,'partners/5.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(220,0,'6','6',14,'image/png',1659,'partners/6.png','[]','2025-04-29 17:49:49','2025-04-29 17:49:49',NULL,'public'),(221,0,'7','7',14,'image/png',1659,'partners/7.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(222,0,'8','8',14,'image/png',1659,'partners/8.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(223,0,'icon-1','icon-1',14,'image/png',1659,'partners/icon-1.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(224,0,'icon-2','icon-2',14,'image/png',1659,'partners/icon-2.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(225,0,'icon-3','icon-3',14,'image/png',1659,'partners/icon-3.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(226,0,'icon-4','icon-4',14,'image/png',1659,'partners/icon-4.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(227,0,'icon-5','icon-5',14,'image/png',1659,'partners/icon-5.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(228,0,'icon-6','icon-6',14,'image/png',1659,'partners/icon-6.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(229,0,'icon-7','icon-7',14,'image/png',1659,'partners/icon-7.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(230,0,'icon-8','icon-8',14,'image/png',1659,'partners/icon-8.png','[]','2025-04-29 17:49:50','2025-04-29 17:49:50',NULL,'public'),(231,0,'icon-9','icon-9',14,'image/png',1659,'partners/icon-9.png','[]','2025-04-29 17:49:51','2025-04-29 17:49:51',NULL,'public'),(232,0,'bg-line-bottom','bg-line-bottom',15,'image/png',29676,'backgrounds/bg-line-bottom.png','[]','2025-04-29 17:49:51','2025-04-29 17:49:51',NULL,'public'),(233,0,'bg-line-col','bg-line-col',15,'image/png',5754,'backgrounds/bg-line-col.png','[]','2025-04-29 17:49:51','2025-04-29 17:49:51',NULL,'public'),(234,0,'breadcrumb','breadcrumb',15,'image/png',24620,'backgrounds/breadcrumb.png','[]','2025-04-29 17:49:51','2025-04-29 17:49:51',NULL,'public'),(235,0,'contact','contact',15,'image/png',269922,'backgrounds/contact.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(236,0,'faqs','faqs',15,'image/png',24515,'backgrounds/faqs.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(237,0,'feature-2','feature-2',15,'image/png',9504,'backgrounds/feature-2.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(238,0,'feature-3','feature-3',15,'image/png',11841,'backgrounds/feature-3.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(239,0,'feature','feature',15,'image/png',14912,'backgrounds/feature.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(240,0,'hb-bottom','hb-bottom',15,'image/png',10215,'backgrounds/hb-bottom.png','[]','2025-04-29 17:49:52','2025-04-29 17:49:52',NULL,'public'),(241,0,'hb-right','hb-right',15,'image/png',290762,'backgrounds/hb-right.png','[]','2025-04-29 17:49:53','2025-04-29 17:49:53',NULL,'public'),(242,0,'newsletter-left','newsletter-left',15,'image/png',8237,'backgrounds/newsletter-left.png','[]','2025-04-29 17:49:53','2025-04-29 17:49:53',NULL,'public'),(243,0,'newsletter','newsletter',15,'image/png',17476,'backgrounds/newsletter.png','[]','2025-04-29 17:49:53','2025-04-29 17:49:53',NULL,'public'),(244,0,'service-detail-feature','service-detail-feature',15,'image/png',6997,'backgrounds/service-detail-feature.png','[]','2025-04-29 17:49:53','2025-04-29 17:49:53',NULL,'public'),(245,0,'service','service',15,'image/png',518968,'backgrounds/service.png','[]','2025-04-29 17:49:54','2025-04-29 17:49:54',NULL,'public'),(246,0,'team','team',15,'image/png',40164,'backgrounds/team.png','[]','2025-04-29 17:49:54','2025-04-29 17:49:54',NULL,'public'),(247,0,'testimonial','testimonial',15,'image/png',25147,'backgrounds/testimonial.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(248,0,'1','1',16,'image/png',5501,'shapes/1.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(249,0,'2','2',16,'image/png',4663,'shapes/2.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(250,0,'3','3',16,'image/png',4866,'shapes/3.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(251,0,'4','4',16,'image/png',1927,'shapes/4.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(252,0,'icon-contact','icon-contact',16,'image/png',2679,'shapes/icon-contact.png','[]','2025-04-29 17:49:55','2025-04-29 17:49:55',NULL,'public'),(253,0,'img-favicon','img-favicon',16,'image/png',16493,'shapes/img-favicon.png','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(254,0,'site-statistics-decorate','site-statistics-decorate',16,'image/png',4397,'shapes/site-statistics-decorate.png','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(255,0,'testimonial-star','testimonial-star',16,'image/png',4416,'shapes/testimonial-star.png','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(256,0,'404','404',17,'image/png',59748,'general/404.png','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(257,0,'about-us-information-2-1','about-us-information-2-1',17,'image/jpeg',21828,'general/about-us-information-2-1.jpeg','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(258,0,'about-us-information-img','about-us-information-img',17,'image/png',8769,'general/about-us-information-img.png','[]','2025-04-29 17:49:56','2025-04-29 17:49:56',NULL,'public'),(259,0,'about-us-information-tabs-1','about-us-information-tabs-1',17,'image/png',9348,'general/about-us-information-tabs-1.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(260,0,'about-us-information-tabs-2','about-us-information-tabs-2',17,'image/png',4373,'general/about-us-information-tabs-2.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(261,0,'about-us-information-tabs-3','about-us-information-tabs-3',17,'image/png',5152,'general/about-us-information-tabs-3.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(262,0,'about-us-information-tabs-4','about-us-information-tabs-4',17,'image/png',5315,'general/about-us-information-tabs-4.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(263,0,'app-downloads-img','app-downloads-img',17,'image/png',13226,'general/app-downloads-img.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(264,0,'app-payment-1','app-payment-1',17,'image/png',1055,'general/app-payment-1.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(265,0,'app-payment-2','app-payment-2',17,'image/png',1088,'general/app-payment-2.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(266,0,'app-payment-3','app-payment-3',17,'image/png',1088,'general/app-payment-3.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(267,0,'app-payment-4','app-payment-4',17,'image/png',1088,'general/app-payment-4.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(268,0,'apple-store','apple-store',17,'image/png',1088,'general/apple-store.png','[]','2025-04-29 17:49:57','2025-04-29 17:49:57',NULL,'public'),(269,0,'author-avatar','author-avatar',17,'image/png',829,'general/author-avatar.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(270,0,'author-signature','author-signature',17,'image/png',3986,'general/author-signature.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(271,0,'call-to-action-1','call-to-action-1',17,'image/png',3935,'general/call-to-action-1.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(272,0,'call-to-action-2','call-to-action-2',17,'image/png',3211,'general/call-to-action-2.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(273,0,'contact-block','contact-block',17,'image/png',27069,'general/contact-block.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(274,0,'customer-reviews','customer-reviews',17,'image/png',1336,'general/customer-reviews.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(275,0,'faqs-4-1','faqs-4-1',17,'image/png',1700,'general/faqs-4-1.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(276,0,'faqs-4-2','faqs-4-2',17,'image/png',1539,'general/faqs-4-2.png','[]','2025-04-29 17:49:58','2025-04-29 17:49:58',NULL,'public'),(277,0,'faqs-img-2','faqs-img-2',17,'image/png',14774,'general/faqs-img-2.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(278,0,'favicon','favicon',17,'image/png',5745,'general/favicon.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(279,0,'feature-tabs-1','feature-tabs-1',17,'image/png',6181,'general/feature-tabs-1.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(280,0,'feature-tabs-2','feature-tabs-2',17,'image/png',6181,'general/feature-tabs-2.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(281,0,'feature-tabs-3','feature-tabs-3',17,'image/png',6181,'general/feature-tabs-3.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(282,0,'feature-tabs-4','feature-tabs-4',17,'image/png',6181,'general/feature-tabs-4.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(283,0,'feature-tabs-5','feature-tabs-5',17,'image/png',6181,'general/feature-tabs-5.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(284,0,'feature-tabs-6','feature-tabs-6',17,'image/png',6181,'general/feature-tabs-6.png','[]','2025-04-29 17:49:59','2025-04-29 17:49:59',NULL,'public'),(285,0,'features-10','features-10',17,'image/png',8491,'general/features-10.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(286,0,'features-4-1','features-4-1',17,'image/png',10249,'general/features-4-1.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(287,0,'features-4-2','features-4-2',17,'image/png',10249,'general/features-4-2.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(288,0,'features-5','features-5',17,'image/png',8308,'general/features-5.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(289,0,'features-6','features-6',17,'image/png',12294,'general/features-6.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(290,0,'features-7','features-7',17,'image/png',13812,'general/features-7.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(291,0,'features-8','features-8',17,'image/png',12294,'general/features-8.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(292,0,'features-9-1','features-9-1',17,'image/png',12142,'general/features-9-1.png','[]','2025-04-29 17:50:00','2025-04-29 17:50:00',NULL,'public'),(293,0,'features-9-2','features-9-2',17,'image/png',9907,'general/features-9-2.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(294,0,'google-play','google-play',17,'image/png',1055,'general/google-play.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(295,0,'hero-banner-2','hero-banner-2',17,'image/png',16796,'general/hero-banner-2.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(296,0,'hero-banner-3-1','hero-banner-3-1',17,'image/png',4802,'general/hero-banner-3-1.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(297,0,'hero-banner-3-2','hero-banner-3-2',17,'image/png',4802,'general/hero-banner-3-2.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(298,0,'hero-banner-3-3','hero-banner-3-3',17,'image/png',4802,'general/hero-banner-3-3.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(299,0,'hero-banner-3-4','hero-banner-3-4',17,'image/png',4802,'general/hero-banner-3-4.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(300,0,'instruction-steps-img','instruction-steps-img',17,'image/png',17764,'general/instruction-steps-img.png','[]','2025-04-29 17:50:01','2025-04-29 17:50:01',NULL,'public'),(301,0,'line-bg','line-bg',17,'image/png',137399,'general/line-bg.png','[]','2025-04-29 17:50:02','2025-04-29 17:50:02',NULL,'public'),(302,0,'logo-dark','logo-dark',17,'image/png',9772,'general/logo-dark.png','[]','2025-04-29 17:50:02','2025-04-29 17:50:02',NULL,'public'),(303,0,'logo-white','logo-white',17,'image/png',8576,'general/logo-white.png','[]','2025-04-29 17:50:02','2025-04-29 17:50:02',NULL,'public'),(304,0,'mastercard','mastercard',17,'image/png',929,'general/mastercard.png','[]','2025-04-29 17:50:02','2025-04-29 17:50:02',NULL,'public'),(305,0,'microsoft','microsoft',17,'image/png',1088,'general/microsoft.png','[]','2025-04-29 17:50:02','2025-04-29 17:50:02',NULL,'public'),(306,0,'newsletter-bg','newsletter-bg',17,'image/png',529422,'general/newsletter-bg.png','[]','2025-04-29 17:50:03','2025-04-29 17:50:03',NULL,'public'),(307,0,'our-history-2','our-history-2',17,'image/png',7300,'general/our-history-2.png','[]','2025-04-29 17:50:03','2025-04-29 17:50:03',NULL,'public'),(308,0,'our-history-3','our-history-3',17,'image/png',9878,'general/our-history-3.png','[]','2025-04-29 17:50:03','2025-04-29 17:50:03',NULL,'public'),(309,0,'our-history-4','our-history-4',17,'image/png',16994,'general/our-history-4.png','[]','2025-04-29 17:50:03','2025-04-29 17:50:03',NULL,'public'),(310,0,'our-mission-3','our-mission-3',17,'image/png',12501,'general/our-mission-3.png','[]','2025-04-29 17:50:03','2025-04-29 17:50:03',NULL,'public'),(311,0,'our-mission-img-1','our-mission-img-1',17,'image/png',15539,'general/our-mission-img-1.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(312,0,'our-mission-img-2-1','our-mission-img-2-1',17,'image/png',13622,'general/our-mission-img-2-1.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(313,0,'our-mission-img-2-2','our-mission-img-2-2',17,'image/png',5389,'general/our-mission-img-2-2.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(314,0,'our-mission-img-2','our-mission-img-2',17,'image/png',1907,'general/our-mission-img-2.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(315,0,'our-mission-img','our-mission-img',17,'image/png',7336,'general/our-mission-img.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(316,0,'paypal','paypal',17,'image/png',783,'general/paypal.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(317,0,'platforms-featured-1','platforms-featured-1',17,'image/png',9021,'general/platforms-featured-1.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(318,0,'platforms-featured-2-1','platforms-featured-2-1',17,'image/png',8162,'general/platforms-featured-2-1.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(319,0,'platforms-featured-2-2','platforms-featured-2-2',17,'image/png',3449,'general/platforms-featured-2-2.png','[]','2025-04-29 17:50:04','2025-04-29 17:50:04',NULL,'public'),(320,0,'skrill','skrill',17,'image/png',779,'general/skrill.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(321,0,'star-rotate','star-rotate',17,'image/png',2806,'general/star-rotate.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(322,0,'stripe','stripe',17,'image/png',825,'general/stripe.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(323,0,'team-3','team-3',17,'image/png',14558,'general/team-3.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(324,0,'work-process-1','work-process-1',17,'image/png',12918,'general/work-process-1.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(325,0,'work-process-2','work-process-2',17,'image/png',12918,'general/work-process-2.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(326,0,'work-process-3','work-process-3',17,'image/png',12918,'general/work-process-3.png','[]','2025-04-29 17:50:05','2025-04-29 17:50:05',NULL,'public'),(327,0,'work-process-4','work-process-4',17,'image/png',12918,'general/work-process-4.png','[]','2025-04-29 17:50:06','2025-04-29 17:50:06',NULL,'public'),(328,0,'sample','sample',18,'application/pdf',18810,'docs/sample.pdf','[]','2025-04-29 17:50:06','2025-04-29 17:50:06',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'projects',NULL,'projects',0,'2025-04-29 17:49:08','2025-04-29 17:49:08',NULL),(2,0,'services',NULL,'services',0,'2025-04-29 17:49:10','2025-04-29 17:49:10',NULL),(3,0,'icons',NULL,'icons',0,'2025-04-29 17:49:14','2025-04-29 17:49:14',NULL),(4,0,'teams',NULL,'teams',0,'2025-04-29 17:49:18','2025-04-29 17:49:18',NULL),(5,0,'testimonials',NULL,'testimonials',0,'2025-04-29 17:49:19','2025-04-29 17:49:19',NULL),(6,0,'posts',NULL,'posts',0,'2025-04-29 17:49:23','2025-04-29 17:49:23',NULL),(12,0,'sliders',NULL,'sliders',0,'2025-04-29 17:49:48','2025-04-29 17:49:48',NULL),(13,0,'careers',NULL,'careers',0,'2025-04-29 17:49:49','2025-04-29 17:49:49',NULL),(14,0,'partners',NULL,'partners',0,'2025-04-29 17:49:49','2025-04-29 17:49:49',NULL),(15,0,'backgrounds',NULL,'backgrounds',0,'2025-04-29 17:49:51','2025-04-29 17:49:51',NULL),(16,0,'shapes',NULL,'shapes',0,'2025-04-29 17:49:55','2025-04-29 17:49:55',NULL),(17,0,'general',NULL,'general',0,'2025-04-29 17:49:56','2025-04-29 17:49:56',NULL),(18,0,'docs',NULL,'docs',0,'2025-04-29 17:50:06','2025-04-29 17:50:06',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-04-29 17:49:48','2025-04-29 17:49:48');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'#',NULL,0,'Home',NULL,'_self',1,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(2,1,1,NULL,NULL,'https://infinia.botble.com',NULL,0,'Home v.1',NULL,'_blank',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(3,1,1,NULL,NULL,'https://infinia-home-2.botble.com',NULL,1,'Home v.2',NULL,'_blank',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(4,1,1,NULL,NULL,'https://infinia-home-3.botble.com',NULL,2,'Home v.3',NULL,'_blank',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(5,1,1,NULL,NULL,'https://infinia-home-4.botble.com',NULL,3,'Home v.4',NULL,'_blank',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(6,1,1,NULL,NULL,'https://infinia-home-5.botble.com',NULL,4,'Home v.5',NULL,'_blank',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(7,1,0,NULL,NULL,'#',NULL,1,'About Us',NULL,'_self',1,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(8,1,7,14,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(9,1,7,15,'Botble\\Page\\Models\\Page','/about-us-v2',NULL,1,'About Us v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(10,1,7,16,'Botble\\Page\\Models\\Page','/about-us-v3',NULL,2,'About Us v.3',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(11,1,0,NULL,NULL,'#',NULL,2,'Pages',NULL,'_self',1,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(12,1,11,2,'Botble\\Page\\Models\\Page','/projects',NULL,0,'Projects',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(13,1,11,3,'Botble\\Page\\Models\\Page','/services',NULL,1,'Services v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(14,1,11,4,'Botble\\Page\\Models\\Page','/services-v2',NULL,2,'Services v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(15,1,11,5,'Botble\\Page\\Models\\Page','/services-v3',NULL,3,'Services v.3',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(16,1,11,NULL,NULL,'/services/research-planning',NULL,4,'Services Detail v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(17,1,11,NULL,NULL,'/services/research-planning?style=style-2',NULL,5,'Services Detail v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(18,1,11,17,'Botble\\Page\\Models\\Page','/pricing',NULL,6,'Pricing v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(19,1,11,18,'Botble\\Page\\Models\\Page','/pricing-v2',NULL,7,'Pricing v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(20,1,11,19,'Botble\\Page\\Models\\Page','/pricing-v3',NULL,8,'Pricing v.3',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(21,1,11,6,'Botble\\Page\\Models\\Page','/our-team',NULL,9,'Our Team v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(22,1,11,7,'Botble\\Page\\Models\\Page','/our-team-v2',NULL,10,'Our Team v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(23,1,11,8,'Botble\\Page\\Models\\Page','/our-team-v3',NULL,11,'Our Team v.3',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(24,1,11,9,'Botble\\Page\\Models\\Page','/our-team-v4',NULL,12,'Our Team v.4',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(25,1,11,10,'Botble\\Page\\Models\\Page','/our-team-v5',NULL,13,'Our Team v.5',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(26,1,11,11,'Botble\\Page\\Models\\Page','/our-team-v6',NULL,14,'Our Team v.6',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(27,1,11,NULL,NULL,'/teams/jennifer-brown',NULL,15,'Team Detail v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(28,1,11,NULL,NULL,'/teams/jennifer-brown?style=style-2',NULL,16,'Team Detail v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(29,1,11,21,'Botble\\Page\\Models\\Page','/features',NULL,17,'Features v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(30,1,11,22,'Botble\\Page\\Models\\Page','/features-v2',NULL,18,'Features v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(31,1,11,24,'Botble\\Page\\Models\\Page','/work-process',NULL,19,'Work Process',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(32,1,11,26,'Botble\\Page\\Models\\Page','/book-a-demo',NULL,20,'Book a demo',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(33,1,11,25,'Botble\\Page\\Models\\Page','/page-integration',NULL,21,'Page Integration',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(34,1,11,20,'Botble\\Page\\Models\\Page','/coming-soon',NULL,22,'Coming Soon',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(35,1,11,23,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,23,'Privacy Policy',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(36,1,0,NULL,NULL,'#',NULL,3,'Blog',NULL,'_self',1,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(37,1,36,NULL,NULL,'/blog',NULL,0,'Blog v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(38,1,36,NULL,NULL,'/blog?style=style-2',NULL,1,'Blog v.2',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(39,1,36,NULL,NULL,'/adapting-to-the-new-web-development-trends-in-2024',NULL,2,'Blog Detail v.1',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(40,1,0,13,'Botble\\Page\\Models\\Page','/contact',NULL,4,'Contact',NULL,'_self',0,'2025-04-29 17:49:48','2025-04-29 17:49:48');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main Menu','main-menu','published','2025-04-29 17:49:48','2025-04-29 17:49:48');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon_image','[\"icons\\/icon-6.png\"]',1,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(2,'icon_image','[\"icons\\/icon-7.png\"]',2,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(3,'icon_image','[\"icons\\/icon-8.png\"]',3,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(4,'icon_image','[\"icons\\/icon-9.png\"]',4,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(5,'icon_image','[\"icons\\/icon-10.png\"]',5,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(6,'icon_image','[\"icons\\/icon-11.png\"]',6,'Botble\\Portfolio\\Models\\Service','2025-04-29 17:49:17','2025-04-29 17:49:17'),(7,'link','[\"https:\\/\\/example.com\\/e-commerce\"]',1,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(8,'category_ids','[[1]]',1,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(9,'link','[\"https:\\/\\/example.com\\/mobile-app\"]',2,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(10,'category_ids','[[2]]',2,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(11,'link','[\"https:\\/\\/example.com\\/portfolio\"]',3,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(12,'category_ids','[[1,2]]',3,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(13,'link','[\"https:\\/\\/example.com\\/seo-marketing\"]',4,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(14,'category_ids','[[3,4]]',4,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(15,'link','[\"https:\\/\\/example.com\\/crm\"]',5,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(16,'category_ids','[[1,3]]',5,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(17,'link','[\"https:\\/\\/example.com\\/lms\"]',6,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(18,'category_ids','[[2,4]]',6,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(19,'link','[\"https:\\/\\/example.com\\/healthcare-app\"]',7,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(20,'category_ids','[[1,5]]',7,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(21,'link','[\"https:\\/\\/example.com\\/real-estate\"]',8,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(22,'category_ids','[[1,6]]',8,'Botble\\Portfolio\\Models\\Project','2025-04-29 17:49:17','2025-04-29 17:49:17'),(23,'breadcrumb_enabled','[\"0\"]',1,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(24,'breadcrumb_enabled','[\"0\"]',2,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(25,'breadcrumb_enabled','[\"1\"]',3,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(26,'breadcrumb_enabled','[\"0\"]',4,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(27,'breadcrumb_enabled','[\"1\"]',5,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(28,'breadcrumb_enabled','[\"0\"]',6,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(29,'breadcrumb_enabled','[\"0\"]',7,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(30,'breadcrumb_enabled','[\"0\"]',8,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(31,'breadcrumb_enabled','[\"0\"]',9,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(32,'breadcrumb_enabled','[\"0\"]',10,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(33,'breadcrumb_enabled','[\"0\"]',11,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(34,'breadcrumb_enabled','[\"0\"]',12,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(35,'breadcrumb_enabled','[\"0\"]',13,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(36,'breadcrumb_enabled','[\"0\"]',21,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(37,'breadcrumb_enabled','[\"0\"]',22,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(38,'breadcrumb_enabled','[\"0\"]',24,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(39,'breadcrumb_enabled','[\"0\"]',25,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(40,'breadcrumb_enabled','[\"0\"]',26,'Botble\\Page\\Models\\Page','2025-04-29 17:49:47','2025-04-29 17:49:47'),(41,'subtitle','[\"\\ud83d\\ude80 Welcome to Infinia\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(42,'slogan','[\"20+ Years of Experience\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(43,'primary_action_label','[\"View Our Services\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(44,'primary_action_url','[\"\\/contact\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(45,'primary_action_icon','[\"ti ti-arrow-up-right\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(46,'secondary_action_label','[\"Video Guide\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(47,'secondary_action_url','[\"https:\\/\\/www.youtube.com\\/watch?v=tRxGSHL8bI0\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(48,'secondary_action_icon','[\"ti ti-player-play\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(49,'background_image','[\"backgrounds\\/team.png\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(50,'subtitle','[\"\\ud83d\\ude80 Welcome to Infinia\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(51,'slogan','[\"20+ Years of Experience\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(52,'primary_action_label','[\"View Our Services\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(53,'primary_action_url','[\"\\/contact\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(54,'primary_action_icon','[\"ti ti-arrow-up-right\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(55,'secondary_action_label','[\"Video Guide\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(56,'secondary_action_url','[\"https:\\/\\/www.youtube.com\\/watch?v=tRxGSHL8bI0\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(57,'secondary_action_icon','[\"ti ti-player-play\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(58,'background_image','[\"backgrounds\\/team.png\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-04-29 17:49:48','2025-04-29 17:49:48'),(59,'image','[\"careers\\/banner.jpg\"]',1,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(60,'icon','[\"ti ti-chart-bar\"]',1,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(61,'apply_url','[\"\\/contact-us\"]',1,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(62,'image','[\"careers\\/banner.jpg\"]',2,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(63,'icon','[\"ti ti-replace\"]',2,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(64,'apply_url','[\"\\/contact-us\"]',2,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(65,'image','[\"careers\\/banner.jpg\"]',3,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(66,'icon','[\"ti ti-components\"]',3,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(67,'apply_url','[\"\\/contact-us\"]',3,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(68,'image','[\"careers\\/banner.jpg\"]',4,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(69,'icon','[\"ti ti-brand-deezer\"]',4,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(70,'apply_url','[\"\\/contact-us\"]',4,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(71,'image','[\"careers\\/banner.jpg\"]',5,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(72,'icon','[\"ti ti-video\"]',5,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(73,'apply_url','[\"\\/contact-us\"]',5,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(74,'image','[\"careers\\/banner.jpg\"]',6,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(75,'icon','[\"ti ti-device-desktop-code\"]',6,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49'),(76,'apply_url','[\"\\/contact-us\"]',6,'ArchiElite\\Career\\Models\\Career','2025-04-29 17:49:49','2025-04-29 17:49:49');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2015_06_18_033822_create_blog_table',1),(7,'2015_06_29_025744_create_audit_history',1),(8,'2016_06_10_230148_create_acl_tables',1),(9,'2016_06_14_230857_create_menus_table',1),(10,'2016_06_17_091537_create_contacts_table',1),(11,'2016_06_28_221418_create_pages_table',1),(12,'2016_10_03_032336_create_languages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_10_07_193005_create_translations_table',1),(15,'2016_10_13_150201_create_galleries_table',1),(16,'2016_11_28_032840_create_dashboard_widget_tables',1),(17,'2016_12_16_084601_create_widgets_table',1),(18,'2017_05_09_070343_create_media_tables',1),(19,'2017_07_11_140018_create_simple_slider_table',1),(20,'2017_10_24_154832_create_newsletter_table',1),(21,'2017_11_03_070450_create_slug_table',1),(22,'2018_07_09_214610_create_testimonial_table',1),(23,'2018_07_09_221238_create_faq_table',1),(24,'2019_01_05_053554_create_jobs_table',1),(25,'2019_06_24_211801_create_career_table',1),(26,'2019_08_19_000000_create_failed_jobs_table',1),(27,'2019_12_14_000001_create_personal_access_tokens_table',1),(28,'2021_02_16_092633_remove_default_value_for_author_type',1),(29,'2021_10_25_021023_fix-priority-load-for-language-advanced',1),(30,'2021_12_03_030600_create_blog_translations',1),(31,'2021_12_03_075608_create_page_translations',1),(32,'2021_12_03_082134_create_faq_translations',1),(33,'2021_12_03_082953_create_gallery_translations',1),(34,'2021_12_03_083642_create_testimonials_translations',1),(35,'2021_12_04_095357_create_careers_translations_table',1),(36,'2022_04_19_113923_add_index_to_table_posts',1),(37,'2022_04_20_100851_add_index_to_media_table',1),(38,'2022_04_20_101046_add_index_to_menu_table',1),(39,'2022_04_30_034048_create_gallery_meta_translations_table',1),(40,'2022_07_10_034813_move_lang_folder_to_root',1),(41,'2022_08_04_051940_add_missing_column_expires_at',1),(42,'2022_09_01_000001_create_admin_notifications_tables',1),(43,'2022_10_14_024629_drop_column_is_featured',1),(44,'2022_11_02_092723_team_create_team_table',1),(45,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(46,'2022_12_02_093615_update_slug_index_columns',1),(47,'2023_01_30_024431_add_alt_to_media_table',1),(48,'2023_02_16_042611_drop_table_password_resets',1),(49,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(50,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(51,'2023_07_06_011444_create_slug_translations_table',1),(52,'2023_07_25_072632_create_portfolio_tables',1),(53,'2023_08_11_060908_create_announcements_table',1),(54,'2023_08_11_094574_update_team_table',1),(55,'2023_08_21_090810_make_page_content_nullable',1),(56,'2023_08_29_074620_make_column_author_id_nullable',1),(57,'2023_08_29_075308_make_column_user_id_nullable',1),(58,'2023_09_11_023233_create_pf_custom_fields_table',1),(59,'2023_09_13_042633_add_columns_to_pf_projects_table',1),(60,'2023_09_13_044041_create_pf_project_categories_table',1),(61,'2023_09_14_021936_update_index_for_slugs_table',1),(62,'2023_09_14_022423_add_index_for_language_table',1),(63,'2023_09_20_050420_add_missing_translation_column',1),(64,'2023_09_22_061723_create_custom_fields_translations_table',1),(65,'2023_09_22_343531_remove_project_categories_table',1),(66,'2023_11_05_081701_fix_projects_table',1),(67,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',1),(68,'2023_11_14_033417_change_request_column_in_table_audit_histories',1),(69,'2023_11_17_063408_add_description_column_to_faq_categories_table',1),(70,'2023_11_30_085354_add_missing_description_to_team',1),(71,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(72,'2023_12_12_105220_drop_translations_table',1),(73,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(74,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',1),(75,'2024_03_25_000001_update_captcha_settings_for_contact',1),(76,'2024_03_25_000001_update_captcha_settings_for_newsletter',1),(77,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(78,'2024_04_19_063914_create_custom_fields_table',1),(79,'2024_04_27_100730_improve_analytics_setting',1),(80,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(81,'2024_05_16_060328_add_projects_translations_table',1),(82,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(83,'2024_07_12_100000_change_random_hash_for_media',1),(84,'2024_07_30_091615_fix_order_column_in_categories_table',1),(85,'2024_09_09_075552_add_action_field_pf_packages_table',1),(86,'2024_09_30_024515_create_sessions_table',1),(87,'2024_10_02_030027_add_more_columns_to_teams_translations_table',1),(88,'2024_11_14_024038_improve_pf_packages_table',1),(89,'2025_01_06_033807_add_default_value_for_categories_author_type',1),(90,'2025_01_19_145943_add_column_order_to_table_pf_services',1),(91,'2025_01_24_140458_fix-theme-option',1),(92,'2025_02_11_153025_add_action_label_to_announcement_translations',1),(93,'2025_04_03_000001_add_user_type_to_audit_histories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','[hero-banner style=&quot;2&quot; title=&quot;Online Conference Tools &lt;br&gt; &lt;b&gt; High-Quality &lt;/b&gt; Video and Audio&quot; subtitle=&quot;🚀 Free Lifetime Update&quot; image=&quot;general/hero-banner-2.png&quot; background_image=&quot;backgrounds/team.png&quot; primary_action_label=&quot;Get Started&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; secondary_action_label=&quot;Contact Us&quot; secondary_action_url=&quot;/contact-us&quot; secondary_action_icon=&quot;ti ti-phone-call&quot; floating_card_title=&quot;Features&quot; floating_card_description=&quot;Discover why hundreds of millions &lt;br&gt; people use Infinia to chat and call daily.&quot; quantity=&quot;5&quot; title_1=&quot;HD video calling&quot; title_2=&quot;Smart messaging&quot; title_3=&quot;Screen sharing&quot; title_4=&quot;Private conversations&quot; title_5=&quot;Call recording&quot; display_social_links=&quot;0,1&quot; social_links_box_title=&quot;Follow us:&quot;][/hero-banner]\n[partners style=&quot;4&quot; title=&quot;We always evaluate our skills &lt;br&gt; through our performance&quot; subtitle=&quot;Trusted by great companies&quot; quantity=&quot;20&quot; name_1=&quot;Framer&quot; image_1=&quot;partners/1.png&quot; url_1=&quot;https://google.com&quot; open_in_new_tab_1=&quot;1&quot; name_2=&quot;Reddit&quot; image_2=&quot;partners/2.png&quot; url_2=&quot;https://google.com&quot; open_in_new_tab_2=&quot;1&quot; name_3=&quot;Netflix&quot; image_3=&quot;partners/3.png&quot; url_3=&quot;https://google.com&quot; open_in_new_tab_3=&quot;1&quot; name_4=&quot;Microsoft&quot; image_4=&quot;partners/4.png&quot; url_4=&quot;https://google.com&quot; open_in_new_tab_4=&quot;1&quot; name_5=&quot;Discover&quot; image_5=&quot;partners/5.png&quot; url_5=&quot;https://google.com&quot; open_in_new_tab_5=&quot;1&quot; name_6=&quot;Lemon Squeezy&quot; image_6=&quot;partners/6.png&quot; url_6=&quot;https://google.com&quot; open_in_new_tab_6=&quot;1&quot; name_7=&quot;Paypal&quot; image_7=&quot;partners/7.png&quot; url_7=&quot;https://google.com&quot; open_in_new_tab_7=&quot;1&quot; name_8=&quot;Youtube&quot; image_8=&quot;partners/8.png&quot; url_8=&quot;https://google.com&quot; open_in_new_tab_8=&quot;1&quot; name_9=&quot;Spotify&quot; image_9=&quot;partners/5.png&quot; url_9=&quot;https://google.com&quot; open_in_new_tab_9=&quot;1&quot; name_10=&quot;Google&quot; image_10=&quot;partners/1.png&quot; url_10=&quot;https://google.com&quot; open_in_new_tab_10=&quot;1&quot; name_11=&quot;Amazon&quot; image_11=&quot;partners/1.png&quot; url_11=&quot;https://google.com&quot; open_in_new_tab_11=&quot;1&quot; name_12=&quot;Apple&quot; image_12=&quot;partners/2.png&quot; url_12=&quot;https://google.com&quot; open_in_new_tab_12=&quot;1&quot; name_13=&quot;Facebook&quot; image_13=&quot;partners/3.png&quot; url_13=&quot;https://google.com&quot; open_in_new_tab_13=&quot;1&quot; name_14=&quot;Twitter&quot; image_14=&quot;partners/3.png&quot; url_14=&quot;https://google.com&quot; open_in_new_tab_14=&quot;1&quot; name_15=&quot;Instagram&quot; image_15=&quot;partners/8.png&quot; url_15=&quot;https://google.com&quot; open_in_new_tab_15=&quot;1&quot; name_16=&quot;Slack&quot; image_16=&quot;partners/6.png&quot; url_16=&quot;https://google.com&quot; open_in_new_tab_16=&quot;1&quot; name_17=&quot;Tiktok&quot; image_17=&quot;partners/8.png&quot; url_17=&quot;https://google.com&quot; open_in_new_tab_17=&quot;1&quot; name_18=&quot;Pinterest&quot; image_18=&quot;partners/5.png&quot; url_18=&quot;https://google.com&quot; open_in_new_tab_18=&quot;1&quot; name_19=&quot;Medium&quot; image_19=&quot;partners/2.png&quot; url_19=&quot;https://google.com&quot; open_in_new_tab_19=&quot;1&quot; name_20=&quot;Linkedin&quot; image_20=&quot;partners/5.png&quot; url_20=&quot;https://google.com&quot; open_in_new_tab_20=&quot;1&quot; background_color=&quot;#111827&quot;][/partners]\n[services style=&quot;4&quot; title=&quot;Professional &lt;b&gt;UltraHD Video&lt;/b&gt; &lt;br&gt; &lt;b&gt;Conferencing&lt;/b&gt; Platform&quot; subtitle=&quot;WHAT WE OFFERS&quot; service_ids=&quot;1,3,4,6&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/contact&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot;][/services]\n[platforms-featured style=&quot;1&quot; title=&quot;All that&#039;s necessary for &lt;b&gt;effective team&lt;/b&gt; &lt;br&gt; &lt;b&gt;effort&lt;/b&gt;.&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; image=&quot;general/platforms-featured-1.png&quot; primary_action_label=&quot;Explore Now&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; quantity=&quot;5&quot; title_1=&quot;Team Messaging&quot; url_1=&quot;/&quot; title_2=&quot;4K Video&quot; url_2=&quot;/&quot; title_3=&quot;Ultimate Collaboration&quot; url_3=&quot;/&quot; title_4=&quot;Unified Communications&quot; url_4=&quot;/&quot; title_5=&quot;Advanced Meeting&quot; url_5=&quot;/&quot;][/platforms-featured]\n[platforms-featured style=&quot;2&quot; title=&quot;Experience the &lt;br&gt; &lt;b&gt; cutting-edge &lt;/b&gt; &lt;br&gt; capabilities&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; image=&quot;general/platforms-featured-2-1.png&quot; image_1=&quot;general/platforms-featured-2-2.png&quot; primary_action_label=&quot;Explore Now&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; bottom_description=&quot;Compatible with all operating systems and browsers in the world&quot; quantity=&quot;10&quot; title_1=&quot;MacOs&quot; url_1=&quot;/&quot; icon_image_1=&quot;icons/finder.png&quot; title_2=&quot;Windows&quot; url_2=&quot;/&quot; icon_image_2=&quot;icons/window.png&quot; title_3=&quot;Linux&quot; url_3=&quot;/&quot; icon_image_3=&quot;icons/linux.png&quot; title_4=&quot;Android&quot; url_4=&quot;/&quot; icon_image_4=&quot;icons/android.png&quot; title_5=&quot;iOS&quot; url_5=&quot;/&quot; icon_image_5=&quot;icons/apple.png&quot; title_6=&quot;Firefox&quot; url_6=&quot;/&quot; icon_image_6=&quot;icons/firefox.png&quot; title_7=&quot;Chrome&quot; url_7=&quot;/&quot; icon_image_7=&quot;icons/chrome.png&quot; title_8=&quot;Safari&quot; url_8=&quot;/&quot; icon_image_8=&quot;icons/safari.png&quot; title_9=&quot;Opera&quot; url_9=&quot;/&quot; icon_image_9=&quot;icons/opera-mini.png&quot; title_10=&quot;Brave&quot; url_10=&quot;/&quot; icon_image_10=&quot;icons/brave.png&quot;][/platforms-featured]\n[testimonials style=&quot;2&quot; title=&quot;&lt;b&gt; +100k users &lt;/b&gt; have loved &lt;br&gt; &lt;b&gt; Infinia Conference &lt;/b&gt; System&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; testimonial_ids=&quot;1,2,3,4,5,6&quot; primary_action_label=&quot;View More Testimonials&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/about-us&quot;][/testimonials]\n[site-statistics style=&quot;2&quot; title=&quot;Numbers Speaking for &lt;br&gt; Themselves&quot; quantity=&quot;4&quot; title_1=&quot;Users Active / Month&quot; data_1=&quot;500&quot; unit_1=&quot;k+&quot; title_2=&quot;New Download / Month&quot; data_2=&quot;38&quot; unit_2=&quot;k&quot; title_3=&quot;Operating countries&quot; data_3=&quot;150&quot; title_4=&quot;Businesses trust on the worldinfinia&quot; data_4=&quot;4000&quot; background_image=&quot;shapes/site-statistics-decorate.png&quot; background_color=&quot;#6d4df2&quot;][/site-statistics]\n[app-downloads title=&quot;Manage all &lt;br&gt; from anywhere&quot; subtitle=&quot;Download Mobile App&quot; description=&quot;⚡Don&#039;t miss any contact. Stay connected.&quot; image=&quot;general/app-downloads-img.png&quot; features=&quot;Beautiful and awesome interface | Online collaborative anytime, anywhere. | Real-time updates&quot; quantity=&quot;3&quot; name_1=&quot;Apple&quot; url_1=&quot;https://www.apple.com/&quot; image_1=&quot;general/apple-store.png&quot; name_2=&quot;Google Play&quot; url_2=&quot;https://play.google.com/&quot; image_2=&quot;general/google-play.png&quot; name_3=&quot;Microsoft&quot; url_3=&quot;https://www.microsoft.com/&quot; image_3=&quot;general/microsoft.png&quot; reviews_card_title=&quot; Trusted by 1M+ customers&quot; reviews_card_image=&quot;general/customer-reviews.png&quot; reviews_card_rate=&quot;4.8/5&quot; reviews_card_data=&quot;26&quot; reviews_card_unit=&quot;k Reviews&quot;][/app-downloads]\n[teams style=&quot;5&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6&quot; quantity=&quot;1&quot; title_1=&quot;+1 (24) 567 890&quot; subtitle_1=&quot;CONTACT US&quot; url_1=&quot;tel:124567890&quot; icon_image_1=&quot;icons/contact.png&quot;][/teams]\n[instruction-steps title=&quot;We make &lt;b&gt; things easy &lt;/b&gt; &lt;br&gt; &lt;b&gt; for &lt;/b&gt; your business&quot; subtitle=&quot;WHAT WE OFFERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; image=&quot;general/instruction-steps-img.png&quot; quantity=&quot;3&quot; title_1=&quot;Choose A Package&quot; description_1=&quot;A business consultant provides expert &lt;br&gt; advice and guidance to businesses on &lt;br&gt; various aspects.&quot; icon_image_1=&quot;icons/icon-16.png&quot; title_2=&quot;Make Secure Payment&quot; description_2=&quot;A business consultant provides expert &lt;br&gt; advice and guidance to businesses on &lt;br&gt; various aspects.&quot; icon_image_2=&quot;icons/icon-17.png&quot; title_3=&quot;Get Instant Access&quot; description_3=&quot;A business consultant provides expert &lt;br&gt; advice and guidance to businesses on &lt;br&gt; various aspects.&quot; icon_image_3=&quot;icons/icon-18.png&quot; primary_action_label=&quot;Join Free for 30 Days&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/contact&quot; secondary_action_label=&quot;Video Guide&quot; secondary_action_url=&quot;https://www.youtube.com/watch?v=tRxGSHL8bI0&quot; secondary_action_icon=&quot;ti ti-brand-youtube&quot; background_image=&quot;backgrounds/team.png&quot;][/instruction-steps]\n[pricing-plans style=&quot;2&quot; title=&quot;Pick Your Premium&quot; subtitle=&quot;OUR PLANS&quot; description=&quot;Upgrade to Spotify Premium and take your music journey to the next level. Enjoy uninterrupted music playback, even in offline mode&quot; features=&quot;Get 30 day free trial \\n You can cancel anytime \\n No any hidden fees pay \\n Monthly management&quot; bottom_title=&quot;Trusted by secure payment service&quot; quantity=&quot;4&quot; name_1=&quot;PayPal&quot; url_1=&quot;https://www.paypal.com/&quot; image_1=&quot;general/paypal.png&quot; name_2=&quot;Stripe&quot; url_2=&quot;https://www.stripe.com/&quot; image_2=&quot;general/stripe.png&quot; name_3=&quot;Mastercard&quot; url_3=&quot;https://www.mastercard.us/en-us.html&quot; image_3=&quot;general/mastercard.png&quot; name_4=&quot;Skrill&quot; url_4=&quot;https://www.skrill.com/&quot; image_4=&quot;general/skrill.png&quot; package_ids=&quot;1,2&quot;][/pricing-plans]\n[faqs style=&quot;2&quot; title=&quot;Frequently Asked  &lt;br&gt; Questions&quot; description=&quot;Find the answers to all of our most frequently asked questions&quot; image=&quot;general/faqs-img-2.png&quot; quantity=&quot;3&quot; title_1=&quot;Live chat support 24/7&quot; description_1=&quot;More than 300 employees are ready to help you&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Help desk support center&quot; description_2=&quot;Via ticket system. 24/7 available.&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Book a demo&quot; description_3=&quot;Live support via video call&quot; icon_image_3=&quot;icons/icon-15.png&quot; category_ids=&quot;1,2,3&quot; background_image=&quot;backgrounds/faqs.png&quot;][/faqs]\n[blog-posts style=&quot;3&quot; title=&quot;Our Latest &lt;br&gt; News and &lt;br&gt; Articles&quot; subtitle=&quot;FROM BLOG&quot; description=&quot;Explore the insights and trends shaping our industry. 🔥&quot; paginate=&quot;5&quot; action_label=&quot;See all articles&quot; action_url=&quot;/blog&quot; background_image=&quot;backgrounds/team.png&quot;][/blog-posts]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(2,'Projects','[projects title=&quot;All Case Studies&quot; subtitle=&quot;What We Offer&quot; description=&quot;We help you to bring success fast&quot;][/projects]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(3,'Services','[services subtitle=&quot;WHAT WE OFFERS&quot; title=&quot;Explore Our Services&quot; description=&quot;By doing a financial analysis of these statements, you can see &lt;br&gt; whether you have enough working capital.&quot; service_ids=&quot;5,6,2,3,1,4&quot; background_image=&quot;backgrounds/service.png&quot;][/services]\n[partners style=&quot;2&quot; title=&quot;Loved By Developers \\n Trusted By Enterprises&quot; description=&quot;We helped these brands turn online assessments into success stories.&quot; primary_action_label=&quot;View Our Partners&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-right&quot; quantity=&quot;12&quot; name_1=&quot;Framer&quot; image_1=&quot;partners/1.png&quot; name_2=&quot;Reddit&quot; image_2=&quot;partners/2.png&quot; name_3=&quot;Netflix&quot; image_3=&quot;partners/3.png&quot; name_4=&quot;Microsoft&quot; image_4=&quot;partners/4.png&quot; name_5=&quot;Discover&quot; image_5=&quot;partners/5.png&quot; name_6=&quot;Lemon Squeezy&quot; image_6=&quot;partners/6.png&quot; name_7=&quot;Paypal&quot; image_7=&quot;partners/7.png&quot; name_8=&quot;Mailchimp&quot; image_8=&quot;partners/8.png&quot;][/partners]\n[testimonials style=&quot;2&quot; title=&quot;+100k users have loved \\n Infinia Conference System&quot; description=&quot;Provide your team with top-tier group mentoring \\n programs and exceptional professional benefits.&quot; testimonial_ids=&quot;1,2,3,4,5,6&quot; background_image=&quot;backgrounds/testimonial.png&quot; primary_action_label=&quot;View All Testimonials&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(4,'Services v2','[services style=&quot;5&quot; title=&quot;Let&#039;s Discover Our Service &lt;b&gt;Our Service&lt;/b&gt; &lt;br&gt; &lt;b&gt;Features &lt;/b&gt; Charter&quot; subtitle=&quot;WHAT WE OFFERS&quot; service_ids=&quot;1,2,3,4,5,6&quot; primary_action_label=&quot;Explore Now&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/contact&quot; secondary_action_label=&quot;Contact Us&quot; secondary_action_url=&quot;/contact&quot; secondary_action_icon=&quot;ti ti-phone-call&quot;][/services]\n[app-downloads title=&quot;Manage all &lt;br&gt; from anywhere&quot; subtitle=&quot;Download Mobile App&quot; description=&quot;⚡Don&#039;t miss any contact. Stay connected.&quot; image=&quot;general/app-downloads-img.png&quot; features=&quot;Beautiful and awesome interface | Online collaborative anytime, anywhere. | Real-time updates&quot; quantity=&quot;3&quot; name_1=&quot;Apple&quot; url_1=&quot;https://www.apple.com/&quot; image_1=&quot;general/apple-store.png&quot; name_2=&quot;Google Play&quot; url_2=&quot;https://play.google.com/&quot; image_2=&quot;general/google-play.png&quot; name_3=&quot;Microsoft&quot; url_3=&quot;https://www.microsoft.com/&quot; image_3=&quot;general/microsoft.png&quot; reviews_card_title=&quot; Trusted by 1M+ customers&quot; reviews_card_image=&quot;general/customer-reviews.png&quot; reviews_card_rate=&quot;4.8/5&quot; reviews_card_data=&quot;26&quot; reviews_card_unit=&quot;k Reviews&quot;][/app-downloads]\n[site-statistics style=&quot;2&quot; title=&quot;Numbers Speaking for &lt;br&gt; Themselves&quot; quantity=&quot;4&quot; title_1=&quot;Users Active / Month&quot; data_1=&quot;500&quot; unit_1=&quot;k+&quot; title_2=&quot;New Download / Month&quot; data_2=&quot;38&quot; unit_2=&quot;k&quot; title_3=&quot;Operating countries&quot; data_3=&quot;150&quot; title_4=&quot;Businesses trust on the worldinfinia&quot; data_4=&quot;4000&quot; background_image=&quot;shapes/site-statistics-decorate.png&quot; background_color=&quot;#6d4df2&quot;][/site-statistics]\n[testimonials style=&quot;1&quot; subtitle=&quot;TESTIMONIALS&quot; title=&quot;What our clients say&quot; description=&quot;Access top-tier group mentoring plans and exclusive professional benefits for your team. 🔥&quot; testimonial_ids=&quot;1,2,3,4&quot; primary_action_label=&quot;Contact Us&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-phone&quot; secondary_action_label=&quot;Help Center&quot; secondary_action_url=&quot;/contact&quot; secondary_action_icon=&quot;ti ti-arrow-right&quot;][/testimonials]\n[contact-form display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; style=&quot;2&quot; form_title=&quot;Leave a message&quot; title=&quot;Thinking about a project? &lt;br&gt; Get in touch with us.&quot; subtitle=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; description=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; quantity=&quot;3&quot; title_1=&quot;Chat with us&quot; description_1=&quot;The support team is always available 24/7&quot; button_label_1_1=&quot;Chat via Whatsapp&quot; button_url_1_1=&quot;https://www.whatsapp.com&quot; button_icon_1_1=&quot;ti ti-brand-whatsapp&quot; button_label_2_1=&quot;Chat via Viber&quot; button_url_2_1=&quot;https://www.viber.com/&quot; button_icon_2_1=&quot;ti ti-phone-call&quot; button_label_3_1=&quot;Chat via Messager&quot; button_url_3_1=&quot;https://www.facebook.com/&quot; button_icon_3_1=&quot;ti ti-brand-messenger&quot; title_2=&quot;Send us an email&quot; description_2=&quot;Our team will respond promptly to your inquiries&quot; button_label_1_2=&quot;support@infinia.com&quot; button_url_1_2=&quot;mailto:support@infinia.com&quot; button_icon_1_2=&quot;ti ti-mail&quot; button_label_2_2=&quot;sale@infinia.com&quot; button_url_2_2=&quot;mailto:sale@infinia.com&quot; button_icon_2_2=&quot;ti ti-mail&quot; title_3=&quot;For more inquiry&quot; description_3=&quot;Reach out for immediate assistance&quot; button_label_1_3=&quot;+01 (24) 568 900&quot; button_url_1_3=&quot;tell:0124568900&quot; button_icon_1_3=&quot;ti ti-phone-call&quot; background_color=&quot;#fff7ee&quot;][/contact-form]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(5,'Services v3','[feature-tabs title=&quot;Building &lt;b&gt;enduring value&lt;/b&gt; &lt;br&gt; through &lt;b&gt;bold&lt;/b&gt; strategies&quot; subtitle=&quot;WHAT WE OFFERS&quot; quantity=&quot;6&quot; tab_name_1=&quot;Financial Consultancy&quot; title_1=&quot;Pick Your Premium&quot; description_1=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_1=&quot;general/feature-tabs-1.png&quot; feature_item_title_1_1=&quot;Research planning&quot; feature_item_description_1_1=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_1=&quot;icons/icon-14.png&quot; feature_item_title_2_1=&quot;Investment&quot; feature_item_description_2_1=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_1=&quot;icons/icon-15.png&quot; tab_name_2=&quot;Business Consultancy&quot; title_2=&quot;Build LastingPartnerships&quot; description_2=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_2=&quot;general/feature-tabs-2.png&quot; feature_item_title_1_2=&quot;Research planning&quot; feature_item_description_1_2=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_2=&quot;icons/icon-14.png&quot; feature_item_title_2_2=&quot;Investment&quot; feature_item_description_2_2=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_2=&quot;icons/icon-2.png&quot; tab_name_3=&quot;Solicitory Consultancy&quot; title_3=&quot;Enhance Operational&quot; description_3=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_3=&quot;general/feature-tabs-3.png&quot; feature_item_title_1_3=&quot;Research planning&quot; feature_item_description_1_3=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_3=&quot;icons/icon-3.png&quot; feature_item_title_2_3=&quot;Investment&quot; feature_item_description_2_3=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_3=&quot;icons/icon-17.png&quot; tab_name_4=&quot;HR Consultancy&quot; title_4=&quot;Sustainable Growth&quot; description_4=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_4=&quot;general/feature-tabs-4.png&quot; feature_item_title_1_4=&quot;Research planning&quot; feature_item_description_1_4=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_4=&quot;icons/icon-12.png&quot; feature_item_title_2_4=&quot;Investment&quot; feature_item_description_2_4=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_4=&quot;icons/icon-18.png&quot; tab_name_5=&quot;Strategy Consultancy&quot; title_5=&quot;Continuous Evolution&quot; description_5=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_5=&quot;general/feature-tabs-5.png&quot; feature_item_title_1_5=&quot;Research planning&quot; feature_item_description_1_5=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_5=&quot;icons/icon-15.png&quot; feature_item_title_2_5=&quot;Investment&quot; feature_item_description_2_5=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_5=&quot;icons/icon-14.png&quot; tab_name_6=&quot;Start Ups&quot; title_6=&quot;Empower Businesses&quot; description_6=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image_6=&quot;general/feature-tabs-6.png&quot; feature_item_title_1_6=&quot;Research planning&quot; feature_item_description_1_6=&quot;Separating your work from your home life can improve work-life balance.&quot; feature_item_icon_image_1_6=&quot;icons/icon-15.png&quot; feature_item_title_2_6=&quot;Investment&quot; feature_item_description_2_6=&quot;A business consultant provides expert advice and guidance to businesses.&quot; feature_item_icon_image_2_6=&quot;icons/icon-12.png&quot; background_image=&quot;backgrounds/team.png&quot; primary_action_label=&quot;Get a Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-right&quot; secondary_action_label=&quot;Our Help Center&quot; secondary_action_url=&quot;/contact&quot; secondary_action_icon=&quot;ti ti-phone-call&quot;][/feature-tabs]\n[site-statistics style=&quot;3&quot; quantity=&quot;4&quot; second_tab_title_1=&quot;Continuous &lt;br&gt; growth with&quot; second_tab_description_1=&quot;New accounts&quot; second_tab_data_1=&quot;24&quot; second_tab_unit_1=&quot;k&quot; second_tab_title_2=&quot;Successfully &lt;br&gt; completed&quot; second_tab_description_2=&quot;Finished projects&quot; second_tab_data_2=&quot;1024&quot; second_tab_title_3=&quot;Recruit more &lt;br&gt; than&quot; second_tab_description_3=&quot;Skilled experts&quot; second_tab_data_3=&quot;865&quot; second_tab_title_4=&quot;Increase internet &lt;br&gt; awareness&quot; second_tab_description_4=&quot;Media posts&quot; second_tab_data_4=&quot;168&quot; second_tab_unit_4=&quot;k&quot;][/site-statistics]\n[blog-posts style=&quot;2&quot; title=&quot;Our Latest Articles&quot; subtitle=&quot;FROM BLOG&quot; description=&quot;Explore the insights and trends shaping our industry&quot; paginate=&quot;4&quot; action_label=&quot;See all articles&quot; action_url=&quot;/blog&quot; background_image=&quot;backgrounds/team.png&quot;][/blog-posts]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(6,'Our Team','[teams subtitle=&quot;OUR TEAM MEMBERS&quot; title=&quot;Meet Our Team&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot; background_image=&quot;backgrounds/team.png&quot;][/teams]\n[features style=&quot;9&quot; title=&quot;We bring a rich variety of &lt;br&gt; experience from multiple fields.&quot; subtitle=&quot;Meet Our Team&quot; description=&quot;Leveraging Extensive Experience: Comprehensive Solutions Crafted from Diverse Professional Backgrounds&quot; image=&quot;general/features-9-1.png&quot; image_1=&quot;general/features-9-2.png&quot;][/features]\n[call-to-action title=&quot;We are &lt;b&gt;Looking to&lt;/b&gt; &lt;br&gt; &lt;b&gt;Expand&lt;/b&gt; Our Team&quot; image=&quot;general/call-to-action-1.png&quot; primary_action_label=&quot;Explore Now&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot;][/call-to-action]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(7,'Our Team v2','[teams style=&quot;5&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6&quot; quantity=&quot;1&quot; title_1=&quot;+1 (24) 567 890&quot; subtitle_1=&quot;CONTACT US&quot; url_1=&quot;tel:124567890&quot; icon_image_1=&quot;icons/contact.png&quot;][/teams]\n[features style=&quot;8&quot; title=&quot;Doing the successful thing, at &lt;br&gt;  the right time.&quot; subtitle=&quot;Recent work&quot; description=&quot;We strive to build long-lasting partnerships with our clients, understanding their unique challenges and opportunities, and providing tailored strategies that lead to measurable success.&quot; image=&quot;general/features-8.png&quot; floating_card_title=&quot;Years of Experience&quot; floating_card_data_count=&quot;25&quot; floating_card_data_count_unit=&quot;+&quot; quantity=&quot;2&quot; title_1=&quot;Research planning&quot; description_1=&quot;Separating your work from your home life can improve work-life balance.&quot; icon_image_1=&quot;icons/icon-14.png&quot; title_2=&quot;Investment&quot; description_2=&quot;A business consultant provides expert advice and guidance to businesses.&quot; icon_image_2=&quot;icons/icon-15.png&quot;][/features]\n[call-to-action style=&quot;2&quot; title=&quot;We are &lt;b&gt;Looking to&lt;/b&gt; &lt;br&gt; &lt;b&gt;Expand&lt;/b&gt; Our Team&quot; image=&quot;general/call-to-action-2.png&quot; primary_action_label=&quot;Explore Now&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot;][/call-to-action]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(8,'Our Team v3','[teams style=&quot;6&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day. &lt;br&gt; Company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot; quantity=&quot;8&quot;][/teams]\n[testimonials style=&quot;3&quot; title=&quot;+500k Satisfied Customers&quot; subtitle=&quot;OUR FEATURES&quot; description=&quot;🔥 Don&rsquo;t just take our words&quot; testimonial_ids=&quot;1,2,4,5,6,7,8,10,12,14,15&quot; background_image=&quot;backgrounds/team.png&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(9,'Our Team v4','[features style=&quot;10&quot; title=&quot;Stay &lt;b&gt;updated&lt;/b&gt; with &lt;br&gt; the &lt;b&gt;latest news&lt;/b&gt; &lt;br&gt; from &lt;b&gt;our team&lt;/b&gt;.&quot; description=&quot;Don&#039;t miss the trending&quot; image=&quot;general/features-10.png&quot;][/features]\n[teams style=&quot;4&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7&quot;][/teams]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(10,'Our Team v5','[teams style=&quot;2&quot; title=&quot;Meet &lt;b&gt;everyone&lt;/b&gt; who &lt;br&gt; made this &lt;b&gt;possible&lt;/b&gt;.&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot;][/teams]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(11,'Our Team v6','[teams style=&quot;3&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; bottom_description=&quot;Easily Monitor, Control, and Enhance Your Personal and Business Finances. &lt;br&gt; Your All-In-One Solution.&quot; primary_action_label=&quot;Get a Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-narrow-right&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot;][/teams]\n[testimonials style=&quot;3&quot; title=&quot;+500k Satisfied Customers&quot; subtitle=&quot;OUR FEATURES&quot; description=&quot;🔥 Don&rsquo;t just take our words&quot; testimonial_ids=&quot;1,2,4,5,6,7,8,10,12,14,15&quot; background_image=&quot;backgrounds/team.png&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(12,'Blog','',1,NULL,'full-width','Explore the insights and trends shaping our industry','published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(13,'Contact','[features style=&quot;1&quot; quantity=&quot;4&quot; title_1=&quot;Help &amp; Support&quot; description_1=&quot;Email support@alithemes.com For \\n help with a current product or \\n service or refer to FAQs and \\n developer tools.&quot; icon_image_1=&quot;icons/icon-12.png&quot; title_2=&quot;Call Us&quot; description_2=&quot;Call us to speak to a member of our \\n team. \\n (+01) 234 567 89 \\n (+01) 456 789 21&quot; icon_image_2=&quot;icons/icon-13.png&quot; title_3=&quot;Business Department&quot; description_3=&quot;Contact the sales department about cooperation projects \\n (+01) 789 456 23&quot; icon_image_3=&quot;icons/icon-14.png&quot; title_4=&quot;Global branch&quot; description_4=&quot;Contact us to open our branches \\n globally. \\n (+01) 234 567 89 \\n (+01) 456 789 23&quot; icon_image_4=&quot;icons/icon-15.png&quot;][/features]\n[contact-form style=&quot;1&quot; title=&quot;Thinking about a project? Get in touch with us.&quot; subtitle=&quot;Contact Us&quot; description=&quot;Please let us know if you have a question, want to leave \\n a comment, or would like further information about \\n Infinia Systems.&quot; background_image=&quot;backgrounds/contact.png&quot; form_title=&quot;Get in touch&quot; form_description=&quot;Do you want to know more or contact our sales department?&quot; display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; quantity=&quot;4&quot; title_1=&quot;Visit the Knowledge Base&quot; description_1=&quot;Browse customer support articles and step-by-step instructions for specific features.&quot; icon_1=&quot;ti ti-search&quot; title_2=&quot;Watch Product Videos&quot; description_2=&quot;Watch our video tutorials for visual walkthroughes on how to use our features.&quot; icon_2=&quot;ti ti-video&quot; title_3=&quot;Visit the Knowledge Base&quot; description_3=&quot;Let us talk about how we can help your enterprise.&quot; icon_3=&quot;ti ti-headphones&quot;][/contact-form]\n[google-map height=&quot;650&quot;]Level 7/180 Flinders St, Melbourne VIC 3000, Australia[/google-map]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(14,'About Us','[about-us-information title=&quot;Where your financial dreams become reality&quot; subtitle=&quot;Who we are&quot; description=&quot;Infinia is a digital company specializing in website creation. Enterprises of all sizes&mdash;from emerging startups to large corporations&mdash;utilize our theme to develop and manage their online presence.&quot; quantity=&quot;4&quot; title_1=&quot;Best For IT Consulting&quot; title_2=&quot;Innovative Approaches&quot; title_3=&quot;Save Money &amp; Time&quot; title_4=&quot;100% Satisfaction&quot; image=&quot;general/about-us-information-img.png&quot;][/about-us-information]\n[site-statistics title=&quot;See why we are &lt;br&gt; trusted the world over&quot; quantity=&quot;4&quot; title_1=&quot;New accounts&quot; data_1=&quot;496&quot; unit_1=&quot;k&quot; title_2=&quot;Finished projects&quot; data_2=&quot;92&quot; unit_2=&quot;+&quot; title_3=&quot;Skilled experts&quot; data_3=&quot;756&quot; unit_3=&quot;+&quot; title_4=&quot;Media posts&quot; data_4=&quot;25&quot; unit_4=&quot;k&quot;][/site-statistics]\n[our-mission title=&quot;Empowering Your Digital Success Through Innovative Solutions&quot; subtitle=&quot;Our Mission&quot; description=&quot;We believe in building strong relationships with our clients, based on trust, transparency, and mutual success.&quot; quantity=&quot;2&quot; title_1=&quot;Transaction &lt;br&gt; Completed&quot; data_1=&quot;25&quot; unit_1=&quot;M+&quot; text_color_1=&quot;rgb(0, 0, 0)&quot; background_color_1=&quot;rgb(100, 225, 176)&quot; title_2=&quot;Transaction &lt;br&gt; Completed&quot; data_2=&quot;12&quot; unit_2=&quot;k+&quot; text_color_2=&quot;rgb(255, 255, 255)&quot; background_color_2=&quot;rgb(109, 77, 242)&quot; image=&quot;general/our-mission-img.png&quot; image_1=&quot;general/our-mission-img-1.png&quot; image_2=&quot;general/our-mission-img-2.png&quot; testimonial_limit=&quot;2&quot;][/our-mission]\n[our-history title=&quot;A Journey of Innovation and Growth&quot; subtitle=&quot;Our History&quot; description=&quot;Loved By Developers Trusted By Enterprises&quot; main_content=&quot;&lt;strong&gt;Infinia&lt;/strong&gt; was founded with a passion for technology and a desire to make a difference in the digital world. From our humble beginnings, we have grown into a reputable and sought-after web development agency, serving a diverse range of clients across various industries. Over the years, &lt;strong&gt;we have successfully delivered countless projects&lt;/strong&gt;, each one a testament to our dedication, expertise, and innovative approach. Our journey has been marked by &lt;strong&gt;continuous growth, learning, and adaptation&lt;/strong&gt;, and we are proud of the milestones we have achieved along the way. &lt;br&gt;&lt;br&gt; Thank you for considering &lt;strong&gt;Infinia&lt;/strong&gt; as your web development partner. We look forward to helping you achieve your &lt;strong&gt;digital goals&lt;/strong&gt; and &lt;strong&gt;creating a lasting impact&lt;/strong&gt; on your business. &quot; author_name=&quot;Kensei&quot; author_title=&quot;CEO&quot; author_signature=&quot;general/author-signature.png&quot; author_avatar=&quot;general/author-avatar.png&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_url=&quot;/contact&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot;][/our-history]\n[teams style=&quot;2&quot; title=&quot;Meet &lt;b&gt;everyone&lt;/b&gt; who &lt;br&gt; made this &lt;b&gt;possible&lt;/b&gt;.&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot;][/teams]\n[contact-form display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; style=&quot;2&quot; form_title=&quot;Leave a message&quot; title=&quot;Thinking about a project? &lt;br&gt; Get in touch with us.&quot; subtitle=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; description=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; quantity=&quot;3&quot; title_1=&quot;Chat with us&quot; description_1=&quot;The support team is always available 24/7&quot; button_label_1_1=&quot;Chat via Whatsapp&quot; button_url_1_1=&quot;https://www.whatsapp.com&quot; button_icon_1_1=&quot;ti ti-brand-whatsapp&quot; button_label_2_1=&quot;Chat via Viber&quot; button_url_2_1=&quot;https://www.viber.com/&quot; button_icon_2_1=&quot;ti ti-phone-call&quot; button_label_3_1=&quot;Chat via Messager&quot; button_url_3_1=&quot;https://www.facebook.com/&quot; button_icon_3_1=&quot;ti ti-brand-messenger&quot; title_2=&quot;Send us an email&quot; description_2=&quot;Our team will respond promptly to your inquiries&quot; button_label_1_2=&quot;support@infinia.com&quot; button_url_1_2=&quot;mailto:support@infinia.com&quot; button_icon_1_2=&quot;ti ti-mail&quot; button_label_2_2=&quot;sale@infinia.com&quot; button_url_2_2=&quot;mailto:sale@infinia.com&quot; button_icon_2_2=&quot;ti ti-mail&quot; title_3=&quot;For more inquiry&quot; description_3=&quot;Reach out for immediate assistance&quot; button_label_1_3=&quot;+01 (24) 568 900&quot; button_url_1_3=&quot;tell:0124568900&quot; button_icon_1_3=&quot;ti ti-phone-call&quot; background_color=&quot;#fff7ee&quot;][/contact-form]\n[testimonials style=&quot;3&quot; title=&quot;+500k Satisfied Customers&quot; subtitle=&quot;OUR FEATURES&quot; description=&quot;🔥 Don&rsquo;t just take our words&quot; testimonial_ids=&quot;1,2,4,5,6,7,8,10,12,14,15&quot; background_image=&quot;backgrounds/team.png&quot;][/testimonials]\n[information-block image=&quot;icons/icon-star.png&quot; title=&quot;Core values&quot; description=&quot;We break down barriers so teams can focus on what matters &ndash; working together to create products their customers love.&quot; quantity=&quot;8&quot; title_1=&quot;Genuine repeated &lt;br&gt; happy customers.&quot; data_1=&quot;98&quot; unit_1=&quot;%&quot; title_2=&quot;Genuine repeated &lt;br&gt; happy customers.&quot; data_2=&quot;98&quot; unit_2=&quot;%&quot; title_3=&quot;Customers First&quot; icon_image_3=&quot;icons/check.png&quot; description_3=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; title_4=&quot;Think Big&quot; icon_image_4=&quot;icons/check.png&quot; description_4=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; title_5=&quot;Make a Difference&quot; icon_image_5=&quot;icons/check.png&quot; description_5=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; title_6=&quot;Act With Integrity&quot; icon_image_6=&quot;icons/check.png&quot; description_6=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; title_7=&quot;Do the right thing&quot; icon_image_7=&quot;icons/check.png&quot; description_7=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; title_8=&quot;Stronger united&quot; icon_image_8=&quot;icons/check.png&quot; description_8=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; description_9=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; description_10=&quot;Our company exists to help merchants sell more. We make every decision and measure every outcome based on how well it serves our customers.&quot; background_color=&quot;#a38cff&quot;][/information-block]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(15,'About Us v2','[our-mission style=&quot;2&quot; title=&quot;Uncover Our &lt;b&gt; Journey: &lt;/b&gt; &lt;br&gt; Uniting Through &lt;b&gt; Creativity &lt;/b&gt;&quot; subtitle=&quot;About our company&quot; description=&quot;Our dedication to quality and excellence has made us a trusted partner for enterprises looking to enhance their online presence.&quot; quantity=&quot;4&quot; title_1=&quot;Projects Completed&quot; data_1=&quot;23&quot; unit_1=&quot;k+&quot; title_2=&quot;Users Activated&quot; data_2=&quot;38&quot; unit_2=&quot;k+&quot; title_3=&quot;Happy Clients&quot; data_3=&quot;98k+&quot; text_color_3=&quot;transparent&quot; background_color_3=&quot;transparent&quot; title_4=&quot;Operating countries&quot; data_4=&quot;150&quot; testimonial_box_title=&quot;Loved by over 4k &lt;br&gt; happy clients&quot; testimonial_limit=&quot;5&quot; image=&quot;general/our-mission-img-2-1.png&quot; image_1=&quot;general/our-mission-img-2-2.png&quot; background_image=&quot;backgrounds/team.png&quot;][/our-mission]\n[partners style=&quot;3&quot; title=&quot;Trusted by great companies&quot; quantity=&quot;20&quot; name_1=&quot;Framer&quot; image_1=&quot;partners/1.png&quot; url_1=&quot;https://google.com&quot; open_in_new_tab_1=&quot;1&quot; name_2=&quot;Reddit&quot; image_2=&quot;partners/2.png&quot; url_2=&quot;https://google.com&quot; open_in_new_tab_2=&quot;1&quot; name_3=&quot;Netflix&quot; image_3=&quot;partners/3.png&quot; url_3=&quot;https://google.com&quot; open_in_new_tab_3=&quot;1&quot; name_4=&quot;Microsoft&quot; image_4=&quot;partners/4.png&quot; url_4=&quot;https://google.com&quot; open_in_new_tab_4=&quot;1&quot; name_5=&quot;Discover&quot; image_5=&quot;partners/5.png&quot; url_5=&quot;https://google.com&quot; open_in_new_tab_5=&quot;1&quot; name_6=&quot;Lemon Squeezy&quot; image_6=&quot;partners/6.png&quot; url_6=&quot;https://google.com&quot; open_in_new_tab_6=&quot;1&quot; name_7=&quot;Paypal&quot; image_7=&quot;partners/7.png&quot; url_7=&quot;https://google.com&quot; open_in_new_tab_7=&quot;1&quot; name_8=&quot;Youtube&quot; image_8=&quot;partners/8.png&quot; url_8=&quot;https://google.com&quot; open_in_new_tab_8=&quot;1&quot; name_9=&quot;Spotify&quot; image_9=&quot;partners/1.png&quot; url_9=&quot;https://google.com&quot; open_in_new_tab_9=&quot;1&quot; name_10=&quot;Google&quot; image_10=&quot;partners/3.png&quot; url_10=&quot;https://google.com&quot; open_in_new_tab_10=&quot;1&quot; name_11=&quot;Amazon&quot; image_11=&quot;partners/1.png&quot; url_11=&quot;https://google.com&quot; open_in_new_tab_11=&quot;1&quot; name_12=&quot;Apple&quot; image_12=&quot;partners/5.png&quot; url_12=&quot;https://google.com&quot; open_in_new_tab_12=&quot;1&quot; name_13=&quot;Facebook&quot; image_13=&quot;partners/3.png&quot; url_13=&quot;https://google.com&quot; open_in_new_tab_13=&quot;1&quot; name_14=&quot;Twitter&quot; image_14=&quot;partners/6.png&quot; url_14=&quot;https://google.com&quot; open_in_new_tab_14=&quot;1&quot; name_15=&quot;Instagram&quot; image_15=&quot;partners/1.png&quot; url_15=&quot;https://google.com&quot; open_in_new_tab_15=&quot;1&quot; name_16=&quot;Slack&quot; image_16=&quot;partners/1.png&quot; url_16=&quot;https://google.com&quot; open_in_new_tab_16=&quot;1&quot; name_17=&quot;Tiktok&quot; image_17=&quot;partners/4.png&quot; url_17=&quot;https://google.com&quot; open_in_new_tab_17=&quot;1&quot; name_18=&quot;Pinterest&quot; image_18=&quot;partners/1.png&quot; url_18=&quot;https://google.com&quot; open_in_new_tab_18=&quot;1&quot; name_19=&quot;Medium&quot; image_19=&quot;partners/1.png&quot; url_19=&quot;https://google.com&quot; open_in_new_tab_19=&quot;1&quot; name_20=&quot;Linkedin&quot; image_20=&quot;partners/1.png&quot; url_20=&quot;https://google.com&quot; open_in_new_tab_20=&quot;1&quot;][/partners]\n[teams style=&quot;3&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; bottom_description=&quot;Easily Monitor, Control, and Enhance Your Personal and Business Finances. &lt;br&gt; Your All-In-One Solution.&quot; primary_action_label=&quot;Get a Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-narrow-right&quot; team_ids=&quot;1,2,3,4,5,6,7,8&quot;][/teams]\n[services style=&quot;2&quot; service_ids=&quot;1,3,4,5&quot; background_color=&quot;#a38cff&quot; background_image=&quot;backgrounds/team.png&quot;][/services]\n[features style=&quot;4&quot; title=&quot;Optimize Your &lt;br&gt; Finances with Ease.&quot; subtitle=&quot;OUR FEATURES&quot; image=&quot;general/features-4-1.png&quot; image_1=&quot;general/features-4-2.png&quot; quantity=&quot;3&quot; title_1=&quot;Our History&quot; description_1=&quot;A Journey of Innovation, Growth, and Technological Advancement&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Our Mission&quot; description_2=&quot;Empowering Your Digital Success Through Innovative Solutions&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Our Vision&quot; description_3=&quot;Leading the Future of Web Development with Excellence and Innovation&quot; icon_image_3=&quot;icons/icon-3.png&quot;][/features]\n[projects style=&quot;2&quot; title=&quot;Recent work&quot; subtitle=&quot;Our feared projects&quot; description=&quot;⚡Don&#039;t miss any contact. Stay connected.&quot; project_ids=&quot;1,3,4,6&quot; limit=&quot;4&quot;][/projects]\n[blog-posts style=&quot;2&quot; title=&quot;Reach out to &lt;br&gt; the world&#039;s most&quot; subtitle=&quot;Why us ?&quot; description=&quot;⚡Here are a few reasons why our customers choose Infinia.&quot; paginate=&quot;8&quot;][/blog-posts]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(16,'About Us v3','[about-us-information style=&quot;2&quot; title=&quot;Together, We are &lt;b&gt;Shaping&lt;/b&gt; a &lt;br&gt; &lt;b&gt;Promising&lt;/b&gt; Future.&quot; subtitle=&quot;About us&quot; quantity=&quot;6&quot; image=&quot;general/about-us-information-2-1.jpeg&quot; display_social_links=&quot;0,1&quot; social_links_box_title=&quot;Follow Us:&quot;][/about-us-information]\n[services style=&quot;3&quot; title=&quot;Our Core Values&quot; description=&quot;We break down barriers so teams can focus on what matters &ndash; working together &lt;br&gt; to create products their customers love.&quot; service_ids=&quot;1,2,3,4&quot;][/services]\n[teams style=&quot;4&quot; title=&quot;Meet Our Team&quot; subtitle=&quot;OUR TEAM MEMBERS&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; team_ids=&quot;1,2,3,4,5,6,7&quot;][/teams]\n[contact-form display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; style=&quot;2&quot; form_title=&quot;Leave a message&quot; title=&quot;Thinking about a project? &lt;br&gt; Get in touch with us.&quot; subtitle=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; description=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; quantity=&quot;3&quot; title_1=&quot;Chat with us&quot; description_1=&quot;The support team is always available 24/7&quot; button_label_1_1=&quot;Chat via Whatsapp&quot; button_url_1_1=&quot;https://www.whatsapp.com&quot; button_icon_1_1=&quot;ti ti-brand-whatsapp&quot; button_label_2_1=&quot;Chat via Viber&quot; button_url_2_1=&quot;https://www.viber.com/&quot; button_icon_2_1=&quot;ti ti-phone-call&quot; button_label_3_1=&quot;Chat via Messager&quot; button_url_3_1=&quot;https://www.facebook.com/&quot; button_icon_3_1=&quot;ti ti-brand-messenger&quot; title_2=&quot;Send us an email&quot; description_2=&quot;Our team will respond promptly to your inquiries&quot; button_label_1_2=&quot;support@infinia.com&quot; button_url_1_2=&quot;mailto:support@infinia.com&quot; button_icon_1_2=&quot;ti ti-mail&quot; button_label_2_2=&quot;sale@infinia.com&quot; button_url_2_2=&quot;mailto:sale@infinia.com&quot; button_icon_2_2=&quot;ti ti-mail&quot; title_3=&quot;For more inquiry&quot; description_3=&quot;Reach out for immediate assistance&quot; button_label_1_3=&quot;+01 (24) 568 900&quot; button_url_1_3=&quot;tell:0124568900&quot; button_icon_1_3=&quot;ti ti-phone-call&quot; background_color=&quot;#ffffff&quot;][/contact-form]\n[blog-posts subtitle=&quot;FROM BLOG&quot; title=&quot;Our Latest Articles&quot; description=&quot;Explore the insights and trends shaping our industry&quot; paginate=&quot;3&quot; action_label=&quot;View All Articles&quot; action_url=&quot;/blog&quot;][/blog-posts]<br/><br/>',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(17,'Pricing','[pricing-plans style=&quot;3&quot; title=&quot;&lt;b&gt;Straightforward&lt;/b&gt;  Pricing &lt;br&gt; Custom &lt;b&gt;Integrations&lt;/b&gt;&quot; subtitle=&quot;Our Pricing&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; quantity=&quot;6&quot; package_ids=&quot;1,2,3&quot; background_images=&quot;backgrounds/bg-line-bottom.png&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-narrow-right&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot;][/pricing-plans]\n[compare-plans title=&quot;Compare Features&quot; subtitle=&quot;Compare Plans&quot; description=&quot;A management platform to help you succeed&quot; package_name_1=&quot;Starter&quot; package_description_1=&quot;from $19/month&quot; package_name_2=&quot;Standard&quot; package_description_2=&quot;from $49/month&quot; package_name_3=&quot;Enterprise&quot; package_description_3=&quot;from $99/month&quot; quantity=&quot;10&quot; criteria_1=&quot;Docs/month&quot; description_1=&quot;Monthly Documentation Capacity&quot; value_1_1=&quot;yes&quot; value_2_1=&quot;yes&quot; value_3_1=&quot;yes&quot; criteria_2=&quot;Integration&quot; description_2=&quot;Seamless System Integration&quot; value_1_2=&quot;yes&quot; value_2_2=&quot;yes&quot; value_3_2=&quot;yes&quot; criteria_3=&quot;Workspaces&quot; description_3=&quot;Organized Work Environments&quot; value_1_3=&quot;yes&quot; value_2_3=&quot;yes&quot; value_3_3=&quot;yes&quot; criteria_4=&quot;Collaborators&quot; description_4=&quot;Team Collaboration Features&quot; value_1_4=&quot;no&quot; value_2_4=&quot;yes&quot; value_3_4=&quot;yes&quot; criteria_5=&quot;Real-time collaboration&quot; description_5=&quot;Instant Collaborative Editing&quot; value_1_5=&quot;no&quot; value_2_5=&quot;yes&quot; value_3_5=&quot;yes&quot; criteria_6=&quot;File uploads&quot; description_6=&quot;Effortless File Management&quot; value_1_6=&quot;yes&quot; value_2_6=&quot;yes&quot; value_3_6=&quot;yes&quot; criteria_7=&quot;Transcripts&quot; description_7=&quot;Accurate Meeting Transcripts&quot; value_1_7=&quot;2h / month&quot; value_2_7=&quot;Unlimited&quot; value_3_7=&quot;Unlimited&quot; criteria_8=&quot;Image uploads&quot; description_8=&quot;Simple Image Storage&quot; value_1_8=&quot;Up to 5 MB per file&quot; value_2_8=&quot;Unlimited&quot; value_3_8=&quot;Unlimited&quot; criteria_9=&quot;Email Campaigns&quot; description_9=&quot;Effective Email Marketing &quot; value_1_9=&quot;03 Campaigns&quot; value_2_9=&quot;Unlimited&quot; value_3_9=&quot;Unlimited&quot; criteria_10=&quot;Custom Branding&quot; description_10=&quot;Personalized Brand Experience&quot; value_1_10=&quot;01 Workspaces&quot; value_2_10=&quot;05 Workspaces&quot; value_3_10=&quot;Unlimited&quot; bottom_description=&quot;We also offer other customized services to fit your business.&quot; primary_action_label=&quot;Get a Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-right&quot; secondary_action_label=&quot;Our Help Center&quot; secondary_action_url=&quot;/contact&quot; secondary_action_icon=&quot;ti ti-phone-call&quot;][/compare-plans]\n[instruction-steps style=&quot;2&quot; title=&quot;How It Works&quot; subtitle=&quot;working process&quot; description=&quot;Comprehensive Suite of Cutting-Edge IT Services.&quot; quantity=&quot;3&quot; title_1=&quot;Choose Services&quot; description_1=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_1=&quot;icons/icon-16.png&quot; title_2=&quot;Project Analysis&quot; description_2=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_2=&quot;icons/icon-14.png&quot; title_3=&quot;Got Final Result&quot; description_3=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_3=&quot;icons/icon-15.png&quot; bottom_description=&quot;Need more help? Go to our&quot; action_label=&quot;Support Center&quot; action_url=&quot;/contact&quot; background_image=&quot;backgrounds/team.png&quot;][/instruction-steps]\n[faqs style=&quot;2&quot; title=&quot;Frequently Asked  &lt;br&gt; Questions&quot; description=&quot;Find the answers to all of our most frequently asked questions&quot; image=&quot;general/faqs-img-2.png&quot; quantity=&quot;3&quot; title_1=&quot;Live chat support 24/7&quot; description_1=&quot;More than 300 employees are ready to help you&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Help desk support center&quot; description_2=&quot;Via ticket system. 24/7 available.&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Book a demo&quot; description_3=&quot;Live support via video call&quot; icon_image_3=&quot;icons/icon-15.png&quot; category_ids=&quot;1,2,3&quot; background_image=&quot;backgrounds/faqs.png&quot;][/faqs]\n[testimonials style=&quot;4&quot; title=&quot;What &lt;b&gt; People Say &lt;/b&gt; About &lt;br&gt; &lt;b&gt;Our Company&lt;/b&gt;&quot; subtitle=&quot;TESTIMONIALS&quot; description=&quot;Access top-tier group mentoring plans and exclusive professional &lt;br&gt; benefits for your team. 🔥&quot; testimonial_ids=&quot;1,2,3,4,5&quot; background_image=&quot;backgrounds/team.png&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(18,'Pricing v2','<br><br><br>[pricing-plans subtitle=&quot;OUR PLANS&quot; title=&quot;Pricing Plans&quot; description=&quot;⚡We&rsquo;ve got a pricing plan that&rsquo;s perfect for you&quot; package_ids=&quot;1,2,3,4&quot;][/pricing-plans]\n[compare-plans title=&quot;Compare Features&quot; subtitle=&quot;Compare Plans&quot; description=&quot;A management platform to help you succeed&quot; package_name_1=&quot;Starter&quot; package_description_1=&quot;from $19/month&quot; package_name_2=&quot;Standard&quot; package_description_2=&quot;from $49/month&quot; package_name_3=&quot;Enterprise&quot; package_description_3=&quot;from $99/month&quot; quantity=&quot;10&quot; criteria_1=&quot;Docs/month&quot; description_1=&quot;Monthly Documentation Capacity&quot; value_1_1=&quot;yes&quot; value_2_1=&quot;yes&quot; value_3_1=&quot;yes&quot; criteria_2=&quot;Integration&quot; description_2=&quot;Seamless System Integration&quot; value_1_2=&quot;yes&quot; value_2_2=&quot;yes&quot; value_3_2=&quot;yes&quot; criteria_3=&quot;Workspaces&quot; description_3=&quot;Organized Work Environments&quot; value_1_3=&quot;yes&quot; value_2_3=&quot;yes&quot; value_3_3=&quot;yes&quot; criteria_4=&quot;Collaborators&quot; description_4=&quot;Team Collaboration Features&quot; value_1_4=&quot;no&quot; value_2_4=&quot;yes&quot; value_3_4=&quot;yes&quot; criteria_5=&quot;Real-time collaboration&quot; description_5=&quot;Instant Collaborative Editing&quot; value_1_5=&quot;no&quot; value_2_5=&quot;yes&quot; value_3_5=&quot;yes&quot; criteria_6=&quot;File uploads&quot; description_6=&quot;Effortless File Management&quot; value_1_6=&quot;yes&quot; value_2_6=&quot;yes&quot; value_3_6=&quot;yes&quot; criteria_7=&quot;Transcripts&quot; description_7=&quot;Accurate Meeting Transcripts&quot; value_1_7=&quot;2h / month&quot; value_2_7=&quot;Unlimited&quot; value_3_7=&quot;Unlimited&quot; criteria_8=&quot;Image uploads&quot; description_8=&quot;Simple Image Storage&quot; value_1_8=&quot;Up to 5 MB per file&quot; value_2_8=&quot;Unlimited&quot; value_3_8=&quot;Unlimited&quot; criteria_9=&quot;Email Campaigns&quot; description_9=&quot;Effective Email Marketing &quot; value_1_9=&quot;03 Campaigns&quot; value_2_9=&quot;Unlimited&quot; value_3_9=&quot;Unlimited&quot; criteria_10=&quot;Custom Branding&quot; description_10=&quot;Personalized Brand Experience&quot; value_1_10=&quot;01 Workspaces&quot; value_2_10=&quot;05 Workspaces&quot; value_3_10=&quot;Unlimited&quot; bottom_description=&quot;We also offer other customized services to fit your business.&quot; primary_action_label=&quot;Get a Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-right&quot; secondary_action_label=&quot;Our Help Center&quot; secondary_action_url=&quot;/contact&quot; secondary_action_icon=&quot;ti ti-phone-call&quot;][/compare-plans]\n[testimonials style=&quot;2&quot; title=&quot;&lt;b&gt; +100k users &lt;/b&gt; have loved &lt;br&gt; &lt;b&gt; Infinia Conference &lt;/b&gt; System&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; testimonial_ids=&quot;1,2,3,4,5,6&quot; primary_action_label=&quot;View More Testimonials&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/about-us&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(19,'Pricing v3','[pricing-plans style=&quot;2&quot; title=&quot;Pick Your Premium&quot; subtitle=&quot;OUR PLANS&quot; description=&quot;Upgrade to Spotify Premium and take your music journey to the next level. Enjoy uninterrupted music playback, even in offline mode&quot; features=&quot;Get 30 day free trial \\n You can cancel anytime \\n No any hidden fees pay \\n Monthly management&quot; bottom_title=&quot;Trusted by secure payment service&quot; quantity=&quot;4&quot; name_1=&quot;PayPal&quot; url_1=&quot;https://www.paypal.com/&quot; image_1=&quot;general/paypal.png&quot; name_2=&quot;Stripe&quot; url_2=&quot;https://www.stripe.com/&quot; image_2=&quot;general/stripe.png&quot; name_3=&quot;Mastercard&quot; url_3=&quot;https://www.mastercard.us/en-us.html&quot; image_3=&quot;general/mastercard.png&quot; name_4=&quot;Skrill&quot; url_4=&quot;https://www.skrill.com/&quot; image_4=&quot;general/skrill.png&quot; package_ids=&quot;1,2&quot;][/pricing-plans]\n[faqs style=&quot;3&quot; title=&quot;Ask us anything&quot; subtitle=&quot;Pricing FAQs&quot; description=&quot;Have any questions? We&#039;re here to assist you.&quot; quantity=&quot;6&quot; category_ids=&quot;1,2,3&quot; limit=&quot;10&quot;][/faqs]\n[faqs style=&quot;4&quot; title=&quot;Got questions? &lt;br&gt; We&#039;ve got answers&quot; subtitle=&quot;Frequently Asked questions&quot; description=&quot;Quick answers to questions you may have. Can&#039;t find what you&#039;re looking for? Get in touch with us. &quot; image=&quot;general/faqs-4-1.png&quot; image_1=&quot;general/faqs-4-2.png&quot; category_ids=&quot;1,2,3&quot; limit=&quot;5&quot; primary_action_label=&quot;Get in touch&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; secondary_action_label=&quot;Help Center&quot; secondary_action_url=&quot;/contact&quot;][/faqs]\n[testimonials style=&quot;3&quot; title=&quot;+500k Satisfied Customers&quot; subtitle=&quot;OUR FEATURES&quot; description=&quot;🔥 Don&rsquo;t just take our words&quot; testimonial_ids=&quot;1,2,4,5,6,7,8,10,12,14,15&quot; background_image=&quot;backgrounds/team.png&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(20,'Coming Soon','[newsletter title=&quot;Get Notified &lt;br&gt; When We Launch&quot; subtitle=&quot;Under Construction&quot; description=&quot;Our design projects are fresh and simple and will benefit your business greatly. Learn more about our work!&quot; button_label=&quot;Join now&quot; image=&quot;general/app-downloads-img.png&quot;][/newsletter]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(21,'Features','[features style=&quot;1&quot; title=&quot;Together, we are creating a &lt;span&gt;Bright Future&lt;/span&gt;&quot; subtitle=&quot;OUR FEATURES&quot; image=&quot;backgrounds/feature.png&quot; quantity=&quot;4&quot; title_1=&quot;Work organization&quot; description_1=&quot;A business consultant provides expert advice and guidance to businesses on various aspects.&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Strategy Development&quot; description_2=&quot;Business consultants play a crucial role by offering expert advice and guidance to companies&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Data analytics&quot; description_3=&quot;Consultants provide invaluable expertise to businesses, assisting them with strategic advice&quot; icon_image_3=&quot;icons/icon-3.png&quot; title_4=&quot;Business Intelligence&quot; description_4=&quot;Through their deep understanding of industry trends and best practices, consultants empower organizations&quot; icon_image_4=&quot;icons/icon-4.png&quot;][/features]\n[features style=&quot;3&quot; title=&quot;Powerful agency for corporate business.&quot; subtitle=&quot;Company&#039;s vision&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; image=&quot;backgrounds/feature-3.png&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot; floating_card_image=&quot;shapes/testimonial-star.png&quot; floating_card_title=&quot;Rate For Us&quot; floating_card_description=&quot;Loved by over 4k \\n happy clients&quot; quantity=&quot;2&quot; title_1=&quot;99%&quot; description_1=&quot;Genuine repeated happy customers.&quot; title_2=&quot;98%&quot; description_2=&quot;Trusted by companies.&quot;][/features]\n[projects style=&quot;3&quot; title=&quot;Proud projects &lt;b&gt;that make&lt;/b&gt; &lt;br&gt; &lt;b&gt;us stand&lt;/b&gt; out&quot; subtitle=&quot;Why We Are The Best&quot; description=&quot;Nunc bibendum augue sed mattis porta. Donec pharetra magna tortor, quis bibendum ligula faucibus vitae,&quot; data_count=&quot;50&quot; data_count_unit=&quot;k&quot; project_ids=&quot;1,2,3&quot; quantity=&quot;4&quot; title_1=&quot;Offshore Software Development&quot; description_1=&quot;Getting started is simple! Download the app from the App Store or Google Play Store, create an account using your email or social media login, and start making video calls instantly.&quot; title_2=&quot;Custom Software Development&quot; description_2=&quot;Getting started is simple! Download the app from the App Store or Google Play Store, create an account using your email or social media login, and start making video calls instantly.&quot; title_3=&quot;Software Outsourcing Services&quot; description_3=&quot;Getting started is simple! Download the app from the App Store or Google Play Store, create an account using your email or social media login, and start making video calls instantly.&quot; title_4=&quot;Software Product Development&quot; description_4=&quot;Getting started is simple! Download the app from the App Store or Google Play Store, create an account using your email or social media login, and start making video calls instantly.&quot;][/projects]\n[contact-form display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; style=&quot;2&quot; form_title=&quot;Leave a message&quot; title=&quot;Thinking about a project? &lt;br&gt; Get in touch with us.&quot; subtitle=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; description=&quot;Connect with Us Today through the Details Below or Fill Out the Form for a Prompt Response&quot; quantity=&quot;3&quot; title_1=&quot;Chat with us&quot; description_1=&quot;The support team is always available 24/7&quot; button_label_1_1=&quot;Chat via Whatsapp&quot; button_url_1_1=&quot;https://www.whatsapp.com&quot; button_icon_1_1=&quot;ti ti-brand-whatsapp&quot; button_label_2_1=&quot;Chat via Viber&quot; button_url_2_1=&quot;https://www.viber.com/&quot; button_icon_2_1=&quot;ti ti-phone-call&quot; button_label_3_1=&quot;Chat via Messager&quot; button_url_3_1=&quot;https://www.facebook.com/&quot; button_icon_3_1=&quot;ti ti-brand-messenger&quot; title_2=&quot;Send us an email&quot; description_2=&quot;Our team will respond promptly to your inquiries&quot; button_label_1_2=&quot;support@infinia.com&quot; button_url_1_2=&quot;mailto:support@infinia.com&quot; button_icon_1_2=&quot;ti ti-mail&quot; button_label_2_2=&quot;sale@infinia.com&quot; button_url_2_2=&quot;mailto:sale@infinia.com&quot; button_icon_2_2=&quot;ti ti-mail&quot; title_3=&quot;For more inquiry&quot; description_3=&quot;Reach out for immediate assistance&quot; button_label_1_3=&quot;+01 (24) 568 900&quot; button_url_1_3=&quot;tell:0124568900&quot; button_icon_1_3=&quot;ti ti-phone-call&quot; background_color=&quot;#ffffff&quot;][/contact-form]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(22,'Features v2','[features style=&quot;4&quot; title=&quot;Optimize Your &lt;br&gt; Finances with Ease.&quot; subtitle=&quot;OUR FEATURES&quot; image=&quot;general/features-4-1.png&quot; image_1=&quot;general/features-4-2.png&quot; quantity=&quot;3&quot; title_1=&quot;Our History&quot; description_1=&quot;A Journey of Innovation, Growth, and Technological Advancement&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Our Mission&quot; description_2=&quot;Empowering Your Digital Success Through Innovative Solutions&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Our Vision&quot; description_3=&quot;Leading the Future of Web Development with Excellence and Innovation&quot; icon_image_3=&quot;icons/icon-3.png&quot;][/features]\n[features style=&quot;9&quot; title=&quot;We bring a rich variety of &lt;br&gt; experience from multiple fields.&quot; subtitle=&quot;Meet Our Team&quot; description=&quot;Leveraging Extensive Experience: Comprehensive Solutions Crafted from Diverse Professional Backgrounds&quot; image=&quot;general/features-9-1.png&quot; image_1=&quot;general/features-9-2.png&quot;][/features]\n[faqs style=&quot;2&quot; title=&quot;Frequently Asked  &lt;br&gt; Questions&quot; description=&quot;Find the answers to all of our most frequently asked questions&quot; image=&quot;general/faqs-img-2.png&quot; quantity=&quot;3&quot; title_1=&quot;Live chat support 24/7&quot; description_1=&quot;More than 300 employees are ready to help you&quot; icon_image_1=&quot;icons/icon-1.png&quot; title_2=&quot;Help desk support center&quot; description_2=&quot;Via ticket system. 24/7 available.&quot; icon_image_2=&quot;icons/icon-2.png&quot; title_3=&quot;Book a demo&quot; description_3=&quot;Live support via video call&quot; icon_image_3=&quot;icons/icon-15.png&quot; category_ids=&quot;1,2,3&quot; background_image=&quot;backgrounds/faqs.png&quot;][/faqs]\n[services style=&quot;4&quot; title=&quot;Professional &lt;b&gt;UltraHD Video&lt;/b&gt; &lt;br&gt; &lt;b&gt;Conferencing&lt;/b&gt; Platform&quot; subtitle=&quot;WHAT WE OFFERS&quot; service_ids=&quot;1,3,4,6&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/contact&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot;][/services]\n[features style=&quot;2&quot; title=&quot;Scalable Business for &lt;span&gt;Startups&lt;/span&gt;&quot; subtitle=&quot;OUR FEATURES&quot; checklist=&quot;Success Accelerators\\nStarted politician Club\\nBusiness Intelligence\\nData analytics&quot; image=&quot;shapes/img-favicon.png&quot; floating_card_image=&quot;backgrounds/feature-2.png&quot; floating_card_title=&quot;Transform Your Business \\n Into Profession&quot; floating_card_description=&quot;Achieve Your a of Business&quot; floating_card_button_label=&quot;Free Update&quot; floating_card_button_url=&quot;/contact&quot; quantity=&quot;2&quot; title_1=&quot;Efficiency Experts&quot; description_1=&quot;A business consultant provides expert advice and guidance to businesses on various aspects.&quot; icon_image_1=&quot;icons/icon-5.png&quot; title_2=&quot;Strategic Solutions&quot; description_2=&quot;Discover why hundreds of millions people use Infinia to chat and call every day.&quot; icon_image_2=&quot;&quot;][/features]\n[services style=&quot;3&quot; title=&quot;Our Core Values&quot; description=&quot;We break down barriers so teams can focus on what matters &ndash; working together &lt;br&gt; to create products their customers love.&quot; service_ids=&quot;1,2,3,4&quot;][/services]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(23,'Privacy Policy','<br><br>[content-page title=\"Infinia System Privacy Policy\" subtitle=\"Privacy Policy\" description=\"At Infinia System, we value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data when you use our services.\"][/content-page]<div class=\"container\">\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Infinia System (\"we,\" \"our,\" or \"us\") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our website, platform, and services (collectively, \"Services\"). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the Services.\n    </p>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Information We Collect\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We may collect personal information that you provide directly to us, including but not limited to:\n    </p>\n    <ul class=\"\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;padding-left:2rem;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        <li style=\"box-sizing:border-box;\">\n            Contact Information: Name, email address, phone number, and postal address.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Account Information: Username, password, and other login details.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Payment Information: Credit card details, billing address, and transaction history.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Communication Information: Feedback, messages, and other communications with us.\n        </li>\n    </ul>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Non-Personal Information\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We may also collect non-personal information about your interactions with our Services, including but not limited to:\n    </p>\n    <ul class=\"\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;padding-left:2rem;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        <li style=\"box-sizing:border-box;\">\n            Usage Data: IP address, browser type, operating system, access times, and pages viewed.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Device Information: Device type, unique device identifiers, and mobile network information.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Location Data: General location information based on IP address or GPS data (with your consent).\n        </li>\n    </ul>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        How We Use Your Information\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We may use the information we collect for various purposes, including but not limited to:\n    </p>\n    <ul class=\"\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;padding-left:2rem;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        <li style=\"box-sizing:border-box;\">\n            Providing, maintaining, and improving our Services.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Processing transactions and managing billing.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Communicating with you about your account and our Services.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Responding to your inquiries and providing customer support.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Analyzing usage patterns to enhance user experience.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Sending marketing and promotional communications (with your consent).\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Complying with legal obligations and protecting our legal rights.\n        </li>\n    </ul>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n    </p>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        How We Share Your Information\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We may share your information in the following circumstances:\n    </p>\n    <ul class=\"\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;padding-left:2rem;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        <li style=\"box-sizing:border-box;\">\n            Service Providers: With third-party vendors, consultants, and service providers who perform services on our behalf.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Business Transfers: In connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Legal Requirements: To comply with legal obligations, enforce our terms of service, or protect our rights, privacy, safety, or property.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Consent: With your consent or at your direction.\n        </li>\n    </ul>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Data Security\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We implement reasonable administrative, technical, and physical security measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee its absolute security.\n    </p>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Your Rights and Choices\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        You have the following rights regarding your personal information:\n    </p>\n    <ul class=\"\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1rem;margin-top:0px;orphans:2;padding-left:2rem;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        <li style=\"box-sizing:border-box;\">\n            Access and Update: You can access and update your personal information through your account settings.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Opt-Out: You can opt out of receiving marketing communications by following the unsubscribe instructions in those communications.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Data Portability: You can request a copy of your personal information in a structured, machine-readable format.\n        </li>\n        <li style=\"box-sizing:border-box;\">\n            Deletion: You can request the deletion of your personal information, subject to certain exceptions prescribed by law.\n        </li>\n    </ul>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Children\'s Privacy\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Our Services are not intended for individuals under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have inadvertently received personal information from a child under 13, we will delete such information from our records.\n    </p>\n    <h5 class=\"mb-3 mt-4\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(17, 24, 39);font-family:Satoshi-Variable;font-size:25px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-bold);letter-spacing:normal;line-height:var(--tc-heading-line-height);margin-bottom:1rem !important;margin-top:1.5rem !important;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        Changes to This Privacy Policy\n    </h5>\n    <p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:var(--tc-neutral-600);font-family:Satoshi-Variable;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:var(--tc-fw-medium);letter-spacing:normal;line-height:var(--tc-body-line-height);margin-bottom:15px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">\n        We may update this Privacy Policy from time to time. If we make material changes, we will notify you by email (sent to the email address specified in your account) or by means of a notice on our Services prior to the change becoming effective. We encourage you to review this Privacy Policy periodically to stay informed about our information practices.\n    </p>\n</div>\n[content-page contact_section_title=\"Contact Us\" contact_section_description=\"If you have any questions or concerns about this Privacy Policy, please contact us at:\" contact_section_subtitle=\"Chat with us\" contact_section_sub_description=\"The support team is always available 24/7\" quantity=\"5\" action_label_1=\"Chat via Whatsapp\" action_url_1=\"https://www.whatsapp.com/\" action_icon_1=\"ti ti-brand-whatsapp\" action_label_2=\"Chat via Viber\" action_url_2=\"https://www.viber.com/\" action_icon_2=\"ti ti-phone-call\" action_label_3=\"Chat via Messager\" action_url_3=\"https://www.facebook.com/\" action_icon_3=\"ti ti-brand-messenger\" action_label_4=\"support@infinia.com\" action_url_4=\"mailto:support@infinia.com\" action_icon_4=\"ti ti-mail\" action_label_5=\"Send us an email\" action_url_5=\"mailto:sale@infinia.com\" action_icon_5=\"ti ti-mail\"][/content-page]<br><br>',1,NULL,NULL,NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(24,'Work Process','[our-history style=&quot;4&quot; title=&quot;What are the &lt;b&gt;Steps Involved&lt;/b&gt; in &lt;br&gt; Our &lt;b&gt;Process&lt;/b&gt;?&quot; subtitle=&quot;How It Work&quot; image=&quot;general/our-history-4.png&quot; floating_action_label=&quot;Video Guide&quot; floating_action_url=&quot;https://www.youtube.com/watch?v=tRxGSHL8bI0&quot; floating_action_icon=&quot;ti ti-brand-youtube&quot; background_image=&quot;backgrounds/team.png&quot;][/our-history]\n[work-process style=&quot;1&quot; no=&quot;01&quot; title=&quot;Choose Services. &lt;br&gt; Initial Consultation.&quot; description=&quot;⚡Begin by exploring the range of services we offer.&quot; image=&quot;general/work-process-1.png&quot; quantity=&quot;4&quot; title_1=&quot;Explore our services. Personalized planning&quot; title_2=&quot;Assess your needs and goals.&quot; title_3=&quot;Select services that align with your objectives.&quot; title_4=&quot;Begin your journey with us by choosing the right services.&quot; background_color=&quot;rgb(242, 251, 249)&quot;][/work-process]\n[work-process style=&quot;2&quot; no=&quot;02&quot; title=&quot;Research &amp; Strategy&quot; description=&quot;We analyze market trends, evaluate your financial situation&quot; image=&quot;general/work-process-2.png&quot; quantity=&quot;4&quot; title_1=&quot;Conduct thorough research on market trends&quot; title_2=&quot;Valuate your current financial status and resources&quot; title_3=&quot;Develop a customized strategy tailored&quot; title_4=&quot;Outline clear steps and milestones&quot;][/work-process]\n[work-process style=&quot;1&quot; no=&quot;03&quot; title=&quot;Implementation Plan&quot; description=&quot;We analyze market trends, evaluate your financial situation&quot; image=&quot;general/work-process-3.png&quot; quantity=&quot;4&quot; title_1=&quot;Create a detailed action plan&quot; title_2=&quot;Assign responsibilities and roles for each phase&quot; title_3=&quot;Set realistic timelines and benchmarks for progress&quot; title_4=&quot;Ensure the plan aligns with your financial strategy&quot;][/work-process]\n[work-process style=&quot;2&quot; no=&quot;04&quot; title=&quot;Final Results&quot; description=&quot;We analyze market trends, evaluate your financial situation&quot; image=&quot;general/work-process-4.png&quot; quantity=&quot;4&quot; title_1=&quot;Implement the strategy and monitor progress.&quot; title_2=&quot;Receive updates on achieved outcomes.&quot; title_3=&quot;Ensure results meet your financial goals.&quot; title_4=&quot;Set a path to financial success.&quot;][/work-process]\n[contact-block title=&quot;Providing the &lt;br&gt; Ultimate Experience &lt;br&gt; in Financial Services&quot; contact_icon=&quot;icons/contact.png&quot; contact_title=&quot;Contact Us&quot; contact_label=&quot;+01 (24) 568 900&quot; contact_url=&quot;tel:0124568 900&quot; primary_action_label=&quot;Get 15 Days Free Trial&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-narrow-right&quot; background_image=&quot;general/contact-block.png&quot;][/contact-block]\n[pricing-plans subtitle=&quot;OUR PLANS&quot; title=&quot;Pricing Plans&quot; description=&quot;⚡We&rsquo;ve got a pricing plan that&rsquo;s perfect for you&quot; package_ids=&quot;1,2,3,4&quot;][/pricing-plans]\n[faqs style=&quot;3&quot; title=&quot;Ask us anything&quot; subtitle=&quot;Pricing FAQs&quot; description=&quot;Have any questions? We&#039;re here to assist you.&quot; quantity=&quot;6&quot; category_ids=&quot;1,2,3&quot; limit=&quot;10&quot;][/faqs]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(25,'Page Integration','[support-tools title=&quot;Access and integrate with 150+ of your preferred tools&quot; subtitle=&quot;WORKING PROCESS&quot; quantity=&quot;9&quot; name_1=&quot;Framer&quot; logo_1=&quot;partners/icon-1.png&quot; description_1=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_1=&quot;Install now&quot; action_url_1=&quot;https://www.framer.com/&quot; name_2=&quot;Reddit&quot; logo_2=&quot;partners/icon-2.png&quot; description_2=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_2=&quot;Install now&quot; action_url_2=&quot;https://www.reddit.com/&quot; name_3=&quot;Airbnb&quot; logo_3=&quot;partners/icon-3.png&quot; description_3=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_3=&quot;Install now&quot; action_url_3=&quot;https://airbnb.com&quot; name_4=&quot;Lemon Squeezy&quot; logo_4=&quot;partners/icon-4.png&quot; description_4=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_4=&quot;Install now&quot; action_url_4=&quot;https://www.lemonsqueezy.com/&quot; name_5=&quot;Netflix&quot; logo_5=&quot;partners/icon-5.png&quot; description_5=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_5=&quot;Install now&quot; action_url_5=&quot;https://www.netflix.com/&quot; name_6=&quot;Instagram&quot; logo_6=&quot;partners/icon-8.png&quot; description_6=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_6=&quot;Install now&quot; action_url_6=&quot;https://www.instagram.com/&quot; name_7=&quot;Mailchimp&quot; logo_7=&quot;partners/icon-6.png&quot; description_7=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_7=&quot;Install now&quot; action_url_7=&quot;https://mailchimp.com/&quot; name_8=&quot;Paypal&quot; logo_8=&quot;partners/icon-9.png&quot; description_8=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_8=&quot;Install now&quot; action_url_8=&quot;https://www.paypal.com/&quot; name_9=&quot;Example&quot; logo_9=&quot;partners/icon-7.png&quot; description_9=&quot;Separating your work from your home life can improve work-life balance and coworking spaces provide a dedicated place to work&quot; action_label_9=&quot;Install now&quot; action_url_9=&quot;https://google.com&quot;][/support-tools]\n[instruction-steps style=&quot;2&quot; title=&quot;How It Works&quot; subtitle=&quot;working process&quot; description=&quot;Comprehensive Suite of Cutting-Edge IT Services.&quot; quantity=&quot;3&quot; title_1=&quot;Choose Services&quot; description_1=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_1=&quot;icons/icon-16.png&quot; title_2=&quot;Project Analysis&quot; description_2=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_2=&quot;icons/icon-14.png&quot; title_3=&quot;Got Final Result&quot; description_3=&quot;It is a long established fact that a reader will be distracted by the readable content of a page.&quot; icon_image_3=&quot;icons/icon-15.png&quot; bottom_description=&quot;Need more help? Go to our&quot; action_label=&quot;Support Center&quot; action_url=&quot;/contact&quot; background_image=&quot;backgrounds/team.png&quot;][/instruction-steps]\n[testimonials style=&quot;2&quot; title=&quot;&lt;b&gt; +100k users &lt;/b&gt; have loved &lt;br&gt; &lt;b&gt; Infinia Conference &lt;/b&gt; System&quot; description=&quot;Provide your team with top-tier group mentoring programs and exceptional professional benefits.&quot; testimonial_ids=&quot;1,2,3,4,5,6&quot; primary_action_label=&quot;View More Testimonials&quot; primary_action_icon=&quot;ti ti-arrow-up-right&quot; primary_action_url=&quot;/about-us&quot;][/testimonials]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06'),(26,'Book a demo','[contact-form display_fields=&quot;phone,email,subject,address&quot; mandatory_fields=&quot;email&quot; style=&quot;3&quot; form_title=&quot;Leave a message&quot; form_description=&quot;Need more help?&quot; title=&quot;Contact Our Team&quot; subtitle=&quot;Get in Tourch&quot; description=&quot;We are a comprehensive service agency with specialists prepared to assist. &lt;br&gt; We will contact you within 24 hours.&quot; quantity=&quot;3&quot; title_1=&quot;Chat with us&quot; description_1=&quot;The support team is always available 24/7&quot; button_label_1_1=&quot;Chat via Whatsapp&quot; button_url_1_1=&quot;https://www.whatsapp.com&quot; button_icon_1_1=&quot;ti ti-brand-whatsapp&quot; button_label_2_1=&quot;Chat via Viber&quot; button_url_2_1=&quot;https://www.viber.com/&quot; button_icon_2_1=&quot;ti ti-phone-call&quot; button_label_3_1=&quot;Chat via Messager&quot; button_url_3_1=&quot;https://www.facebook.com/&quot; button_icon_3_1=&quot;ti ti-brand-messenger&quot; title_2=&quot;Send us an email&quot; description_2=&quot;Our team will respond promptly to your inquiries&quot; button_label_1_2=&quot;support@infinia.com&quot; button_url_1_2=&quot;mailto:support@infinia.com&quot; button_icon_1_2=&quot;ti ti-mail&quot; button_label_2_2=&quot;sale@infinia.com&quot; button_url_2_2=&quot;mailto:sale@infinia.com&quot; button_icon_2_2=&quot;ti ti-mail&quot; title_3=&quot;For more inquiry&quot; description_3=&quot;Reach out for immediate assistance&quot; button_label_1_3=&quot;+01 (24) 568 900&quot; button_url_1_3=&quot;tell:0124568900&quot; button_icon_1_3=&quot;ti ti-phone-call&quot;][/contact-form]\n[site-statistics title=&quot;See why we are &lt;br&gt; trusted the world over&quot; quantity=&quot;4&quot; title_1=&quot;New accounts&quot; data_1=&quot;496&quot; unit_1=&quot;k&quot; title_2=&quot;Finished projects&quot; data_2=&quot;92&quot; unit_2=&quot;+&quot; title_3=&quot;Skilled experts&quot; data_3=&quot;756&quot; unit_3=&quot;+&quot; title_4=&quot;Media posts&quot; data_4=&quot;25&quot; unit_4=&quot;k&quot;][/site-statistics]\n[pricing-plans style=&quot;3&quot; title=&quot;&lt;b&gt;Straightforward&lt;/b&gt;  Pricing &lt;br&gt; Custom &lt;b&gt;Integrations&lt;/b&gt;&quot; subtitle=&quot;Our Pricing&quot; description=&quot;Meet the talented and passionate team members who drive our company forward every day.&quot; quantity=&quot;6&quot; package_ids=&quot;1,2,3&quot; background_images=&quot;backgrounds/bg-line-bottom.png&quot; primary_action_label=&quot;Get Free Quote&quot; primary_action_url=&quot;/contact&quot; primary_action_icon=&quot;ti ti-arrow-narrow-right&quot; secondary_action_label=&quot;How We Work&quot; secondary_action_url=&quot;/contact&quot;][/pricing-plans]',1,NULL,'full-width',NULL,'published','2025-04-29 17:50:06','2025-04-29 17:50:06');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_field_options`
--

DROP TABLE IF EXISTS `pf_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_field_options_custom_field_id_index` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_field_options`
--

LOCK TABLES `pf_custom_field_options` WRITE;
/*!40000 ALTER TABLE `pf_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_field_options_translations`
--

DROP TABLE IF EXISTS `pf_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_field_options_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_field_options_translations`
--

LOCK TABLES `pf_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `pf_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_fields`
--

DROP TABLE IF EXISTS `pf_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_custom_fields_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_fields`
--

LOCK TABLES `pf_custom_fields` WRITE;
/*!40000 ALTER TABLE `pf_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_custom_fields_translations`
--

DROP TABLE IF EXISTS `pf_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_custom_fields_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`lang_code`,`pf_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_custom_fields_translations`
--

LOCK TABLES `pf_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `pf_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_packages`
--

DROP TABLE IF EXISTS `pf_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `features` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_packages`
--

LOCK TABLES `pf_packages` WRITE;
/*!40000 ALTER TABLE `pf_packages` DISABLE KEYS */;
INSERT INTO `pf_packages` VALUES (1,'Trial Plan','Protect for testing','','0',NULL,'monthly','+Single Team Member\n+Over 1200 UI Blocks\n+10 GB of Cloud Storage\n-Personal Email Account\n-Priority Support','published',0,'Get Started','/contact','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(2,'Standard','Great for large teams','','$49','$441','monthly','+05 Team Member\n+All multimedia channels\n+All advanced CRM features\n+Up to 15,000 contacts\n+24/7 Support (Email, Chat)','published',1,'Get Started','/contact','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(3,'Business','Advanced projects','','$69','$621','monthly','+50 Team Member\n+Over 1500 UI Blocks\n+100 GB of Cloud Storage\n+Personal Email Account\n+Priority Support','published',0,'Get Started','/contact','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(4,'Enterprise','For big companies','','$99','$891','monthly','+Customized features\n+Scalability & security\n+Account manager\n+Unlimited chat history\n+50 Integrations','published',0,'Get Started','/contact','2025-04-29 17:49:17','2025-04-29 17:49:17',0);
/*!40000 ALTER TABLE `pf_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_packages_translations`
--

DROP TABLE IF EXISTS `pf_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_packages_translations`
--

LOCK TABLES `pf_packages_translations` WRITE;
/*!40000 ALTER TABLE `pf_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_projects`
--

DROP TABLE IF EXISTS `pf_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_projects`
--

LOCK TABLES `pf_projects` WRITE;
/*!40000 ALTER TABLE `pf_projects` DISABLE KEYS */;
INSERT INTO `pf_projects` VALUES (1,'E-Commerce Website','A full-featured e-commerce platform with a clean UI/UX, integrated payment systems, and advanced search features.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','Brittanyport','Retail Store',0,'projects/1.png',NULL,1193,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Brianne Bosco','2023-08-15',0),(2,'Mobile App Design','A sleek mobile app design for a travel booking service, focusing on user-friendly navigation and visual appeal.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','Swaniawskifort','Travel Agency',0,'projects/2.png',NULL,3502,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Hosea Windler','2023-05-20',0),(3,'Portfolio Website','A minimalist portfolio website for showcasing creative work, with fast loading and responsive design.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','Boehmshire','Creative Professional',1,'projects/3.png',NULL,2871,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Miss Wilma Koelpin','2022-11-10',0),(4,'SEO and Marketing Campaign','A successful SEO and digital marketing campaign, driving organic traffic and increasing conversion rates.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','Harveyton','Tech Startup',0,'projects/4.png',NULL,6228,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Mellie Mohr PhD','2023-02-05',0),(5,'CRM Development','Customized CRM software for managing customer interactions and data, integrating seamlessly with third-party tools.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','East Tonyside','B2B Enterprise',1,'projects/5.png',NULL,6766,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Tanya Crona','2022-09-01',0),(6,'Learning Management System','A scalable LMS for online education, featuring course management, assessments, and real-time progress tracking.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','New Natborough','Educational Institution',0,'projects/6.png',NULL,9417,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Ms. Zora Lehner','2023-01-10',0),(7,'Healthcare Web App','A secure web application for patient data management, appointment scheduling, and telehealth services.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','New Kaci','Healthcare Provider',1,'projects/7.png',NULL,423,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Stephon Eichmann','2023-03-25',0),(8,'Real Estate Listing Platform','A responsive platform for real estate listings, featuring property filters, interactive maps, and virtual tours.','<h5>Research</h5>\n<p>\n    Understanding the importance of user engagement for their app’s success, Infinia System’s team conducted extensive\n    research to identify the pain points and preferences of their user base. They aimed to uncover why users were not\n    engaging as expected and what features or improvements could make a difference. Through surveys, user feedback\n    sessions, and analyzing usage data, Infinia System identified several key areas needing improvement: personalized content delivery, user-friendly interface enhancements, and proactive user support.\n</p>\n<h5>Solution</h5>\n<p>\n    Armed with these insights, Infinia System implemented a comprehensive engagement strategy focused on personalization, user experience optimization, and enhanced customer support.\n</p>\n<p>\n    Personalization: <span>Infinia System leveraged AI-driven algorithms to deliver personalized content and recommendations based on user behavior and preferences. This approach ensured that users received relevant and timely information, increasing their likelihood of interaction with the app.</span>\n</p>\n<p>\n    User Experience Optimization: <span>Infinia System revamped its user interface to make it more intuitive and engaging. Simplified navigation, interactive tutorials, and user-centric design elements were introduced to enhance the overall user experience. These changes made it easier for users to find and utilize the app’s features, leading to increased satisfaction and usage.</span>\n</p>\n<p>\n    Proactive User Support: <span>Infinia System integrated an in-app chat feature powered by AI chatbots to provide immediate assistance to users. This feature addressed user queries in real time, reducing frustration and improving user retention. Additionally, Infinia System set up automated email campaigns to re-engage users who had been inactive for a certain period, encouraging them to return and explore new features.</span>\n</p>\n<h5>Results</h5>\n<p>\n    The implementation of these strategies yielded impressive results for Infinia System. Within six months, the user\n    base skyrocketed from 5,000 to 50,000. The personalized content approach led to a significant increase in user\n    interaction, with engagement rates doubling. The improved user interface received positive feedback, with users\n    spending more time on the app and exploring its features. The proactive support system reduced churn rates, with more users staying active and satisfied with the app.\n</p>\n<p>\n    Overall, Infinia System\'s commitment to enhancing user engagement through personalized experiences, optimized design, and proactive support transformed their user base and positioned them for continued growth and success.\n</p>\n<h5>Conclusion</h5>\n<p>\n    Infinia System\'s journey from 5,000 to 50,000 users in just six months highlights the critical role of user\n    engagement in app success. By focusing on personalized content, user-friendly design, and proactive support, Infinia\n    System not only increased its user base but also created a loyal and engaged community. This case study demonstrates\n    the power of understanding user needs and implementing targeted strategies to drive meaningful engagement and growth.\n</p>\n','Victoriafort','Real Estate Agency',0,'projects/8.png',NULL,6696,'published','2025-04-29 17:49:17','2025-04-29 17:49:17','Aaliyah Schinner PhD','2022-12-15',0);
/*!40000 ALTER TABLE `pf_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_projects_translations`
--

DROP TABLE IF EXISTS `pf_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_projects_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_projects_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_projects_translations`
--

LOCK TABLES `pf_projects_translations` WRITE;
/*!40000 ALTER TABLE `pf_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_quotes`
--

DROP TABLE IF EXISTS `pf_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_quotes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_quotes`
--

LOCK TABLES `pf_quotes` WRITE;
/*!40000 ALTER TABLE `pf_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_service_categories`
--

DROP TABLE IF EXISTS `pf_service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_service_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pf_service_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_service_categories`
--

LOCK TABLES `pf_service_categories` WRITE;
/*!40000 ALTER TABLE `pf_service_categories` DISABLE KEYS */;
INSERT INTO `pf_service_categories` VALUES (1,NULL,'Development','All types of software and web development services.',NULL,0,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(2,NULL,'Design','Creative and intuitive design solutions for UI/UX and branding.',NULL,0,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(3,NULL,'Marketing','Digital marketing services, including SEO, social media, and more.',NULL,0,'published','2025-04-29 17:49:17','2025-04-29 17:49:17'),(4,NULL,'Content','Content creation and management for blogs, websites, and media.',NULL,0,'published','2025-04-29 17:49:17','2025-04-29 17:49:17');
/*!40000 ALTER TABLE `pf_service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_service_categories_translations`
--

DROP TABLE IF EXISTS `pf_service_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_service_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_service_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pf_service_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_service_categories_translations`
--

LOCK TABLES `pf_service_categories_translations` WRITE;
/*!40000 ALTER TABLE `pf_service_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_service_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_services`
--

DROP TABLE IF EXISTS `pf_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `views` int NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pf_services_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_services`
--

LOCK TABLES `pf_services` WRITE;
/*!40000 ALTER TABLE `pf_services` DISABLE KEYS */;
INSERT INTO `pf_services` VALUES (1,4,'Research Planning','Get expert advice on research planning and effective execution strategies tailored for your business growth.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',1,'services/2.jpg',NULL,5798,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(2,2,'Strategy Lab','Unlock your business potential with insightful, strategic solutions customized for your industry’s unique needs.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',0,'services/3.jpg',NULL,8840,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(3,2,'Business Consultancy','We provide expert consultancy services to help your business overcome challenges and achieve sustainable growth.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',1,'services/8.jpg',NULL,1733,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(4,4,'Business Promotion','Boost your brand’s visibility and connect with a wider audience through innovative, cutting-edge promotion strategies.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',0,'services/6.jpg',NULL,4957,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(5,1,'Finance Advisory','Manage your finances efficiently and effectively with our expert financial planning and advisory services.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',0,'services/9.jpg',NULL,1078,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0),(6,1,'Revenue Generation','Discover new revenue streams and maximize profitability using our proven and innovative business models.','<h4 class=\"mb-3\">Innovative Business Services</h4>\n<p class=\"mb-0\">\n    In today\'s fast-paced and competitive business environment, staying ahead requires more than just traditional methods. At Infinia, we understand the necessity of innovation in driving business growth and success.\n    <span class=\"text-900 fw-bold\">Our innovative business</span> services are designed to help you navigate the complexities of the modern marketplace, leveraging cutting-edge technology and forward-thinking strategies to\n    transform your operations and achieve your goals. We implement intelligent automation tools tailored to your specific needs.\n</p>\n[content-checklist checklist=\"Customer Journey Mapping \\n Customer Feedback Systems \\n Sustainable Business Practices \\n Corporate Social Responsibility \\n Ideation and Concept \\n Intellectual Property\"][/content-checklist]\n<h5 class=\"pt-4 border-top mb-3 mt-5\">Digital Transformation</h5>\n<p class=\"mb-4\">\n    At Infinia, we are committed to delivering innovative solutions that drive real results. Our team of experts combines industry knowledge with technological expertise to provide services that are both practical and\n    visionary. We work closely with you to understand your unique challenges and tailor our services to meet your specific needs.\n</p>\n[content-features quantity=\"3\" title_1=\"Market Analysis and Insights\" description_1=\"Gain a deep understanding of your industry \\n and competitors with our comprehensive market analysis.\" icon_1=\"ti ti-tags\" title_2=\"Business Model Innovation\" description_2=\"We assist in redefining your business model \\n to align with current market trends and future demands.\" icon_2=\"ti ti-stars\" title_3=\"Change Management\" description_3=\"Successfully manage organizational change with our expert guidance. We help you navigate transitions smoothly.\" icon_3=\"ti ti-chart-donut-4\" image=\"backgrounds/service-detail-feature.png\"][/content-features]\n<h4 class=\"mt-3 pt-3 border-top mb-3\">Sustainability and CSR</h4>\n<p class=\"mb-3\">\n    Embrace the future of business with Infinia\'s innovative services. Let us help you transform your organization and achieve unprecedented success. Contact us today to learn more about how we can support your journey\n    towards innovation and excellence.\n</p>\n<p class=\"fw-bold text-900\">\n    Ideation and Concept Development:\n    <span class=\"fw-medium text-600\">Foster a culture of innovation within your organization. We facilitate ideation sessions and help you develop viable concepts that can be turned into profitable ventures.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    R&D Support: <span class=\"fw-medium text-600\">Accelerate your research and development efforts with our expert support. We provide the resources and expertise needed to bring your innovative ideas to life.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Intellectual Property Management:\n    <span class=\"fw-medium text-600\">Protect your innovations with our comprehensive IP management services. From patent filing to trademark registration, we safeguard your intellectual assets.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Market Analysis and Insights:\n    <span class=\"fw-medium text-600\">Stay ahead of the competition with in-depth market analysis. We provide you with actionable insights that help you identify new opportunities and make informed strategic decisions.</span>\n</p>\n<p class=\"fw-bold text-900\">\n    Business Model Innovation: <span class=\"fw-medium text-600\">Reinvent your business model to meet the demands of today\'s market. Our experts help you create a flexible, scalable model that drives</span>\n</p>\n<h5 class=\"pt-3 border-top mb-3 mt-5\">Questions about service</h5>\n[faqs style=\"1\" category_ids=\"2\" enable_lazy_loading=\"no\"][/faqs]\n',0,'services/7.jpg',NULL,4566,'published','2025-04-29 17:49:17','2025-04-29 17:49:17',0);
/*!40000 ALTER TABLE `pf_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_services_translations`
--

DROP TABLE IF EXISTS `pf_services_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_services_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_services_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pf_services_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_services_translations`
--

LOCK TABLES `pf_services_translations` WRITE;
/*!40000 ALTER TABLE `pf_services_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_services_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(1,1),(9,2),(6,2),(9,3),(4,3),(3,4),(9,4),(7,5),(3,6),(7,6),(3,7),(1,7),(2,8),(9,8),(1,9),(7,9),(2,10),(5,10),(4,11),(2,11),(8,12),(3,12),(1,13),(2,13),(1,14),(8,14),(7,15);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (7,1),(3,1),(1,1),(2,2),(6,2),(7,2),(4,3),(5,3),(3,3),(4,4),(7,4),(6,4),(2,5),(4,5),(1,5),(3,6),(7,6),(8,7),(1,7),(7,7),(8,8),(4,8),(3,9),(4,9),(1,9),(5,10),(3,10),(2,11),(8,11),(3,11),(1,12),(4,12),(2,12),(8,13),(4,13),(3,13),(8,14),(1,14),(4,14),(7,15),(2,15),(4,15);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Top Trends in Digital Marketing and How They Impact Your Business','The digital marketing landscape is ever-evolving, driven by technological advancements, changes in consumer behavior, and the ongoing quest for businesses to stay ahead of the competition. Staying informed about the latest trends is crucial for any business looking to enhance its marketing strategies and achieve growth','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/9.jpg',2367,NULL,'2024-12-19 05:50:35','2025-04-29 17:49:28'),(2,'My Journey in Open Source: 3 Years of Contributions','A personal reflection on my experiences contributing to open source projects over the past three years, sharing lessons learned and advice for aspiring contributors.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/19.jpg',2007,NULL,'2024-12-31 10:52:07','2025-04-29 17:49:28'),(3,'5 Essential Tools for Web Developers in 2024','Discover the top 5 tools that are essential for web developers in 2024, from frameworks and libraries to productivity boosters.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/18.jpg',2176,NULL,'2024-09-14 19:26:23','2025-04-29 17:49:29'),(4,'How I Built My Personal Portfolio Using Botble CMS','A detailed walkthrough on how I built my portfolio website using Botble CMS, customizing it with the Zelio template for an impressive online presence.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/4.jpg',111,NULL,'2025-04-07 05:55:03','2025-04-29 17:49:29'),(5,'Creating Responsive UIs with Tailwind CSS','Learn how to create responsive user interfaces quickly and efficiently using the utility-first CSS framework, Tailwind CSS.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/17.jpg',1088,NULL,'2024-11-28 05:35:13','2025-04-29 17:49:29'),(6,'Why I Love Contributing to Open Source Projects','A deep dive into why open source matters to me, how it helped me grow as a developer, and why every developer should contribute to open source.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/17.jpg',2251,NULL,'2024-08-14 18:02:40','2025-04-29 17:49:29'),(7,'A Deep Dive into Laravel for Beginners','A comprehensive guide for beginners who want to learn Laravel, covering everything from installation to building a simple application.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/20.jpg',1634,NULL,'2024-08-22 02:09:12','2025-04-29 17:49:29'),(8,'Exploring the Benefits of MySQL for Large-Scale Projects','An exploration of why MySQL is a great choice for large-scale projects, highlighting features, scalability, and performance tips.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/9.jpg',296,NULL,'2024-10-24 11:36:16','2025-04-29 17:49:29'),(9,'How to Integrate APIs in Node.js for Your Next Project','Learn how to seamlessly integrate third-party APIs in your Node.js applications for powerful data access and functionality.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/16.jpg',2376,NULL,'2024-05-26 21:10:01','2025-04-29 17:49:29'),(10,'Best Practices for Designing User-Friendly Websites','Discover the best practices for designing websites that are not only aesthetically pleasing but also user-friendly and accessible.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/19.jpg',1329,NULL,'2024-09-28 18:08:47','2025-04-29 17:49:29'),(11,'Lessons from My First Web Development Job','Reflecting on my first web development job, the lessons I learned, the challenges I faced, and how it shaped my career.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/2.jpg',163,NULL,'2024-08-30 09:16:02','2025-04-29 17:49:29'),(12,'How to Contribute to Open Source: A Beginner’s Guide','A step-by-step guide on how beginners can start contributing to open source projects, with tips on finding the right project and making meaningful contributions.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/5.jpg',504,NULL,'2024-07-16 00:45:38','2025-04-29 17:49:29'),(13,'Optimizing Web Performance with React.js','Learn how to optimize your React.js applications for better performance, focusing on code splitting, lazy loading, and efficient state management.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/9.jpg',2410,NULL,'2024-09-02 10:07:23','2025-04-29 17:49:29'),(14,'My Top 5 GitHub Projects','An overview of my top 5 GitHub projects, showcasing what I’ve built and how they’ve helped me grow as a developer.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/6.jpg',1831,NULL,'2024-07-12 23:11:25','2025-04-29 17:49:29'),(15,'Adapting to the New Web Development Trends in 2024','A look at the latest trends in web development for 2024, including new technologies, best practices, and what the future holds for developers.','<h5>Artificial Intelligence and Machine Learning</h5>\n<p>\n    Impact: AI and machine learning are revolutionizing digital marketing by providing deeper insights into consumer\n    behavior, enabling personalized marketing strategies, and automating repetitive tasks. For businesses, this means\n    more efficient targeting, improved customer experiences, and higher conversion rates.\n</p>\n<p>\n    Implementation: Integrate AI tools like chatbots for customer service, use machine learning algorithms to analyze\n    customer data, and employ AI-driven content creation tools to generate personalized marketing content.\n</p>\n<h5>Voice Search Optimization</h5>\n<p>\n    With the rise of smart speakers and voice assistants like Amazon\'s Alexa, Google Assistant, and Apple\'s Siri,\n    optimizing for voice search is becoming essential. Voice searches tend to be more conversational and longer than\n    text searches, requiring a different approach to SEO.\n</p>\n<p>\n    Focus on natural language processing, use long-tail keywords, and ensure your website content answers common\n    questions directly and concisely. Additionally, optimize your local SEO, as many voice searches are\n    location-specific.\n</p>\n<h5>Influencer Marketing</h5>\n<p>\n    Impact: Influencer marketing leverages the reach and credibility of influencers to promote products and services.\n    This trend is particularly effective for targeting niche markets and building trust with potential customers.\n</p>\n<p>\n    Implementation: Identify influencers who align with your brand values and have a genuine connection with your target\n    audience. Collaborate with them on content creation and campaigns that highlight your products authentically.\n</p>\n[content-quote quote=\"Marketing is about values. It’s a complicated and noisy world, and we’re not going to get a chance to get people to remember much about us. No company is. So we have to be really clear about what we want them to know about us.\" author=\"Sarah Thompson\" author_image=\"testimonials/avatar-18.png\" author_description=\"Marketing Director\"][/content-quote]\n<h5>Conclusion</h5>\n<p>\n    \"Staying ahead of digital marketing trends is not just about keeping up with the latest technologies; it\'s about\n    understanding your customers\' evolving needs and finding innovative ways to meet them,\" says Jane Doe, Chief\n    Marketing Officer at Infinia.\n</p>\n<p>\n    Adapting to these top digital marketing trends can significantly impact your business by enhancing customer\n    engagement, improving conversion rates, and driving growth. Staying ahead of the curve requires continuous learning,\n    experimentation, and a willingness to embrace new technologies and strategies. By doing so, your business can thrive\n    in the dynamic digital landscape and achieve long-term success.\n</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/12.jpg',1805,NULL,'2024-09-24 11:54:49','2025-04-29 17:49:29');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"careers.index\":true,\"careers.create\":true,\"careers.edit\":true,\"careers.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"plugins.portfolio\":true,\"portfolio.projects.index\":true,\"portfolio.projects.create\":true,\"portfolio.projects.edit\":true,\"portfolio.projects.destroy\":true,\"portfolio.service-categories.index\":true,\"portfolio.service-categories.create\":true,\"portfolio.service-categories.edit\":true,\"portfolio.service-categories.destroy\":true,\"portfolio.services.index\":true,\"portfolio.services.create\":true,\"portfolio.services.edit\":true,\"portfolio.services.destroy\":true,\"portfolio.packages.index\":true,\"portfolio.packages.create\":true,\"portfolio.packages.edit\":true,\"portfolio.packages.destroy\":true,\"portfolio.quotation-requests.index\":true,\"portfolio.quotation-requests.create\":true,\"portfolio.quotation-requests.edit\":true,\"portfolio.quotation-requests.destroy\":true,\"portfolio.custom-fields.index\":true,\"portfolio.custom-fields.create\":true,\"portfolio.custom-fields.edit\":true,\"portfolio.custom-fields.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-04-29 17:49:08','2025-04-29 17:49:08');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','b8609112c8bf3c74631d39a057c0ed6d',NULL,'2025-04-29 17:50:06'),(2,'api_enabled','0',NULL,'2025-04-29 17:50:06'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"newsletter\",\"portfolio\",\"simple-slider\",\"team\",\"testimonial\",\"translation\"]',NULL,'2025-04-29 17:50:06'),(4,'theme','infinia',NULL,'2025-04-29 17:50:06'),(5,'show_admin_bar','1',NULL,'2025-04-29 17:50:06'),(6,'language_hide_default','1',NULL,'2025-04-29 17:50:06'),(7,'language_switcher_display','dropdown',NULL,'2025-04-29 17:50:06'),(8,'language_display','all',NULL,'2025-04-29 17:50:06'),(9,'language_hide_languages','[]',NULL,'2025-04-29 17:50:06'),(37,'simple_slider_using_assets','0',NULL,'2025-04-29 17:50:06'),(38,'admin_favicon','general/favicon.png',NULL,'2025-04-29 17:50:06'),(39,'admin_logo','general/logo-white.png',NULL,'2025-04-29 17:50:06'),(40,'theme-infinia-favicon','general/favicon.png',NULL,NULL),(41,'theme-infinia-logo','general/logo-dark.png',NULL,NULL),(42,'theme-infinia-logo_dark','general/logo-white.png',NULL,NULL),(43,'theme-infinia-site_title','Multipurpose Business & Startup Theme',NULL,NULL),(44,'theme-infinia-seo_description','Infinia is a versatile Botble CMS theme tailored for technology sectors, including B2B, IT, consulting, and digital marketing. Built on Bootstrap 5, it offers professional, responsive designs to suit diverse business needs.',NULL,NULL),(45,'theme-infinia-copyright','Copyright © %Y Infinia. All Rights Reserved',NULL,NULL),(46,'theme-infinia-404_image','general/404.png',NULL,NULL),(47,'theme-infinia-breadcrumb_background_image','backgrounds/breadcrumb.png',NULL,NULL),(48,'theme-infinia-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(49,'theme-infinia-primary_color','#6d4df2',NULL,NULL),(50,'theme-infinia-tp_primary_font','Satoshi-Variable',NULL,NULL),(51,'theme-infinia-homepage_id','1',NULL,NULL),(52,'theme-infinia-blog_page_id','12',NULL,NULL),(53,'theme-infinia-default_theme_mode','light',NULL,NULL),(54,'theme-infinia-newsletter_popup_enable','1',NULL,NULL),(55,'theme-infinia-newsletter_popup_image','general/features-6.png',NULL,NULL),(56,'theme-infinia-newsletter_popup_title','Stay Updated with Infinia',NULL,NULL),(57,'theme-infinia-newsletter_popup_subtitle','Newsletter',NULL,NULL),(58,'theme-infinia-newsletter_popup_description','Join our newsletter and discover how Infinia\'s multipurpose business startup solution can transform your digital presence with modern, responsive design and powerful features.',NULL,NULL),(59,'theme-infinia-footer_background_image','general/line-bg.png',NULL,NULL),(60,'theme-infinia-suggest_keywords','Startup, Agency, Creative, Consulting, IT services, Pricing',NULL,NULL),(61,'theme-infinia-footer_text_color','#ffffff',NULL,NULL),(62,'theme-infinia-footer_background_color','#111827',NULL,NULL),(63,'theme-infinia-footer_heading_color','#ffffff',NULL,NULL),(64,'theme-infinia-footer_border_color','#303234',NULL,NULL),(65,'theme-infinia-header_layout','full-width',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'<b>Best</b> Solutions <br> for <b>Innovation</b>','sliders/1.png',NULL,'Infinia offers full range of consultancy &amp; training methods for business consultation.',0,'2025-04-29 17:49:48','2025-04-29 17:49:48'),(2,1,'<b>Best</b> Solutions <br> for <b>Innovation</b>','sliders/2.png',NULL,'Infinia offers full range of consultancy &amp; training methods for business consultation..',1,'2025-04-29 17:49:48','2025-04-29 17:49:48');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2025-04-29 17:49:48','2025-04-29 17:49:48');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'research-planning',1,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(2,'strategy-lab',2,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(3,'business-consultancy',3,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(4,'business-promotion',4,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(5,'finance-advisory',5,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(6,'revenue-generation',6,'Botble\\Portfolio\\Models\\Service','services','2025-04-29 17:49:17','2025-04-29 17:49:17'),(7,'e-commerce-website',1,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(8,'mobile-app-design',2,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(9,'portfolio-website',3,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(10,'seo-and-marketing-campaign',4,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(11,'crm-development',5,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(12,'learning-management-system',6,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(13,'healthcare-web-app',7,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(14,'real-estate-listing-platform',8,'Botble\\Portfolio\\Models\\Project','projects','2025-04-29 17:49:17','2025-04-29 17:49:17'),(15,'web-development',1,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(16,'open-source-contributions',2,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(17,'tutorials',3,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(18,'technology-reviews',4,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(19,'personal-blog',5,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(20,'career-journey',6,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(21,'coding-challenges',7,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(22,'design-portfolio',8,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(23,'collaborations',9,'Botble\\Blog\\Models\\Category','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(24,'botble-cms',1,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(25,'javascript',2,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(26,'open-source',3,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(27,'web-design',4,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(28,'api-development',5,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(29,'full-stack-development',6,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(30,'vietnam-developer',7,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(31,'github-projects',8,'Botble\\Blog\\Models\\Tag','tag','2025-04-29 17:49:28','2025-04-29 17:49:28'),(32,'top-trends-in-digital-marketing-and-how-they-impact-your-business',1,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(33,'my-journey-in-open-source-3-years-of-contributions',2,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:28','2025-04-29 17:49:28'),(34,'5-essential-tools-for-web-developers-in-2024',3,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(35,'how-i-built-my-personal-portfolio-using-botble-cms',4,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(36,'creating-responsive-uis-with-tailwind-css',5,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(37,'why-i-love-contributing-to-open-source-projects',6,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(38,'a-deep-dive-into-laravel-for-beginners',7,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(39,'exploring-the-benefits-of-mysql-for-large-scale-projects',8,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(40,'how-to-integrate-apis-in-nodejs-for-your-next-project',9,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(41,'best-practices-for-designing-user-friendly-websites',10,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(42,'lessons-from-my-first-web-development-job',11,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(43,'how-to-contribute-to-open-source-a-beginners-guide',12,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(44,'optimizing-web-performance-with-reactjs',13,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(45,'my-top-5-github-projects',14,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(46,'adapting-to-the-new-web-development-trends-in-2024',15,'Botble\\Blog\\Models\\Post','','2025-04-29 17:49:29','2025-04-29 17:49:29'),(47,'homepage',1,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(48,'projects',2,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(49,'services',3,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(50,'services-v2',4,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(51,'services-v3',5,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(52,'our-team',6,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(53,'our-team-v2',7,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(54,'our-team-v3',8,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(55,'our-team-v4',9,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(56,'our-team-v5',10,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(57,'our-team-v6',11,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(58,'blog',12,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(59,'contact',13,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(60,'about-us',14,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(61,'about-us-v2',15,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(62,'about-us-v3',16,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(63,'pricing',17,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(64,'pricing-v2',18,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(65,'pricing-v3',19,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(66,'coming-soon',20,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(67,'features',21,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(68,'features-v2',22,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(69,'privacy-policy',23,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(70,'work-process',24,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(71,'page-integration',25,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(72,'book-a-demo',26,'Botble\\Page\\Models\\Page','','2025-04-29 17:49:47','2025-04-29 17:49:47'),(73,'stunning-electric-cars-of-2024',1,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:48','2025-04-29 17:49:48'),(74,'top-luxury-cars-for-special-occasions',2,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:48','2025-04-29 17:49:48'),(75,'family-cars-with-advanced-safety-features',3,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:48','2025-04-29 17:49:48'),(76,'off-road-vehicles-in-action',4,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:48','2025-04-29 17:49:48'),(77,'the-evolution-of-car-design-a-visual-journey',5,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:48','2025-04-29 17:49:48'),(78,'best-road-trip-cars-of-the-year',6,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:49','2025-04-29 17:49:49'),(79,'exclusive-new-car-models-unveiled',7,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:49','2025-04-29 17:49:49'),(80,'iconic-cars-from-around-the-world',8,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:49','2025-04-29 17:49:49'),(81,'the-future-of-electric-and-hybrid-cars',9,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:49','2025-04-29 17:49:49'),(82,'luxury-car-interiors-a-closer-look',10,'Botble\\Gallery\\Models\\Gallery','galleries','2025-04-29 17:49:49','2025-04-29 17:49:49'),(83,'senior-full-stack-engineer',1,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(84,'lead-backend-developer',2,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(85,'uiux-designer',3,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(86,'product-manager',4,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(87,'data-scientist',5,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(88,'devops-engineer',6,'ArchiElite\\Career\\Models\\Career','careers','2025-04-29 17:49:49','2025-04-29 17:49:49'),(89,'development',1,'Botble\\Portfolio\\Models\\ServiceCategory','service-categories','2025-04-29 17:50:06','2025-04-29 17:50:06'),(90,'design',2,'Botble\\Portfolio\\Models\\ServiceCategory','service-categories','2025-04-29 17:50:06','2025-04-29 17:50:06'),(91,'marketing',3,'Botble\\Portfolio\\Models\\ServiceCategory','service-categories','2025-04-29 17:50:06','2025-04-29 17:50:06'),(92,'content',4,'Botble\\Portfolio\\Models\\ServiceCategory','service-categories','2025-04-29 17:50:06','2025-04-29 17:50:06'),(93,'trial-plan',1,'Botble\\Portfolio\\Models\\Package','packages','2025-04-29 17:50:06','2025-04-29 17:50:06'),(94,'standard',2,'Botble\\Portfolio\\Models\\Package','packages','2025-04-29 17:50:06','2025-04-29 17:50:06'),(95,'business',3,'Botble\\Portfolio\\Models\\Package','packages','2025-04-29 17:50:06','2025-04-29 17:50:06'),(96,'enterprise',4,'Botble\\Portfolio\\Models\\Package','packages','2025-04-29 17:50:06','2025-04-29 17:50:06'),(97,'michael-anderson',1,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(98,'jennifer-brown',2,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(99,'sarah-brown',3,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(100,'david-clark',4,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(101,'jessica-carter',5,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(102,'lauren-graham',6,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(103,'james-bennett',7,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06'),(104,'william-foster',8,'Botble\\Team\\Models\\Team','teams','2025-04-29 17:50:06','2025-04-29 17:50:06');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Botble CMS',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(2,'JavaScript',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(3,'Open Source',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(4,'Web Design',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(5,'API Development',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(6,'Full Stack Development',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(7,'Vietnam Developer',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28'),(8,'GitHub Projects',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-04-29 17:49:28','2025-04-29 17:49:28');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Michael Anderson','teams/1.png','Co-Founder',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+13529938625','lubowitz.nicholaus@donnelly.info','53552 Cassin Springs Apt. 942\nEast Teresaport, OH 50331-6971',NULL,'Dolore qui aut architecto quo recusandae est dolorum cupiditate. In hic tempora sed illo asperiores. Ab dicta rerum suscipit dicta sed nihil sint. Reiciendis qui nihil et. Omnis quia ut eius perspiciatis porro autem incidunt.'),(2,'Jennifer Brown','teams/2.png','CEO &amp; Founder',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+18048243039','oda75@gmail.com','3153 Reva Fork\nLake Rubenfurt, NC 16940-1247',NULL,'Id dignissimos neque reprehenderit nostrum possimus sit est. Delectus nam quis quos architecto aspernatur minus rerum. Commodi quisquam labore quos ea. Ut cupiditate atque dicta. Et aspernatur totam quibusdam voluptatem.'),(3,'Sarah Brown','teams/3.png','Product Manager',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+19417213361','tschneider@parisian.com','5202 Rebecca Forks Apt. 403\nSouth Sheila, ME 01003-3447',NULL,'Laborum id aliquid enim eos tempora cumque suscipit. Et nesciunt ipsam temporibus explicabo mollitia ipsum. Et non labore ut rerum. Sunt similique vero aut at quidem maiores eos. Voluptate corporis vitae nulla molestiae.'),(4,'David Clark','teams/4.png','UX/UI Designer',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+15097436729','crist.cristopher@hotmail.com','46987 Augusta Flats\nBruenstad, MS 18719-3546',NULL,'Laudantium aut reiciendis repellendus similique aut fugit ducimus. Consequuntur nesciunt quos velit et sed est quis impedit. Quam voluptas sit minima nihil perspiciatis hic.'),(5,'Jessica Carter','teams/5.png','DevOps Engineer',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+19475903303','demetris41@gmail.com','82847 Jones Rue\nPowlowskibury, OK 17558-2570',NULL,'Accusantium quod laboriosam non sit assumenda libero magni. Qui assumenda nemo quis eum. Iure magnam in non sed qui unde commodi.'),(6,'Lauren Graham','teams/6.png','Data Analyst',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+17328863282','mpurdy@ebert.com','5022 Asia Glen\nGrahamfurt, IL 30502',NULL,'Unde provident dolorem est sint. Est neque repudiandae illo alias necessitatibus molestiae. Qui nulla debitis explicabo dolorum eum fugit sequi. Veniam eos laboriosam rerum et. Maiores ad assumenda expedita voluptas aspernatur vel.'),(7,'James Bennett','teams/7.png','Sales Executive',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+16413631834','sfarrell@schultz.com','34507 Billie Forest Apt. 604\nNorth Javonview, ND 89060',NULL,'Repellat repellat quia ipsa velit veniam et maiores. Id quia ipsa assumenda dolores et. Quisquam ratione ipsam molestiae eos nostrum illo aliquam. Et iusto itaque natus placeat. Est deserunt molestias officia est vel excepturi.'),(8,'William Foster','teams/8.png','Marketing Specialist',NULL,'{\"facebook\":\"https:\\/\\/facebook.com\",\"twitter\":\"https:\\/\\/twitter.com\",\"instagram\":\"https:\\/\\/instagram.com\"}','published','2025-04-29 17:49:19','2025-04-29 17:49:19','<p>\n    As Co-Founder of Infinia Agency, Daniel Martinez brings a wealth of knowledge, experience, and visionary leadership to the team. With a career spanning over two decades in the industry,\n    <span>Daniel</span> has been instrumental in driving the strategic direction and growth of Infinia. His passion for innovation and excellence is evident in every project and initiative he undertakes.\n</p>\n<h5>Educational Qualifications</h5>\n<p>Daniel\'s strong educational foundation has equipped his with the strategic acumen and marketing expertise necessary to lead Infinia Agency to success.</p>\n<ul>\n    <li>\n        <p>\n            MBA in Business Administration\n            <span>- Harvard Business School</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Bachelor’s Degree in Marketing\n            <span> - University of California, Berkeley</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Certified Digital Marketing Professional (CDMP)\n            <span> - Digital Marketing Institute</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Executive Leadership Program\n            <span> - Stanford Graduate School of Business</span>\n        </p>\n    </li>\n    <li>\n        <p>\n            Advanced Certificate in Strategic Management\n            <span> - MIT Sloan School of Management</span>\n        </p>\n    </li>\n</ul>\n<h5>Awards</h5>\n<p>Daniel\'s contributions to the industry have been recognized through numerous awards, underscoring his impact and dedication.</p>\n<ul>\n    <li>\n        <p>Top 50 in Marketing (2022)</p>\n    </li>\n    <li>\n        <p>Innovative Leader of the Year (2021)</p>\n    </li>\n    <li>\n        <p>Excellence in Business Strategy Award (2020)</p>\n    </li>\n    <li>\n        <p>Marketing Excellence Award (2019)</p>\n    </li>\n    <li>\n        <p>Businessman of the Year (2018)</p>\n    </li>\n    <li>\n        <p>Leadership in Innovation Award (2017)</p>\n    </li>\n</ul>\n<h5>Latest Projects</h5>\n<p>\n    Digital Transformation Initiative for Global Retailer:\n    <span>Led a comprehensive digital overhaul for a major retail chain, enhancing their online presence and optimizing their e-commerce platform.</span>\n</p>\n<p>Sustainability Strategy Development for a Fortune 500 Company: <span>Designed and implemented a sustainability strategy that reduced the</span></p>\n','+17817866228','drussel@abshire.com','8012 Felicita Plaza\nWest Donatoland, NC 23438',NULL,'Qui voluptatem natus atque inventore. Tempora deserunt aut omnis. Asperiores occaecati inventore vel fugit vero voluptatem tempora.');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'James Dopli','The team\'s dedication and expertise have transformed our business. Their innovative solutions and outstanding support have significantly boosted our productivity and client satisfaction. Allowing us to streamline our processes and focus on what matters most.','testimonials/avatar-20.png','CEO of Tech Innovators Inc','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(2,'Theodore Handle','Our collaboration with the team has been instrumental in optimizing our project management processes. The extensive selection of over 1200 UI blocks has allowed us to customize our project interfaces to meet specific client needs effectively. The generous 10 GB of cloud storage has provided ample space for storing project files securely, enabling seamless collaboration across distributed teams.','testimonials/avatar-10.png','Software Engineer','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(3,'Shahnewaz Sakil','The individual email account feature has improved internal communication clarity and professionalism. Moreover, the premium support team\'s responsiveness and expertise have ensured minimal disruptions and quick resolutions to any technical challenges we\'ve faced. I highly recommend their services for any enterprise seeking robust SaaS solutions.','testimonials/avatar-14.png','Marketing Director','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(4,'Albert Flores','Our experience with this team has surpassed our expectations on every front. The comprehensive suite of over 1200 UI blocks has enabled us to craft highly functional and aesthetically pleasing user interfaces that resonate with our target audience. Equally impressive is the premium support team\'s proactive approach.','testimonials/avatar-11.png','Software Engineer','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(5,'James Dopli','The team\'s dedication and expertise have transformed our business. Their innovative solutions and outstanding support have significantly boosted our productivity and client satisfaction. Allowing us to streamline our processes and focus on what matters most.','testimonials/avatar-18.png','CEO of Tech Innovators Inc','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(6,'Theodore Handle','Our collaboration with the team has been instrumental in optimizing our project management processes. The extensive selection of over 1200 UI blocks has allowed us to customize our project interfaces to meet specific client needs effectively. The generous 10 GB of cloud storage has provided ample space for storing project files securely, enabling seamless collaboration across distributed teams.','testimonials/avatar-4.png','Software Engineer','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(7,'Dr. Alden Schuppe III','Vitae aut eum doloremque corrupti voluptatum beatae quia. Porro maiores ipsam quasi laboriosam et animi. Asperiores eos accusamus quis quod. Iure occaecati id dolores magni.','testimonials/avatar-5.png','Boehm PLC','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(8,'Mr. Demond Hettinger','Expedita error in dolorem maiores rerum repellat ex voluptatibus. Magni debitis mollitia sunt inventore vitae natus sequi possimus. Nemo non ipsa error aut.','testimonials/avatar-13.png','Funk, Stamm and Huels','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(9,'Micheal Braun','Tempora et autem sunt nesciunt numquam fugit expedita. Amet minus earum qui quos voluptatibus qui. Voluptas quia rerum velit totam autem. At quibusdam quos sint expedita rem perspiciatis illo.','testimonials/avatar-10.png','Keeling-Lueilwitz','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(10,'Deonte Kuphal','Inventore sunt reiciendis neque. Omnis dicta non enim quia at. Molestiae et natus dolorem rerum ex sed harum. Sint doloremque natus qui mollitia.','testimonials/avatar-14.png','Bailey, Sauer and Ullrich','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(11,'Bonita Farrell I','Nesciunt illo officia debitis iste ipsam voluptates qui. Dolorum sit vero similique nostrum veritatis eaque. Quia qui accusamus officia vero quo. Rem id qui quod et.','testimonials/avatar-9.png','Bogan-Gleason','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(12,'Sammie Bradtke DDS','Deleniti eum voluptas vitae est qui. Dolores mollitia aut tenetur rerum. Harum eaque praesentium adipisci omnis. Et voluptates libero praesentium possimus molestias voluptatibus.','testimonials/avatar-1.png','West-Hauck','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(13,'Elisabeth Raynor','Autem sint voluptate architecto dolorem animi eos. Possimus sed rerum rerum enim id quam nisi. Eum alias esse vitae quia illo. Occaecati voluptas ipsam velit ea.','testimonials/avatar-15.png','VonRueden-Predovic','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(14,'Junior Pollich','In nisi assumenda laudantium rem hic pariatur ad et. Iure unde alias deleniti.','testimonials/avatar-3.png','McDermott PLC','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(15,'Kaylie Keeling','Aperiam inventore nulla velit repudiandae. Aut et sed numquam nam eveniet est voluptate.','testimonials/avatar-13.png','Fisher-Bruen','published','2025-04-29 17:49:23','2025-04-29 17:49:23'),(16,'Mrs. Casandra Schaefer','Eius quia eveniet aut debitis. Eum vel qui aperiam officiis. Corrupti pariatur esse saepe animi rerum.','testimonials/avatar-10.png','Bechtelar and Sons','published','2025-04-29 17:49:23','2025-04-29 17:49:23');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bonnie24@watsica.com',NULL,'$2y$12$uCDwfBTcs2tEB4mocch7YO3HQg//48jWigzOayoPCiV50P0o4hqlK',NULL,'2025-04-29 17:49:08','2025-04-29 17:49:08','Cecelia','Jacobi','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomerSupportWidget','project_sidebar','infinia',1,'{\"title\":\"Providing the Ultimate Experience in Financial Services\",\"contact_title\":\"Contact Us\",\"contact_number\":\"+01 (24) 568 900\",\"contact_url\":\"tel:0124568900\",\"button_label\":\"Get 15 Days Free Trial\",\"icon_image\":\"shapes\\/icon-contact.png\",\"button_url\":\"\\/contact\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(2,'ServicesWidget','service_sidebar','infinia',1,'{\"service_ids\":[1,2,3,4,5]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(3,'BrochureDownloadsWidget','service_sidebar','infinia',2,'{\"title\":\"Service Brochure\",\"items\":[[{\"key\":\"label\",\"value\":\"PDF. Download (25 Mb)\"},{\"key\":\"url\",\"value\":\"\\/storage\\/docs\\/sample.pdf\"},{\"key\":\"icon\",\"value\":\"ti ti-file-type-pdf\"}],[{\"key\":\"label\",\"value\":\"ZIP. Download (15 Mb)\"},{\"key\":\"url\",\"value\":\"\\/storage\\/docs\\/sample.pdf\"},{\"key\":\"icon\",\"value\":\"ti ti-file-type-pdf\"}],[{\"key\":\"label\",\"value\":\"Open on Google Driver\"},{\"key\":\"url\",\"value\":\"https:\\/\\/drive.google.com\\/\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-google-drive\"}],[{\"key\":\"label\",\"value\":\"Open on Dropbox\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.dropbox.com\\/\"},{\"key\":\"icon\",\"value\":\"ti ti-file-zip\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(4,'CustomerSupportWidget','service_sidebar','infinia',3,'{\"title\":\"Providing the Ultimate Experience in Financial Services\",\"contact_title\":\"Contact Us\",\"contact_number\":\"+01 (24) 568 900\",\"contact_url\":\"tel:0124568900\",\"button_label\":\"Get 15 Days Free Trial\",\"icon_image\":\"shapes\\/icon-contact.png\",\"button_url\":\"\\/contact\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(5,'ContactFormWidget','service_sidebar','infinia',4,'{\"title\":\"Get A Quote\",\"button_label\":\"Send Message\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(6,'SiteLogoWidget','header_sidebar','infinia',1,'[]','2025-04-29 17:50:06','2025-04-29 17:50:06'),(7,'MainMenuWidget','header_sidebar','infinia',2,'[]','2025-04-29 17:50:06','2025-04-29 17:50:06'),(8,'HeaderControlsWidget','header_sidebar','infinia',3,'{\"show_search_button\":true,\"show_theme_switcher\":true,\"action_label\":\"Join For Free Trial\",\"action_url\":\"\\/contact\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(9,'SiteContactWidget','footer_top_sidebar','infinia',1,'{\"quantity\":\"2\",\"action_icon_2\":\"ti ti-phone\",\"items\":[[{\"key\":\"action_label\",\"value\":\" 0811 Erdman Prairie, Joaville CA\"},{\"key\":\"action_url\",\"value\":\"https:\\/\\/www.google.com\\/maps\\/search\\/0811%20Erdman%20Prairie,%20Joaville%20CA\"},{\"key\":\"action_icon\",\"value\":\"ti ti-map-2\"}],[{\"key\":\"action_label\",\"value\":\"+01 (24) 568 900\"},{\"key\":\"action_url\",\"value\":\"tel:01234345456\"},{\"key\":\"action_icon\",\"value\":\"ti ti-phone\"}]],\"description\":\"Our website uses cookies to improve your experience.\",\"action_label\":\"Check cookies policy\",\"action_url\":\"\\/contact\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(10,'SiteInformationWidget','footer_primary_sidebar','infinia',1,'{\"show_logo\":true,\"about\":\"You may also realize cost savings from your energy efficient choices in your custom home. Federal tax credits for some green materials can allow you to deduct as much.\",\"show_social_links\":true,\"logo\":\"general\\/logo-white.png\",\"logo_dark\":\"general\\/logo-white.png\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(11,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_primary_sidebar','infinia',2,'{\"name\":\"Company\",\"items\":[[{\"key\":\"label\",\"value\":\"About us\"},{\"key\":\"url\",\"value\":\"\\/about-us\"}],[{\"key\":\"label\",\"value\":\"Our Team\"},{\"key\":\"url\",\"value\":\"\\/our-team\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"}],[{\"key\":\"label\",\"value\":\"Pricing\"},{\"key\":\"url\",\"value\":\"\\/pricing\"}],[{\"key\":\"label\",\"value\":\"Privacy Policy\"},{\"key\":\"url\",\"value\":\"\\/privacy-policy\"}],[{\"key\":\"label\",\"value\":\"Features\"},{\"key\":\"url\",\"value\":\"\\/features\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(12,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_primary_sidebar','infinia',3,'{\"name\":\"Pages\",\"items\":[[{\"key\":\"label\",\"value\":\"Projects\"},{\"key\":\"url\",\"value\":\"\\/projects\"}],[{\"key\":\"label\",\"value\":\"Services\"},{\"key\":\"url\",\"value\":\"\\/services\"}],[{\"key\":\"label\",\"value\":\"Blog\"},{\"key\":\"url\",\"value\":\"\\/blog\"}],[{\"key\":\"label\",\"value\":\"Contact\"},{\"key\":\"url\",\"value\":\"\\/contact\"}],[{\"key\":\"label\",\"value\":\"404\"},{\"key\":\"url\",\"value\":\"\\/404\"}],[{\"key\":\"label\",\"value\":\"Features v2\"},{\"key\":\"url\",\"value\":\"\\/features-v2\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(13,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_primary_sidebar','infinia',4,'{\"name\":\"Teams\",\"items\":[[{\"key\":\"label\",\"value\":\"Our Team\"},{\"key\":\"url\",\"value\":\"\\/our-team\"}],[{\"key\":\"label\",\"value\":\"Our Team v2\"},{\"key\":\"url\",\"value\":\"\\/our-team-v2\"}],[{\"key\":\"label\",\"value\":\"Our Team v3\"},{\"key\":\"url\",\"value\":\"\\/our-team-v3\"}],[{\"key\":\"label\",\"value\":\"Our Team v4\"},{\"key\":\"url\",\"value\":\"\\/our-team-v4\"}],[{\"key\":\"label\",\"value\":\"Our Team v5\"},{\"key\":\"url\",\"value\":\"\\/our-team-v5\"}],[{\"key\":\"label\",\"value\":\"Our Team v6\"},{\"key\":\"url\",\"value\":\"\\/our-team-v6\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(14,'Botble\\Widget\\Widgets\\CoreSimpleMenu','footer_primary_sidebar','infinia',5,'{\"name\":\"Services\",\"items\":[[{\"key\":\"label\",\"value\":\"Services\"},{\"key\":\"url\",\"value\":\"\\/services\"}],[{\"key\":\"label\",\"value\":\"Services v2\"},{\"key\":\"url\",\"value\":\"\\/services-v2\"}],[{\"key\":\"label\",\"value\":\"Services v3\"},{\"key\":\"url\",\"value\":\"\\/services-v3\"}],[{\"key\":\"label\",\"value\":\"About us\"},{\"key\":\"url\",\"value\":\"\\/about-us\"}],[{\"key\":\"label\",\"value\":\"About us v2\"},{\"key\":\"url\",\"value\":\"\\/about-us-v2\"}],[{\"key\":\"label\",\"value\":\"About us v3\"},{\"key\":\"url\",\"value\":\"\\/about-us-v3\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(15,'SiteCopyrightWidget','footer_bottom_sidebar','infinia',1,'[]','2025-04-29 17:50:06','2025-04-29 17:50:06'),(16,'SiteContactWidget','header_top_start_sidebar','infinia',1,'{\"style\":2,\"items\":[[{\"key\":\"action_label\",\"value\":\"contact@infinia.com\"},{\"key\":\"action_url\",\"value\":\"mailto:contact@infinia.com\"},{\"key\":\"action_icon\",\"value\":\"ti ti-mail\"}],[{\"key\":\"action_label\",\"value\":\"0811 Erdman Prairie, Joaville CA\"},{\"key\":\"action_url\",\"value\":\"https:\\/\\/www.google.com\\/maps\\/search\\/0811%20Erdman%20Prairie,%20Joaville%20CA\"},{\"key\":\"action_icon\",\"value\":\"ti ti-map-pin\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(17,'SiteContactWidget','header_top_end_sidebar','infinia',1,'{\"style\":2,\"items\":[[{\"key\":\"action_label\",\"value\":\"Mon-Fri: 10:00am - 09:00pm\"},{\"key\":\"action_url\",\"value\":\"\"},{\"key\":\"action_icon\",\"value\":\"ti ti-clock-hour-12\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(18,'BlogPostsWidget','blog_top_sidebar','infinia',1,'{\"style\":1,\"title\":\"Our Latest Articles\",\"subtitle\":\"FROM BLOG\",\"description\":\"Explore the insights and trends shaping our industry.\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(19,'CallToActionWidget','blog_top_sidebar','infinia',2,'{\"title\":\"We are <b>Looking to<\\/b> <br> <b>Expand<\\/b> Our Team\",\"image\":\"general\\/call-to-action-1.png\",\"button_label\":\"Explore Now\",\"button_url\":\"\\/contact\",\"button_icon\":\"ti ti-arrow-up-right\"}','2025-04-29 17:50:06','2025-04-29 17:50:06'),(20,'FeaturesWidget','team_sidebar','infinia',1,'{\"title\":\"Skills & Experience\",\"items\":[[{\"key\":\"title\",\"value\":\"Market Analysis and Insights\"},{\"key\":\"description\",\"value\":\"Gain a deep understanding of your industry and competitors with our comprehensive market analysis.\"},{\"key\":\"icon\",\"value\":null},{\"key\":\"icon_image\",\"value\":\"icons\\/icon-1.png\"}],[{\"key\":\"title\",\"value\":\"Business Model Innovation\"},{\"key\":\"description\",\"value\":\"We assist in redefining your business modelto align with current market trends andfuture demands.\"},{\"key\":\"icon\",\"value\":null},{\"key\":\"icon_image\",\"value\":\"icons\\/icon-12.png\"}],[{\"key\":\"title\",\"value\":\"Change Management\"},{\"key\":\"description\",\"value\":\"Successfully manage organizational change withour expert guidance. We help you navigatetransitions smoothly.\"},{\"key\":\"icon\",\"value\":null},{\"key\":\"icon_image\",\"value\":\"icons\\/icon-13.png\"}],[{\"key\":\"title\",\"value\":\"Marketing Support\"},{\"key\":\"description\",\"value\":\"Successfully manage organizational change withour expert guidance. We help you navigatetransitions smoothly.\"},{\"key\":\"icon\",\"value\":null},{\"key\":\"icon_image\",\"value\":\"icons\\/icon-14.png\"}],[{\"key\":\"title\",\"value\":\"HR Consultant\"},{\"key\":\"description\",\"value\":\"Successfully manage organizational change withour expert guidance. We help you navigatetransitions smoothly.\"},{\"key\":\"icon\",\"value\":null},{\"key\":\"icon_image\",\"value\":\"icons\\/icon-15.png\"}]]}','2025-04-29 17:50:06','2025-04-29 17:50:06');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30  7:50:07
