-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2024 a las 09:31:48
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
-- Base de datos: `peluqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `IDCATEGORI` int(11) NOT NULL,
  `CATEGORIA` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IDCIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(32) NOT NULL,
  `APELLIDO` varchar(32) NOT NULL,
  `CEDULA` varchar(10) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `TELEFONO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumible`
--

CREATE TABLE `consumible` (
  `IDCONSUMIBLES` int(11) NOT NULL,
  `NOMBREPRODUCTO` varchar(32) NOT NULL,
  `DESCRIPCION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `IDDESCUENTO` int(11) NOT NULL,
  `IDPRODUCTO` int(11) DEFAULT NULL,
  `NOMBREDES` varchar(32) NOT NULL,
  `PORSENTAJE` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleentrega`
--

CREATE TABLE `detalleentrega` (
  `IDPRODUCTO` int(11) NOT NULL,
  `IDPROVEEDOR` int(11) NOT NULL,
  `IDENTREGA` int(11) NOT NULL,
  `FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `IDDETALLFACTURA` int(11) NOT NULL,
  `IDFACTURA` int(11) DEFAULT NULL,
  `IDPRODUCTO` int(11) DEFAULT NULL,
  `IDSERVICIOS` int(11) DEFAULT NULL,
  `IDUSUARIO` int(11) DEFAULT NULL,
  `CANTIDAD` decimal(8,0) DEFAULT NULL,
  `PRECIOUNITARIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `IDPRODUCTO` int(11) NOT NULL,
  `IDSERVICIOS` int(11) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL,
  `FECHAHORA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `IDENTREGA` int(11) NOT NULL,
  `FECHAHORA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `IDFACTURA` int(11) NOT NULL,
  `IDCIENTE` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `PAGO` decimal(10,2) NOT NULL,
  `SUBTOTAL` decimal(10,2) NOT NULL,
  `IMPUESTO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `IDINVENTARIO` int(11) NOT NULL,
  `IDPRODUCTO` int(11) NOT NULL,
  `STOCKMINIMO` int(11) NOT NULL,
  `ESTADOPRODUCTO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IDPRODUCTO` int(11) NOT NULL,
  `IDCATEGORI` int(11) NOT NULL,
  `NOMBREPRODUCTO` varchar(32) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `STOCK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `IDPROVEEDOR` int(11) NOT NULL,
  `NOMBRE` varchar(32) NOT NULL,
  `APELLIDO` varchar(32) NOT NULL,
  `CI_RUC` varchar(12) NOT NULL,
  `NOMBREEMPRESA` varchar(100) NOT NULL,
  `NOMBREPRODUCTO` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`IDPROVEEDOR`, `NOMBRE`, `APELLIDO`, `CI_RUC`, `NOMBREEMPRESA`, `NOMBREPRODUCTO`) VALUES
(1, 'Laura', 'García', '12345678901', 'Belleza Spa', 'Shampoo'),
(2, 'Carlos', 'Martínez', '09876543210', 'Peluquería Elegante', 'Acondicionador'),
(3, 'Ana', 'López', '11223344556', 'Spa Relax', 'Aceite de Masaje'),
(4, 'Javier', 'Pérez', '55667788990', 'Corte y Estilo', 'Crema para Peinar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IDROL` int(11) NOT NULL,
  `ROL` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IDROL`, `ROL`) VALUES
(1, 'Administrador'),
(2, 'Vendedor'),
(3, 'Bodeguero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `IDSERVICIOS` int(11) NOT NULL,
  `IDCONSUMIBLES` int(11) NOT NULL,
  `NOMBRESERVICIO` varchar(100) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(11) NOT NULL,
  `IDROL` int(11) NOT NULL,
  `CEDULA` varchar(10) NOT NULL,
  `NOMBREU` varchar(32) NOT NULL,
  `APELLIDOU` varchar(32) NOT NULL,
  `CONTRASENA` varchar(32) NOT NULL,
  `CORREO` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `IDROL`, `CEDULA`, `NOMBREU`, `APELLIDOU`, `CONTRASENA`, `CORREO`, `ESTADO`) VALUES
(1, 1, '0101010101', 'Juan', 'Pérez', 'password123', 'juan.perez@example.com', 1),
(2, 2, '0202020202', 'María', 'Gómez', 'password123', 'maria.gomez@example.com', 1),
(3, 3, '0303030303', 'Carlos', 'Rodríguez', 'password123', 'carlos.rodriguez@example.com', 1),
(4, 2, '0404040404', 'Ana', 'Martínez', 'password123', 'ana.martinez@example.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IDCATEGORI`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDCIENTE`);

--
-- Indices de la tabla `consumible`
--
ALTER TABLE `consumible`
  ADD PRIMARY KEY (`IDCONSUMIBLES`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`IDDESCUENTO`),
  ADD KEY `FK_SE_APLICA` (`IDPRODUCTO`);

--
-- Indices de la tabla `detalleentrega`
--
ALTER TABLE `detalleentrega`
  ADD PRIMARY KEY (`IDPRODUCTO`,`IDPROVEEDOR`,`IDENTREGA`),
  ADD KEY `FK_ENTREGA` (`IDENTREGA`),
  ADD KEY `FK_RELATIONSHIP_7` (`IDPROVEEDOR`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`IDDETALLFACTURA`),
  ADD KEY `FK_FORMA` (`IDFACTURA`),
  ADD KEY `FK_RELACIONA` (`IDPRODUCTO`,`IDSERVICIOS`,`IDUSUARIO`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`IDPRODUCTO`,`IDSERVICIOS`,`IDUSUARIO`),
  ADD KEY `FK_DETALLE3` (`IDSERVICIOS`),
  ADD KEY `FK_DETALLE4` (`IDUSUARIO`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`IDENTREGA`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`IDFACTURA`),
  ADD KEY `FK_RECIVE` (`IDCIENTE`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`IDINVENTARIO`),
  ADD KEY `FK_ESTA_DETRO` (`IDPRODUCTO`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IDPRODUCTO`),
  ADD KEY `FK_PERTENECE` (`IDCATEGORI`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`IDPROVEEDOR`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IDROL`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`IDSERVICIOS`),
  ADD KEY `FK_CONSUME` (`IDCONSUMIBLES`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_TIENE` (`IDROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `IDCATEGORI` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IDCIENTE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `consumible`
--
ALTER TABLE `consumible`
  MODIFY `IDCONSUMIBLES` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `IDDESCUENTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `IDDETALLFACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `IDENTREGA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `IDFACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `IDINVENTARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `IDPRODUCTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDPROVEEDOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IDROL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `IDSERVICIOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD CONSTRAINT `FK_SE_APLICA` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`);

--
-- Filtros para la tabla `detalleentrega`
--
ALTER TABLE `detalleentrega`
  ADD CONSTRAINT `FK_DEJA` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`),
  ADD CONSTRAINT `FK_ENTREGA` FOREIGN KEY (`IDENTREGA`) REFERENCES `entrega` (`IDENTREGA`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedor` (`IDPROVEEDOR`);

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `FK_FORMA` FOREIGN KEY (`IDFACTURA`) REFERENCES `facturacion` (`IDFACTURA`),
  ADD CONSTRAINT `FK_RELACIONA` FOREIGN KEY (`IDPRODUCTO`,`IDSERVICIOS`,`IDUSUARIO`) REFERENCES `detalleventa` (`IDPRODUCTO`, `IDSERVICIOS`, `IDUSUARIO`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `FK_DETALLE2` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`),
  ADD CONSTRAINT `FK_DETALLE3` FOREIGN KEY (`IDSERVICIOS`) REFERENCES `servicios` (`IDSERVICIOS`),
  ADD CONSTRAINT `FK_DETALLE4` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `FK_RECIVE` FOREIGN KEY (`IDCIENTE`) REFERENCES `cliente` (`IDCIENTE`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FK_ESTA_DETRO` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`IDCATEGORI`) REFERENCES `categoria` (`IDCATEGORI`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK_CONSUME` FOREIGN KEY (`IDCONSUMIBLES`) REFERENCES `consumible` (`IDCONSUMIBLES`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
