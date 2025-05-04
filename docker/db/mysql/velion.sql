-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2025 a las 11:20:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `velion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(9) NOT NULL,
  `therapist_id` varchar(9) NOT NULL,
  `specialization_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Equipos de Rehabilitación', 'Equipos y dispositivos utilizados en la rehabilitación de pacientes.'),
(2, 'Productos de Terapia Manual', 'Productos utilizados para la terapia manual, como aceites y cremas.'),
(3, 'Instrumentos de Evaluación', 'Instrumentos y herramientas utilizadas para evaluar el progreso del paciente.'),
(4, 'Ortesis y Prótesis', 'Dispositivos de soporte y prótesis para diferentes partes del cuerpo.'),
(5, 'Productos de Cuidado Personal', 'Productos de higiene y cuidado personal para pacientes.'),
(6, 'Materiales Educativos', 'Libros, folletos y otros materiales educativos para pacientes.'),
(7, 'Bonos de Fisioterapia', 'Paquetes de sesiones de fisioterapia con descuento.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250504090131', '2025-05-04 09:01:36', 352);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(9) NOT NULL,
  `issue_date` date NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_product`
--

CREATE TABLE `invoice_product` (
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_report`
--

CREATE TABLE `medical_report` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(9) NOT NULL,
  `therapist_id` varchar(9) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `treatment` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price`) VALUES
(1, 1, 'Banda Elástica', 'Banda de resistencia para ejercicios de rehabilitación.', 16),
(2, 1, 'Cinta Kinesiológica', 'Cinta adhesiva elástica utilizada para soporte muscular.', 13),
(3, 2, 'Aceite de Masaje', 'Aceite de alta calidad para terapias de masaje.', 9),
(4, 2, 'Crema Analgésica', 'Crema tópica para aliviar el dolor muscular.', 11),
(5, 3, 'Dinamómetro', 'Instrumento para medir la fuerza muscular.', 120),
(6, 3, 'Goniómetro', 'Dispositivo para medir el rango de movimiento articular.', 35),
(7, 4, 'Rodillera Ortopédica', 'Soporte de rodilla para pacientes con lesiones.', 45),
(8, 4, 'Férula de Muñeca', 'Dispositivo de soporte para la muñeca.', 25),
(9, 5, 'Jabón Antibacterial', 'Jabón para la higiene de manos en el entorno clínico.', 4),
(10, 5, 'Gel Desinfectante', 'Gel hidroalcohólico para la desinfección de manos.', 6),
(11, 6, 'Guía de Ejercicios', 'Libro con ejercicios para pacientes en rehabilitación.', 20),
(12, 6, 'Folleto Informativo', 'Folleto con información sobre cuidados post-tratamiento.', 2),
(13, 7, 'Bono de 5 Sesiones de Fisioterapia', 'Paquete de 5 sesiones de fisioterapia a precio reducido.', 200),
(14, 7, 'Bono de 10 Sesiones de Fisioterapia', 'Paquete de 10 sesiones de fisioterapia con descuento especial.', 380),
(15, 7, 'Bono de 15 Sesiones de Fisioterapia', 'Paquete de 15 sesiones de fisioterapia con gran descuento.', 540);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` varchar(9) NOT NULL,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialization`
--

CREATE TABLE `specialization` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specialization`
--

INSERT INTO `specialization` (`id`, `description`) VALUES
(1, 'Rehabilitación deportiva'),
(2, 'Fisioterapia neurológica'),
(3, 'Fisioterapia pediátrica'),
(4, 'Fisioterapia respiratoria'),
(5, 'Fisioterapia ortopédica'),
(6, 'Terapia manual'),
(7, 'Fisioterapia geriátrica'),
(8, 'Fisioterapia en salud de la mujer'),
(9, 'Fisioterapia cardiovascular'),
(10, 'Fisioterapia oncológica'),
(11, 'Fisioterapia traumatológica'),
(12, 'Fisioterapia en cuidados intensivos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` varchar(9) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `birth_date`, `address`, `city`, `province`, `zip`, `email`, `roles`, `password`, `genre`, `phone`, `is_verified`) VALUES
('1', 'Sergio', 'Física Rubio', '2003-07-04', 'General Lázaro Cárdenas, 1 7 3 A', 'Córdoba', 'Córdoba', 14013, 'sergiofrubio@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$9IoQLDuCIZU/oOG2ZtEAZukzVwAeCAx5VQ1gFwBzikDvvIzXaJaLK', 'Hombre', 643159006, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_specialization`
--

CREATE TABLE `user_specialization` (
  `user_id` varchar(9) NOT NULL,
  `specialization_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FE38F8446B899279` (`patient_id`),
  ADD KEY `IDX_FE38F84443E8B094` (`therapist_id`),
  ADD KEY `IDX_FE38F844FA846217` (`specialization_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_906517449395C3F3` (`customer_id`);

--
-- Indices de la tabla `invoice_product`
--
ALTER TABLE `invoice_product`
  ADD PRIMARY KEY (`invoice_id`,`product_id`),
  ADD KEY `IDX_2193327E2989F1FD` (`invoice_id`),
  ADD KEY `IDX_2193327E4584665A` (`product_id`);

--
-- Indices de la tabla `medical_report`
--
ALTER TABLE `medical_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AF71C02B6B899279` (`patient_id`),
  ADD KEY `IDX_AF71C02B43E8B094` (`therapist_id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indices de la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indices de la tabla `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indices de la tabla `user_specialization`
--
ALTER TABLE `user_specialization`
  ADD PRIMARY KEY (`user_id`,`specialization_id`),
  ADD KEY `IDX_F55C2D33A76ED395` (`user_id`),
  ADD KEY `IDX_F55C2D33FA846217` (`specialization_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medical_report`
--
ALTER TABLE `medical_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `specialization`
--
ALTER TABLE `specialization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_FE38F84443E8B094` FOREIGN KEY (`therapist_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FE38F8446B899279` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_FE38F844FA846217` FOREIGN KEY (`specialization_id`) REFERENCES `specialization` (`id`);

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK_906517449395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `invoice_product`
--
ALTER TABLE `invoice_product`
  ADD CONSTRAINT `FK_2193327E2989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2193327E4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medical_report`
--
ALTER TABLE `medical_report`
  ADD CONSTRAINT `FK_AF71C02B43E8B094` FOREIGN KEY (`therapist_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_AF71C02B6B899279` FOREIGN KEY (`patient_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_specialization`
--
ALTER TABLE `user_specialization`
  ADD CONSTRAINT `FK_F55C2D33A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F55C2D33FA846217` FOREIGN KEY (`specialization_id`) REFERENCES `specialization` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
