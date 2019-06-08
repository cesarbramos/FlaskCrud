-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para task
CREATE DATABASE IF NOT EXISTS `task` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `task`;

-- Volcando estructura para tabla task.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `priority` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla task.task: ~12 rows (aproximadamente)
DELETE FROM `task`;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` (`id`, `title`, `description`, `priority`) VALUES
	(1, 'Reading', 'I need to read', 'low'),
	(2, 'Homework', 'I  need to do a homework', 'low'),
	(3, 'Work', 'I need to Work', 'high'),
	(4, 'Clean', 'I have to clean my car :)', 'medium'),
	(6, 'JavaScript', 'I need to practice JS\n', 'low'),
	(56, 'Reading', 'I need to read', 'high'),
	(58, 'Homework', 'I  need to do a homework', 'high'),
	(62, 'Python', 'I\'ll learn Flask a Python Framework', 'high'),
	(64, 'I need your live', 'I need your love, and anything wrong', 'medium'),
	(70, 'Activity IDK', 'Context', 'high'),
	(71, 'Stroke', 'kikkk', 'high'),
	(72, 'Java', 'I need to learn Java', 'medium');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
