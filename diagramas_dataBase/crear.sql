/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     18/8/2024 12:58:45                           */
/*==============================================================*/


drop table if exists CATEGORIA;

drop table if exists CLIENTE;

drop table if exists CONSUMIBLE;

drop table if exists DESCUENTO;

drop table if exists DETALLEENTREGA;

drop table if exists DETALLEFACTURA;

drop table if exists DETALLEVENTA;

drop table if exists ENTREGA;

drop table if exists FACTURACION;

drop table if exists INVENTARIO;

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
   NOMBREPRODUCTO       varchar(32) not null,
   DESCRIPCION          text not null,
   primary key (IDCONSUMIBLES)
);

/*==============================================================*/
/* Table: DESCUENTO                                             */
/*==============================================================*/
create table DESCUENTO
(
   IDDESCUENTO          int not null auto_increment,
   IDPRODUCTO           int,
   NOMBREDES            varchar(32) not null,
   PORSENTAJE           numeric(8,0) not null,
   primary key (IDDESCUENTO)
);

/*==============================================================*/
/* Table: DETALLEENTREGA                                        */
/*==============================================================*/
create table DETALLEENTREGA
(
   IDPRODUCTO           int not null,
   IDPROVEEDOR          int not null,
   IDENTREGA            int not null,
   FECHA                datetime not null,
   primary key (IDPRODUCTO, IDPROVEEDOR, IDENTREGA)
);

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA
(
   IDDETALLFACTURA      int not null auto_increment,
   IDFACTURA            int,
   IDPRODUCTO           int,
   IDSERVICIOS          int,
   IDUSUARIO            int,
   CANTIDAD             numeric(8,0),
   PRECIOUNITARIO       decimal(10,2) not null,
   primary key (IDDETALLFACTURA)
);

/*==============================================================*/
/* Table: DETALLEVENTA                                          */
/*==============================================================*/
create table DETALLEVENTA
(
   IDPRODUCTO           int not null,
   IDSERVICIOS          int not null,
   IDUSUARIO            int not null,
   FECHAHORA            datetime not null,
   primary key (IDPRODUCTO, IDSERVICIOS, IDUSUARIO)
);

/*==============================================================*/
/* Table: ENTREGA                                               */
/*==============================================================*/
create table ENTREGA
(
   IDENTREGA            int not null auto_increment,
   FECHAHORA            datetime not null,
   primary key (IDENTREGA)
);

/*==============================================================*/
/* Table: FACTURACION                                           */
/*==============================================================*/
create table FACTURACION
(
   IDFACTURA            int not null auto_increment,
   IDCIENTE             int not null,
   FECHA                date not null,
   PAGO                 decimal(10,2) not null,
   SUBTOTAL             decimal(10,2) not null,
   IMPUESTO             decimal(10,2) not null,
   primary key (IDFACTURA)
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO
(
   IDINVENTARIO         int not null auto_increment,
   IDPRODUCTO           int not null,
   STOCKMINIMO          int not null,
   ESTADOPRODUCTO       bool not null,
   primary key (IDINVENTARIO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           int not null auto_increment,
   IDCATEGORI           int not null,
   NOMBREPRODUCTO       varchar(32) not null,
   DESCRIPCION          text not null,
   PRECIO               decimal(10,2) not null,
   STOCK                int not null,
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   IDPROVEEDOR          int not null auto_increment,
   NOMBRE               varchar(32) not null,
   APELLIDO             varchar(32) not null,
   CI_RUC               varchar(12) not null,
   NOMBREEMPRESA        varchar(100) not null,
   NOMBREPRODUCTO       varchar(32) not null,
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
   IDCONSUMIBLES        int not null,
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
   ESTADO               bool not null,
   primary key (IDUSUARIO)
);

alter table DESCUENTO add constraint FK_SE_APLICA foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DETALLEENTREGA add constraint FK_DEJA foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DETALLEENTREGA add constraint FK_ENTREGA foreign key (IDENTREGA)
      references ENTREGA (IDENTREGA) on delete restrict on update restrict;

alter table DETALLEENTREGA add constraint FK_RELATIONSHIP_7 foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table DETALLEFACTURA add constraint FK_FORMA foreign key (IDFACTURA)
      references FACTURACION (IDFACTURA) on delete restrict on update restrict;

alter table DETALLEFACTURA add constraint FK_RELACIONA foreign key (IDPRODUCTO, IDSERVICIOS, IDUSUARIO)
      references DETALLEVENTA (IDPRODUCTO, IDSERVICIOS, IDUSUARIO) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_DETALLE2 foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_DETALLE3 foreign key (IDSERVICIOS)
      references SERVICIOS (IDSERVICIOS) on delete restrict on update restrict;

alter table DETALLEVENTA add constraint FK_DETALLE4 foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table FACTURACION add constraint FK_RECIVE foreign key (IDCIENTE)
      references CLIENTE (IDCIENTE) on delete restrict on update restrict;

alter table INVENTARIO add constraint FK_ESTA_DETRO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_PERTENECE foreign key (IDCATEGORI)
      references CATEGORIA (IDCATEGORI) on delete restrict on update restrict;

alter table SERVICIOS add constraint FK_CONSUME foreign key (IDCONSUMIBLES)
      references CONSUMIBLE (IDCONSUMIBLES) on delete restrict on update restrict;

alter table USUARIO add constraint FK_TIENE foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

