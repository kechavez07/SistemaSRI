/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/8/2024 19:47:11                           */
/*==============================================================*/


drop table if exists CATEGORIA;

drop table if exists CLIENTE;

drop table if exists CONSUMIBLE;

drop table if exists DETALLEENTREGA;

drop table if exists DETALLEVENTA;

drop table if exists ENTREGA;

drop table if exists FACTURA;

drop table if exists INVENTARIO;

drop table if exists PAGINAS;

drop table if exists PRODUCTO;

drop table if exists PROVEEDOR;

drop table if exists ROL;

drop table if exists SERVICIOS;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   IDCATEGORI           int not null auto_increment,
   CATEGORIA            varchar(32) not null,
   primary key (IDCATEGORI)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   IDCIENTE             int not null auto_increment,
   NOMBRE               varchar(32) not null,
   APELLIDO             varchar(32) not null,
   CEDULA               varchar(10) not null,
   EMAIL                varchar(100) not null,
   TELEFONO             varchar(10) not null,
   primary key (IDCIENTE)
);

/*==============================================================*/
/* Table: CONSUMIBLE                                            */
/*==============================================================*/
create table CONSUMIBLE
(
   IDCONSUMIBLES        int not null auto_increment,
   IDSERVICIOS          int not null,
   NOMBREPRODUCTO       varchar(32) not null,
   DESCRIPCION          text not null,
   primary key (IDCONSUMIBLES)
);

/*==============================================================*/
/* Table: DETALLEENTREGA                                        */
/*==============================================================*/
create table DETALLEENTREGA
(
   IDDETALLEENTREGA     char(10) not null,
   IDENTREGA            int not null,
   IDPRODUCTO           int not null,
   CANTIDADENTREGADA    char(10) not null,
   PRECIOUNITARIO       char(10) not null,
   primary key (IDDETALLEENTREGA)
);

/*==============================================================*/
/* Table: DETALLEVENTA                                          */
/*==============================================================*/
create table DETALLEVENTA
(
   IDDETALLEVENTA       int not null auto_increment,
   IDSERVICIOS          int not null,
   IDPRODUCTO           int not null,
   IDFACTURA            int not null,
   CANTIDAD_V_PRODUCTO  int not null,
   CANTIDAD_V_SERVISOS  int not null,
   DESCUENTO            decimal(10,2) not null,
   primary key (IDDETALLEVENTA)
);

/*==============================================================*/
/* Table: ENTREGA                                               */
/*==============================================================*/
create table ENTREGA
(
   IDENTREGA            int not null auto_increment,
   IDPROVEEDOR          int not null,
   IDUSUARIO            int not null,
   FECHAENTREGA         datetime not null,
   REPARTIDOR           varchar(100) not null,
   primary key (IDENTREGA)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA
(
   IDFACTURA            int not null auto_increment,
   IDCIENTE             int not null,
   CODIGOFACTURACION    varchar(32) not null,
   IDUSUARIO            int not null,
   FECHA                date not null,
   PAGO                 decimal(10,2) not null,
   SUBTOTAL             decimal(10,2) not null,
   IMPUESTO             decimal(10,2) not null,
   ESTADO               varchar(32) not null,
   primary key (IDFACTURA)
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO
(
   IDINVENTARIO         int not null auto_increment,
   ESTADOPRODUCTO       varchar(32) not null,
   IDPRODUCTO           int not null,
   ULTIMAACTUALIZACION  datetime,
   CANTIDAD             int not null,
   primary key (IDINVENTARIO)
);

/*==============================================================*/
/* Table: PAGINAS                                               */
/*==============================================================*/
create table PAGINAS
(
   IDPAGINA             int not null auto_increment,
   IDROL                int,
   TITLE                varchar(100) not null,
   DESCRIPTION          varchar(200) not null,
   LINK                 varchar(250) not null,
   primary key (IDPAGINA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           int not null auto_increment,
   CODIGO               varchar(32),
   NOMBREPRODUCTO       varchar(32) not null,
   IDCATEGORI           int not null,
   DESCRIPCION          text not null,
   PRECIO               decimal(10,2) not null,
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   IDPROVEEDOR          int not null auto_increment,
   NOMBREEMPRESA        varchar(100) not null,
   DIRECCION            varchar(250) not null,
   TELEFONO             varchar(32) not null,
   EMAIL                varchar(100) not null,
   SERVICIOS            varchar(100) not null,
   primary key (IDPROVEEDOR)
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   IDROL                int not null auto_increment,
   ROL                  varchar(32) not null,
   primary key (IDROL)
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS
(
   IDSERVICIOS          int not null auto_increment,
   NOMBRESERVICIO       varchar(100) not null,
   DESCRIPCION          text not null,
   PRECIO               decimal(10,2) not null,
   primary key (IDSERVICIOS)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   IDUSUARIO            int not null auto_increment,
   IDROL                int not null,
   CEDULA               varchar(10) not null,
   NOMBREU              varchar(32) not null,
   APELLIDOU            varchar(32) not null,
   CONTRASENA           varchar(32) not null,
   CORREO               varchar(100) not null,
   ESTADO               varchar(32) not null,
   primary key (IDUSUARIO)
);

alter table CONSUMIBLE add constraint FK_CONSUME foreign key (IDSERVICIOS)
      references SERVICIOS (IDSERVICIOS) on delete restrict on update restrict;

alter table DETALLEENTREGA add constraint FK_ENTREGA foreign key (IDENTREGA)
      references ENTREGA (IDENTREGA) on delete restrict on update restrict;

alter table DETALLEENTREGA add constraint FK_REGISTRA foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_SE_DIO foreign key (IDSERVICIOS)
      references SERVICIOS (IDSERVICIOS) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_VENDIO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table ENTREGA add constraint FK_REALIZA foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table ENTREGA add constraint FK_RESIBE foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table FACTURA add constraint FK_RECIVE foreign key (IDCIENTE)
      references CLIENTE (IDCIENTE) on delete restrict on update restrict;

alter table FACTURA add constraint FK_VENDE foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table INVENTARIO add constraint FK_ESTA_DETRO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table PAGINAS add constraint FK_PRESENTA foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_PERTENECE foreign key (IDCATEGORI)
      references CATEGORIA (IDCATEGORI) on delete restrict on update restrict;

alter table USUARIO add constraint FK_TIENE foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

