-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-08-2024 a las 01:27:32
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumible`
--

CREATE TABLE `consumible` (
  `IDCONSUMIBLES` int(11) NOT NULL,
  `IDSERVICIOS` int(11) NOT NULL,
  `NOMBREPRODUCTO` varchar(32) NOT NULL,
  `DESCRIPCION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleentrega`
--

CREATE TABLE `detalleentrega` (
  `IDDETALLEENTREGA` char(10) NOT NULL,
  `IDENTREGA` int(11) NOT NULL,
  `IDPRODUCTO` int(11) NOT NULL,
  `CANTIDADENTREGADA` char(10) NOT NULL,
  `PRECIOUNITARIO` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `IDDETALLEVENTA` int(11) NOT NULL,
  `IDSERVICIOS` int(11) NOT NULL,
  `IDPRODUCTO` int(11) NOT NULL,
  `IDFACTURA` int(11) NOT NULL,
  `CANTIDAD_V_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD_V_SERVISOS` int(11) NOT NULL,
  `DESCUENTO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `IDENTREGA` int(11) NOT NULL,
  `IDPROVEEDOR` int(11) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL,
  `FECHAENTREGA` datetime NOT NULL,
  `REPARTIDOR` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IDFACTURA` int(11) NOT NULL,
  `IDCIENTE` int(11) NOT NULL,
  `CODIGOFACTURACION` varchar(32) NOT NULL,
  `IDUSUARIO` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `PAGO` decimal(10,2) NOT NULL,
  `SUBTOTAL` decimal(10,2) NOT NULL,
  `IMPUESTO` decimal(10,2) NOT NULL,
  `ESTADO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `IDINVENTARIO` int(11) NOT NULL,
  `ESTADOPRODUCTO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activo',
  `IDPRODUCTO` int(11) NOT NULL,
  `ULTIMAACTUALIZACION` datetime DEFAULT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

CREATE TABLE `paginas` (
  `IDPAGINA` int(11) NOT NULL,
  `IDROL` int(11) DEFAULT NULL,
  `TITLE` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(200) NOT NULL,
  `LINK` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IDPRODUCTO` int(11) NOT NULL,
  `CODIGO` varchar(32) DEFAULT NULL,
  `NOMBREPRODUCTO` varchar(32) NOT NULL,
  `IDCATEGORI` int(11) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `IDPROVEEDOR` int(11) NOT NULL,
  `NOMBREEMPRESA` varchar(100) NOT NULL,
  `DIRECCION` varchar(250) NOT NULL,
  `TELEFONO` varchar(32) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SERVICIOS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IDROL` int(11) NOT NULL,
  `ROL` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `NOMBRESERVICIO` varchar(100) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `ESTADO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `IDROL`, `CEDULA`, `NOMBREU`, `APELLIDOU`, `CONTRASENA`, `CORREO`, `ESTADO`) VALUES
(5, 1, '1234567890', 'Juan', 'Pérez', 'contrasena123', 'juan.perez@dominio.com', 'Activo'),
(6, 2, '0987654321', 'Ana', 'García', 'contrasena456', 'ana.garcia@dominio.com', 'Activo'),
(7, 3, '1122334455', 'Carlos', 'López', 'contrasena789', 'carlos.lopez@dominio.com', 'Activo');

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
  ADD PRIMARY KEY (`IDCONSUMIBLES`),
  ADD KEY `FK_CONSUME` (`IDSERVICIOS`);

--
-- Indices de la tabla `detalleentrega`
--
ALTER TABLE `detalleentrega`
  ADD PRIMARY KEY (`IDDETALLEENTREGA`),
  ADD KEY `FK_ENTREGA` (`IDENTREGA`),
  ADD KEY `FK_REGISTRA` (`IDPRODUCTO`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`IDDETALLEVENTA`),
  ADD KEY `FK_FACTURA` (`IDFACTURA`),
  ADD KEY `FK_SE_DIO` (`IDSERVICIOS`),
  ADD KEY `FK_VENDIO` (`IDPRODUCTO`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`IDENTREGA`),
  ADD KEY `FK_REALIZA` (`IDPROVEEDOR`),
  ADD KEY `FK_RESIBE` (`IDUSUARIO`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IDFACTURA`),
  ADD KEY `FK_RECIVE` (`IDCIENTE`),
  ADD KEY `FK_VENDE` (`IDUSUARIO`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`IDINVENTARIO`),
  ADD KEY `FK_ESTA_DETRO` (`IDPRODUCTO`);

--
-- Indices de la tabla `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`IDPAGINA`),
  ADD KEY `FK_PRESENTA` (`IDROL`);

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
  ADD PRIMARY KEY (`IDSERVICIOS`);

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
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `IDDETALLEVENTA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `IDENTREGA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `IDFACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `IDINVENTARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paginas`
--
ALTER TABLE `paginas`
  MODIFY `IDPAGINA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `IDPRODUCTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `IDPROVEEDOR` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `IDUSUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consumible`
--
ALTER TABLE `consumible`
  ADD CONSTRAINT `FK_CONSUME` FOREIGN KEY (`IDSERVICIOS`) REFERENCES `servicios` (`IDSERVICIOS`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `detalleentrega`
--
ALTER TABLE `detalleentrega`
  ADD CONSTRAINT `FK_ENTREGA` FOREIGN KEY (`IDENTREGA`) REFERENCES `entrega` (`IDENTREGA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_REGISTRA` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `FK_FACTURA` FOREIGN KEY (`IDFACTURA`) REFERENCES `factura` (`IDFACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_SE_DIO` FOREIGN KEY (`IDSERVICIOS`) REFERENCES `servicios` (`IDSERVICIOS`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_VENDIO` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `FK_REALIZA` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedor` (`IDPROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_RESIBE` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FK_RECIVE` FOREIGN KEY (`IDCIENTE`) REFERENCES `cliente` (`IDCIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_VENDE` FOREIGN KEY (`IDUSUARIO`) REFERENCES `usuario` (`IDUSUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FK_ESTA_DETRO` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `producto` (`IDPRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `paginas`
--
ALTER TABLE `paginas`
  ADD CONSTRAINT `FK_PRESENTA` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`IDCATEGORI`) REFERENCES `categoria` (`IDCATEGORI`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`IDROL`) REFERENCES `rol` (`IDROL`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
