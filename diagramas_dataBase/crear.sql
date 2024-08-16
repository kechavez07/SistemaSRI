/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     15/8/2024 22:19:23                           */
/*==============================================================*/


drop table if exists CATEGORIA;

drop table if exists CONSUMIBLE;

drop table if exists DESCUENTO;

drop table if exists FACTURACION;

drop table if exists FICHAENTREGA;

drop table if exists HISTORIAL;

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
   NOMBREDES            varchar(32) not null,
   PORSENTAJE           numeric(8,0) not null,
   primary key (IDDESCUENTO)
);

/*==============================================================*/
/* Table: FACTURACION                                           */
/*==============================================================*/
create table FACTURACION
(
   IDFACTURA            int not null auto_increment,
   IDPRODUCTO           int not null,
   FECHAE               date not null,
   PAGO                 decimal(10,2) not null,
   SUBTOTAL             decimal(10,2) not null,
   IMPUESTO             decimal(10,2) not null,
   primary key (IDFACTURA)
);

/*==============================================================*/
/* Table: FICHAENTREGA                                          */
/*==============================================================*/
create table FICHAENTREGA
(
   IDPROVEEDOR          int not null,
   IDPRODUCTO           int not null,
   FECHAENTREGA         date,
   primary key (IDPROVEEDOR, IDPRODUCTO)
);

/*==============================================================*/
/* Table: HISTORIAL                                             */
/*==============================================================*/
create table HISTORIAL
(
   IDPRODUCTO           int not null,
   IDSERVICIOS          int not null,
   IDUSUARIO            int not null,
   IDFACTURA            int not null,
   FECHAHORA            datetime,
   primary key (IDPRODUCTO, IDSERVICIOS, IDUSUARIO, IDFACTURA)
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
   CANTIDAD             char(10),
   primary key (IDINVENTARIO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           int not null auto_increment,
   IDCATEGORI           int not null,
   IDDESCUENTO          int,
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
   NOMBREPRODUCTO       varchar(32) not null,
   APELLIDO             varchar(32) not null,
   CI_RUC               varchar(12) not null,
   NOMBREEMPRESA        varchar(100) not null,
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
   NOMBRE               varchar(32) not null,
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

alter table FICHAENTREGA add constraint FK_FICHAENTREGA foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table FICHAENTREGA add constraint FK_FICHAENTREGA2 foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table HISTORIAL add constraint FK_HISTORIAL foreign key (IDFACTURA)
      references FACTURACION (IDFACTURA) on delete restrict on update restrict;

alter table HISTORIAL add constraint FK_HISTORIAL2 foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table HISTORIAL add constraint FK_HISTORIAL3 foreign key (IDSERVICIOS)
      references SERVICIOS (IDSERVICIOS) on delete restrict on update restrict;

alter table HISTORIAL add constraint FK_HISTORIAL4 foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table INVENTARIO add constraint FK_ESTA_DETRO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_PERTENECE foreign key (IDCATEGORI)
      references CATEGORIA (IDCATEGORI) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_SE_APLICA foreign key (IDDESCUENTO)
      references DESCUENTO (IDDESCUENTO) on delete restrict on update restrict;

alter table SERVICIOS add constraint FK_CONSUME foreign key (IDCONSUMIBLES)
      references CONSUMIBLE (IDCONSUMIBLES) on delete restrict on update restrict;

alter table USUARIO add constraint FK_RELATIONSHIP_8 foreign key (IDROL)
      references ROL (IDROL) on delete restrict on update restrict;

