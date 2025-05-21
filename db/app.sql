-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: database
-- Tiempo de generación: 12-05-2025 a las 18:31:36
-- Versión del servidor: 8.4.5
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment`
--

CREATE TABLE `appointment` (
  `id` int NOT NULL,
  `specialization_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `therapist_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `duration` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
-- Estructura de tabla para la tabla `therapist_profile`
--

CREATE TABLE `therapist_profile` (
  `id` int NOT NULL,
  `user_id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `issue_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_product`
--

CREATE TABLE `invoice_product` (
  `invoice_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medical_report`
--

CREATE TABLE `medical_report` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `therapist_id` int NOT NULL,
  `diagnosis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `treatment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_profile`
--

CREATE TABLE `patient_profile` (
  `id` int NOT NULL,
  `user_id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allergies` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL
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
  `id` int NOT NULL,
  `user_id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialization`
--

CREATE TABLE `specialization` (
  `id` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `birth_date`, `address`, `city`, `province`, `zip`, `email`, `roles`, `password`, `genre`, `phone`) VALUES
('Admin', 'Admin', 'Admin', '2003-07-04', 'Calle 123', 'Ciudad', 'Provincia', 14000, 'admin@example.com', '[\"ROLE_ADMIN\"]', '$2y$13$onB4kFmmQB7MpEaTZocaGuGMSgm3h.qKFWtAp2U8XrHOB64Pr371u', 'masculino', 600000000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FE38F844FA846217` (`specialization_id`),
  ADD KEY `IDX_FE38F8446B899279` (`patient_id`),
  ADD KEY `IDX_FE38F84487F4FB17` (`therapist_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `therapist_profile`
--
ALTER TABLE `therapist_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_12FAC9A2A76ED395` (`user_id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `IDX_AF71C02B87F4FB17` (`therapist_id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `patient_profile`
--
ALTER TABLE `patient_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_DC34FFE4A76ED395` (`user_id`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `therapist_profile`
--
ALTER TABLE `therapist_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medical_report`
--
ALTER TABLE `medical_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patient_profile`
--
ALTER TABLE `patient_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `specialization`
--
ALTER TABLE `specialization`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_FE38F8446B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `FK_FE38F84487F4FB17` FOREIGN KEY (`therapist_id`) REFERENCES `therapist_profile` (`id`),
  ADD CONSTRAINT `FK_FE38F844FA846217` FOREIGN KEY (`specialization_id`) REFERENCES `specialization` (`id`);

--
-- Filtros para la tabla `therapist_profile`
--
ALTER TABLE `therapist_profile`
  ADD CONSTRAINT `FK_12FAC9A2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
  ADD CONSTRAINT `FK_AF71C02B6B899279` FOREIGN KEY (`patient_id`) REFERENCES `patient_profile` (`id`),
  ADD CONSTRAINT `FK_AF71C02B87F4FB17` FOREIGN KEY (`therapist_id`) REFERENCES `therapist_profile` (`id`);

--
-- Filtros para la tabla `patient_profile`
--
ALTER TABLE `patient_profile`
  ADD CONSTRAINT `FK_DC34FFE4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
