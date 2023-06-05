-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-06-2023 a las 16:14:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `mail` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastLog` date DEFAULT NULL,
  `session` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`mail`, `pass`, `name`, `lastLog`, `session`) VALUES
('joanmartinez@gmail.com', '54de734bc460bd404caee618007c6be6', 'Joan Martínez', '2023-06-05', 94553735),
('miqueltaberner@gmail.com', '54de734bc460bd404caee618007c6be6', 'Miquel Taberner', '2023-06-05', 31316853);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicine`
--

CREATE TABLE `medicine` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tmin` double NOT NULL,
  `tmax` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `tmin`, `tmax`) VALUES
(1, 'Paracetamol', 3, 47),
(2, 'Klonopin', 2.4, 48.3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient`
--

CREATE TABLE `patient` (
  `mail` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patient`
--

INSERT INTO `patient` (`mail`, `name`) VALUES
('lilsekai@gmail.com', 'Miguel Vidal'),
('ramago@gmail.com', 'Raul Maroto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `xip`
--

CREATE TABLE `xip` (
  `id` int(10) NOT NULL,
  `doctor_mail` varchar(50) NOT NULL,
  `id_medicine` bigint(20) NOT NULL,
  `id_patient` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `xip`
--

INSERT INTO `xip` (`id`, `doctor_mail`, `id_medicine`, `id_patient`, `date`) VALUES
(34, 'joanmartinez@gmail.com', 1, 'lilsekai@gmail.com', '2023-07-23'),
(38, 'joanmartinez@gmail.com', 2, 'lilsekai@gmail.com', '2023-04-22'),
(78, 'joanmartinez@gmail.com', 2, 'lilsekai@gmail.com', '2023-06-30'),
(100, 'miqueltaberner@gmail.com', 2, 'ramago@gmail.com', '2023-06-26'),
(120, 'miqueltaberner@gmail.com', 2, 'lilsekai@gmail.com', '2023-06-27'),
(340, 'joanmartinez@gmail.com', 1, 'lilsekai@gmail.com', '2023-06-04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`mail`);

--
-- Indices de la tabla `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`mail`);

--
-- Indices de la tabla `xip`
--
ALTER TABLE `xip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_doctor_mail` (`doctor_mail`),
  ADD KEY `FK_patiend_id` (`id_patient`),
  ADD KEY `id_medicine` (`id_medicine`) USING BTREE;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `xip`
--
ALTER TABLE `xip`
  ADD CONSTRAINT `FK_doctor_mail` FOREIGN KEY (`doctor_mail`) REFERENCES `doctor` (`mail`),
  ADD CONSTRAINT `FK_medicine_id` FOREIGN KEY (`id_medicine`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `FK_patiend_id` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`mail`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
