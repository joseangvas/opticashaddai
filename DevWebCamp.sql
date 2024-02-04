-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.33 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para devwebcamp
/*CREATE DATABASE IF NOT EXISTS `devwebcamp` /*!40100 */ /*!80016 DEFAULT ENCRYPTION='N' */;
/*USE `devwebcamp`;

-- Volcando estructura para tabla devwebcamp.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4;

-- Volcando datos para la tabla devwebcamp.categorias: ~2 rows (aproximadamente)
INSERT INTO `categorias` (`id`, `nombre`) VALUES
	(1, 'Conferencias'),
	(2, 'Workshops');

-- Volcando estructura para tabla devwebcamp.dias
CREATE TABLE IF NOT EXISTS `dias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3;

-- Volcando datos para la tabla devwebcamp.dias: ~2 rows (aproximadamente)
INSERT INTO `dias` (`id`, `nombre`) VALUES
	(1, 'Viernes'),
	(2, 'Sábado');

-- Volcando estructura para tabla devwebcamp.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET utf8mb4 DEFAULT NULL,
  `descripcion` text CHARACTER,
  `disponibles` int DEFAULT NULL,
  `categoria_id` int NOT NULL,
  `dia_id` int NOT NULL,
  `hora_id` int NOT NULL,
  `ponente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_categorias_idx` (`categoria_id`),
  KEY `fk_eventos_dias1_idx` (`dia_id`),
  KEY `fk_eventos_horas1_idx` (`hora_id`),
  KEY `fk_eventos_ponentes1_idx` (`ponente_id`),
  CONSTRAINT `categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `dia_id` FOREIGN KEY (`dia_id`) REFERENCES `dias` (`id`),
  CONSTRAINT `hora_id` FOREIGN KEY (`hora_id`) REFERENCES `horas` (`id`),
  CONSTRAINT `ponente_id` FOREIGN KEY (`ponente_id`) REFERENCES `ponentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla devwebcamp.eventos: ~32 rows (aproximadamente)
INSERT INTO `eventos` (`id`, `nombre`, `descripcion`, `disponibles`, `categoria_id`, `dia_id`, `hora_id`, `ponente_id`) VALUES
	(1, 'Next.js - Aplicaciones con gran performance', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 2, 2, 1, 1),
	(2, 'MongoDB - Base de Datos a gran escala', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 2, 2, 2, 2),
	(3, 'Tailwind y Figma', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 43, 1, 1, 2, 3),
	(4, 'MERN - MongoDB Express React y Node.js - Ejemplo Real', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 2, 4, 8),
	(5, 'Vue.js con Django para gran Performance', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 50, 2, 1, 1, 4),
	(6, 'DevOps - Primeros Pasos', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 25, 1, 1, 1, 5),
	(7, 'WordPress y React - Gran Performance a costo 0', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 40, 2, 1, 2, 6),
	(8, 'React, Angular y Svelte - Creando un Proyecto', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 28, 1, 1, 3, 7),
	(9, 'Laravel y Next.js - Aplicaciones Full Stack en Tiempo Record', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 0, 1, 2, 1, 8),
	(10, 'Remix - El Nuevo Framework de React', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 30, 2, 1, 3, 9),
	(11, 'TailwindCSS - Crear Sitios Accesibles', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 28, 1, 1, 4, 10),
	(12, 'TypeScript en React', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 30, 2, 2, 3, 11),
	(13, 'Presente y Futuro del Frontend', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 30, 2, 2, 8, 12),
	(14, 'Extiende la API de WordPress con PHP', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 20, 1, 1, 8, 13),
	(15, 'Node y Vue.js - Proyecto Práctico', 'Nunc laoreet sit amet turpis eu vulputate. Etiam quis dignissim elit, ac commodo ligula. Donec eu mollis odio, vitae sodales est. Fusce ut turpis eros. Vestibulum mauris ligula, suscipit eget lacus non, vulputate laoreet enim. Etiam ac elementum lacus, eu dapibus dolor. Proin ac justo in erat elementum venenatis sit amet et arcu. Cras eu ultrices lorem, et mollis libero. Nam ex velit, sollicitudin ac lectus ut, lobortis blandit nibh. Donec vulputate eros quis arcu varius bibendum. Vestibulum mattis consectetur orci eget feugiat. Donec massa ligula, pulvinar vitae sem nec, suscipit tempus tortor. Nulla congue venenatis metus. Ut quis diam est. Sed non sagittis justo, ut rhoncus neque. Quisque ut mi et nunc sollicitudin luctus quis a ante. ', 30, 1, 2, 2, 14),
	(16, 'GraphQL y Flutter - Gran Performance para Android y iOS', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 1, 5, 15),
	(17, 'REST API\'s - Backend para Web y Móvil', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 20, 2, 1, 4, 16),
	(18, 'JavaScript - Apps para Web, Desktop y Escritorio', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 2, 1, 8, 17),
	(19, 'Flutter y React Native - ¿Cómo elegir?', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 40, 2, 1, 6, 18),
	(20, 'Laravel y Flutter - Creando Un Proyecto Real', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 2, 5, 18),
	(21, 'Laravel y React Native - Creando un Proyecto Real', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 1, 2, 7, 18),
	(22, 'PHP 8 - ¿Qué es Nuevo y que cambió?', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 2, 1, 7, 1),
	(23, 'MEVN Stack - Mongo Express  Vue.js y Node.js', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 50, 2, 1, 5, 2),
	(24, 'Introducción a TailwindCSS', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 2, 2, 4, 3),
	(25, 'WPGraphQL y GatsbyJS - Headless WordPress', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 40, 2, 2, 5, 6),
	(26, 'Svelte - El Nuevo Framework de JS ', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 40, 2, 2, 6, 7),
	(27, 'Next.js - El Mejor Framework para React', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 40, 2, 2, 7, 8),
	(28, 'React 18 - Una Introducción Práctica', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 1, 6, 9),
	(29, 'Vue.js - Composition API', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 20, 1, 1, 7, 14),
	(30, 'Vue.js - Pinia para reemplazar Vuex', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 25, 1, 2, 3, 14),
	(31, 'GraphQL - Introducción Práctica', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 2, 8, 15),
	(32, 'React y TailwindCSS - Frontend Moderno', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sodales condimentum magna fringilla egestas. In non pellentesque magna, at mollis velit. Morbi nec dapibus diam. Phasellus ante neque, blandit eget tortor a, cursus molestie turpis. Aenean placerat aliquet nibh, et interdum ipsum finibus at. Nulla sit amet faucibus leo, vel blandit urna. Curabitur dictum euismod sem, eget euismod magna pulvinar et. Nam semper aliquet nunc eu ornare. ', 30, 1, 2, 6, 17);

-- Volcando estructura para tabla devwebcamp.eventos_registros
CREATE TABLE IF NOT EXISTS `eventos_registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `evento_id` int DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento_id` (`evento_id`),
  KEY `registro_id` (`registro_id`),
  CONSTRAINT `evento_id` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  CONSTRAINT `registro_id` FOREIGN KEY (`registro_id`) REFERENCES `registros` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla devwebcamp.eventos_registros: ~13 rows (aproximadamente)
INSERT INTO `eventos_registros` (`id`, `evento_id`, `registro_id`) VALUES
	(1, 6, 1),
	(2, 3, 1),
	(3, 3, 1),
	(4, 6, 1),
	(5, 11, 1),
	(6, 6, 1),
	(7, 3, 1),
	(8, 11, 1),
	(9, 6, 1),
	(10, 3, 1),
	(11, 6, 1),
	(12, 3, 1),
	(13, 8, 1);

-- Volcando estructura para tabla devwebcamp.horas
CREATE TABLE IF NOT EXISTS `horas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` varchar(13) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla devwebcamp.horas: ~8 rows (aproximadamente)
INSERT INTO `horas` (`id`, `hora`) VALUES
	(1, '10:00 - 10:55'),
	(2, '11:00 - 11:55'),
	(3, '12:00 - 12:55'),
	(4, '13:00 - 13:55'),
	(5, '16:00 - 16:55'),
	(6, '17:00 - 17:55'),
	(7, '18:00 - 18:55'),
	(8, '19:00 - 19:55');

-- Volcando estructura para tabla devwebcamp.paquetes
CREATE TABLE IF NOT EXISTS `paquetes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla devwebcamp.paquetes: ~3 rows (aproximadamente)
INSERT INTO `paquetes` (`id`, `nombre`) VALUES
	(1, 'Presencial'),
	(2, 'Virtual'),
	(3, 'Gratis');

-- Volcando estructura para tabla devwebcamp.ponentes
CREATE TABLE IF NOT EXISTS `ponentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
  `apellido` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ciudad` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `pais` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL,
  `imagen` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tags` varchar(120) CHARACTER SET utf8mb4 DEFAULT NULL,
  `redes` mediumtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla devwebcamp.ponentes: ~19 rows (aproximadamente)
INSERT INTO `ponentes` (`id`, `nombre`, `apellido`, `ciudad`, `pais`, `imagen`, `tags`, `redes`) VALUES
	(1, ' Julian', 'Muñoz', 'Madrid', 'España', '6764a74ccf2b4b5b74e333016c13388a', 'React,PHP,Laravel', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(2, ' Israel', 'González', 'CDMX', 'México', '6497c66bcc464e26871c046dd5bb86c8', 'Vue,Node.js,MongoDB', '{"facebook":"","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"https://instagram.com/codigoconjuan","tiktok":"https://tiktok.com/@codigoconjuan","github":"https://github.com/codigoconjuan"}'),
	(3, ' Isabella', 'Tassis', 'Buenos Aires', 'Argentina', '55c7866df31370ec3299eed6eb63daa1', 'UX / UI,HTML,CSS,TailwindCSS', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"https://tiktok.com/@codigoconjuan","github":""}'),
	(4, ' Jazmín', 'Hurtado', 'CDMX', 'México', 'de6e3fa0cde8402de4c28e6be0903ada', 'Django,React, Vue.js', '{"facebook":"","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(5, ' María Camila', 'Murillo', 'Guadalajara', 'México', 'cec8c9d7bcb4c19e87d1164bce8fe176', 'Devops,Git,CI CD', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"","github":""}'),
	(6, ' Tomas', 'Aleman', 'Bogotá', 'Colombia', '5332118b8d7690a1b992431802eafab1', 'WordPress,PHP,React', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(7, ' Lucía', 'Velázquez', 'Buenos Aires', 'Argentina', '90956ece4adbd9f9ccb8f4ae80dc1537', 'React,Angular,Svelte', '{"facebook":"","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"https://instagram.com/codigoconjuan","tiktok":"https://tiktok.com/@codigoconjuan","github":"https://github.com/codigoconjuan"}'),
	(8, ' Catarina', 'Pardo', 'Lima', 'Perú', '9886ffc0d31e4c20a04acc1464630527', 'Next.js,Laravel,MERN', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"https://tiktok.com/@codigoconjuan","github":""}'),
	(9, ' Raquel', 'Ros', 'Madrid', 'España', 'd697f6c454c36252d70abacd7599566c', 'Next.js,Remix,Vue.js', '{"facebook":"","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(10, ' Sofía', 'Amengual', 'Santiago', 'Chile', '414ffd61380bbf0e9f45cbde4d0cbb7f', 'UX / UI,Figma,TailwindCSS', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"","github":""}'),
	(11, ' María José', 'Leoz', 'NY', 'Estados Unidos', 'c8b3a77bce7a6efb6e6872db67cfa553', 'React,TypeScript,JavaScript', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(12, ' Alexa', 'Mina', 'Bogotá', 'Colombia', '6eac63d88743bbb9ee0bfd8c60cf4186', 'HTML,CSS,React,TailwindCSS', '{"facebook":"","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"https://instagram.com/codigoconjuan","tiktok":"https://tiktok.com/@codigoconjuan","github":"https://github.com/codigoconjuan"}'),
	(13, ' Jesus', 'López', 'Madrid', 'España', 'e481bca0c512f5b4d8f76ccea2548f0d', 'PHP,WordPress,HTML,CSS', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"https://tiktok.com/@codigoconjuan","github":""}'),
	(14, ' Irene ', 'Dávalos', 'CDMX', 'México', '6727e8ee7f6c642026247fe0556d866d', 'Node.js,Vue.js,Angular', '{"facebook":"","twitter":"https://twitter.com/codigoconjuan","youtube":"","instagram":"https://instagram.com/codigoconjuan","tiktok":"","github":"https://github.com/codigoconjuan"}'),
	(15, ' Brenda', ' Ocampo', 'Santiago', 'Chile', '40e01f5c023c7e74c9c372a8126edd97', 'Laravel,Next.js,GraphQL,Flutter', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"","github":""}'),
	(16, ' Julián ', 'Noboa', 'Las Vegas', 'EU', '6d4629dacbed2e4f5a344282ec2f4f76', 'iOS,Figma,REST API\'s', '{"facebook":"","twitter":"","youtube":"https://youtube.com/codigoconjuan","instagram":"https://instagram.com/codigoconjuan","tiktok":"https://tiktok.com/@codigoconjuan","github":"https://github.com/codigoconjuan"}'),
	(17, ' Vicente ', 'Figueroa', 'CDMX', 'México', '2a41a781d8ae8f0f7a1969c766276b08', 'React,Tailwind,JavaScript,TypeScript,Node', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"https://youtube.com/codigoconjuan","instagram":"","tiktok":"","github":""}'),
	(18, ' Nico', 'Fraga', 'Buenos Aires', 'Argentina', '024384db8eb6a0b4a1569dc90526d27f', 'PHP,Laravel,Flutter', '{"facebook":"https://facebook.com/C%C3%B3digo-Con-Juan-103341632130628","twitter":"https://twitter.com/codigoconjuan","youtube":"https://youtube.com/codigoconjuan","instagram":"https://www.instagram.com/joseangvas/?hl=es","tiktok":"","github":""}'),
	(19, ' José Angel', 'Vásquez Paz', 'Maracay', 'Venezuela', 'c440eed888244a776a4fda1f75f099e7', 'React,Angular,Node.js,MongoDB,PHP', '{"facebook":"https://www.facebook.com/joseangvas","twitter":"https://twitter.com/joseangvas_dev","youtube":"https://www.youtube.com/@codejavtech","instagram":"https://www.instagram.com/joseangvas/?hl=es","tiktok":"https://www.tiktok.com/@joseangvas","github":"https://github.com/joseangvas"}');

-- Volcando estructura para tabla devwebcamp.regalos
CREATE TABLE IF NOT EXISTS `regalos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla devwebcamp.regalos: ~9 rows (aproximadamente)
INSERT INTO `regalos` (`id`, `nombre`) VALUES
	(1, 'Paquete Stickers'),
	(2, 'Camisa Mujer - Chica'),
	(3, 'Camisa Mujer - Mediana'),
	(4, 'Camisa Mujer - Grande'),
	(5, 'Camisa Mujer - XL'),
	(6, 'Camisa Hombre - Chica'),
	(7, 'Camisa Hombre - Mediana'),
	(8, 'Camisa Hombre - Grande'),
	(9, 'Camisa Hombre - XL');

-- Volcando estructura para tabla devwebcamp.registros
CREATE TABLE IF NOT EXISTS `registros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paquete_id` int DEFAULT NULL,
  `pago_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `regalo_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuario_id`),
  KEY `paquete_id` (`paquete_id`),
  KEY `regalo_id` (`regalo_id`),
  CONSTRAINT `paquete_id` FOREIGN KEY (`paquete_id`) REFERENCES `paquetes` (`id`),
  CONSTRAINT `regalo_id` FOREIGN KEY (`regalo_id`) REFERENCES `regalos` (`id`),
  CONSTRAINT `usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla devwebcamp.registros: ~7 rows (aproximadamente)
INSERT INTO `registros` (`id`, `paquete_id`, `pago_id`, `token`, `usuario_id`, `regalo_id`) VALUES
	(1, 1, '26G87235R30262832', '45fbace7', 13, 7),
	(2, 1, '4U0663953L4366700', 'b0cc9cd5', 14, 1),
	(3, 1, '4U0663953L4366700', 'b0cc9cd5', 12, 6),
	(4, 1, '4U0663953L4366700', 'b0cc9cd5', 12, 4),
	(5, 1, '4U0663953L4366700', 'b0cc9cd5', 13, 4),
	(6, 1, '4U0663953L4366700', 'b0cc9cd5', 14, 4),
	(7, 1, '4U0663953L4366700', 'b0cc9cd5', 12, 6);

-- Volcando estructura para tabla devwebcamp.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla devwebcamp.usuarios: ~3 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `confirmado`, `token`, `admin`) VALUES
	(12, ' José Angel', 'Vásquez Paz', 'developer.javp@gmail.com', '$2y$10$8PyiPja4.rL0GZZ1gq9l6Oxufr.OOn3FAZQCXyCtqLFwSRF8LL4Uu', 1, '', 1),
	(13, ' Miguel Angel', 'Vásquez Paz', 'miguelpro@gmail.com', '$2y$10$6i/cgfNeWVBLb7d.BGK9bO6dBn1HbxSLnj3dBG3tiVnQsKFxmkDcq', 1, '', 0),
	(14, ' Thais Lisley', 'Seijas P.', 'thaislisleyseijas@gmail.com', '$2y$10$E/D62cMfjt7E8f2Y7W7fTeGHcn5z4r3q4cNBBUl033ahfEW3u6cKq', 1, '', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
