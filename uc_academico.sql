-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2026 a las 21:36:45
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
-- Base de datos: `uc_academico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `creditos` int(11) NOT NULL,
  `docente` varchar(150) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `codigo`, `nombre`, `creditos`, `docente`, `created_at`) VALUES
(1, 'CUR001', 'Desarrollo Web', 4, 'Dr. Daniel Sanchez Ruiz', '2026-06-28 11:17:56'),
(2, 'CUR002', 'Algoritmos y Estructura de Datos', 3, 'Mg. Rosa Huanca Ticona', '2026-06-28 11:17:56'),
(3, 'CUR003', 'Base de Datos Avanzada', 4, 'Ing. Pedro Flores Aquino', '2026-06-28 11:17:56'),
(4, 'CUR004', 'Arquitectura de Software', 3, 'Dr. Luis Paredes Mendoza', '2026-06-28 11:17:56'),
(5, 'CUR005', 'Matemática Discreta', 2, 'Mg. Ana Torres Quispe', '2026-06-28 11:17:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `codigo`, `nombres`, `apellidos`, `correo`, `carrera`, `created_at`) VALUES
(1, 'UC001', 'Bill Kevin', 'Villanueva Borda', 'bill.villanueva@continental.edu.pe', 'Ingeniería de Sistemas', '2026-06-28 11:17:56'),
(2, 'UC002', 'María Elena', 'Quispe Huanca', 'maria.quispe@continental.edu.pe', 'Ingeniería Civil', '2026-06-28 11:17:56'),
(3, 'UC003', 'Carlos André', 'Ramos Flores', 'carlos.ramos@continental.edu.pe', 'Administración de Empresas', '2026-06-28 11:17:56'),
(4, 'UC004', 'Lucía Paola', 'Torres Mamani', 'lucia.torres@continental.edu.pe', 'Contabilidad', '2026-06-28 11:17:56'),
(5, 'UC005', 'Diego Alonso', 'Paredes Ccallo', 'diego.paredes@continental.edu.pe', 'Ingeniería Industrial', '2026-06-28 11:17:56'),
(10, 'UC010', 'Emma ', 'Villanueva Borda', 'emma@uc.com', 'Enfermería', '2026-06-28 13:48:19'),
(11, 'UC999', 'SAUL ', 'VILLANUEVA B', 'saul@uc.com', 'Medicina Veterinaria ', '2026-06-28 14:04:57'),
(12, 'UC1000', 'Sonali', 'VILLANUEVA B', 'sonali@uc.com', 'Medicina ', '2026-06-28 14:10:38'),
(13, 'UC12000', 'Trisha', 'VILLANUEVA B', 'Trisha@uc.com', 'Ciencia de Datos', '2026-06-28 14:34:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
