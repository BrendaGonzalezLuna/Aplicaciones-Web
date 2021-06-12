-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2021 a las 17:22:30
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotizaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes`
--

CREATE TABLE `ajustes` (
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `remitente` varchar(100) DEFAULT NULL,
  `mensajePresentacion` varchar(512) DEFAULT NULL,
  `mensajeAgradecimiento` varchar(512) DEFAULT NULL,
  `mensajePie` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ajustes`
--

INSERT INTO `ajustes` (`idUsuario`, `remitente`, `mensajePresentacion`, `mensajeAgradecimiento`, `mensajePie`) VALUES
(1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas_cotizaciones`
--

CREATE TABLE `caracteristicas_cotizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idCotizacion` bigint(20) UNSIGNED NOT NULL,
  `caracteristica` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `razonSocial` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `idUsuario`, `razonSocial`) VALUES
(1, 1, 'Samantha Garibay Lara'),
(2, 1, 'Esmeralda Gonzalez Luna'),
(3, 1, 'Susana Diaz Martinez'),
(4, 1, 'Jose Juan Romero Garcia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `idCliente` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`id`, `idUsuario`, `idCliente`, `descripcion`, `fecha`) VALUES
(1, 1, 1, 'Sistema de venta de articulos de limpieza', '2021-06-03'),
(2, 1, 2, 'Reparacion de mesas', '2021-06-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_cotizaciones`
--

CREATE TABLE `servicios_cotizaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idCotizacion` bigint(20) UNSIGNED NOT NULL,
  `servicio` varchar(255) NOT NULL,
  `costo` decimal(9,2) NOT NULL,
  `tiempoEnMinutos` bigint(20) UNSIGNED NOT NULL,
  `multiplicador` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id` varchar(255) NOT NULL,
  `datos` text NOT NULL,
  `ultimo_acceso` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`id`, `datos`, `ultimo_acceso`) VALUES
('cf0nl8m6tuvflvsnvkn5524mgb', 'token_csrf|s:40:\"17d1456caaba0893d065e9879046f336fb92de94\";idUsuario|i:1;', 1622733652);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `correo` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `pass`) VALUES
(1, 'cacahuat31@gmail.com', '$2y$10$te8CjllhwF1hRaUJNa9YxuRpNGUifmrBiB1eYYzsYYLGBq1qx186C');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `caracteristicas_cotizaciones`
--
ALTER TABLE `caracteristicas_cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCotizacion` (`idCotizacion`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `servicios_cotizaciones`
--
ALTER TABLE `servicios_cotizaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCotizacion` (`idCotizacion`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas_cotizaciones`
--
ALTER TABLE `caracteristicas_cotizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios_cotizaciones`
--
ALTER TABLE `servicios_cotizaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes`
--
ALTER TABLE `ajustes`
  ADD CONSTRAINT `ajustes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `caracteristicas_cotizaciones`
--
ALTER TABLE `caracteristicas_cotizaciones`
  ADD CONSTRAINT `caracteristicas_cotizaciones_ibfk_1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_cotizaciones`
--
ALTER TABLE `servicios_cotizaciones`
  ADD CONSTRAINT `servicios_cotizaciones_ibfk_1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
