create or replace type Numero_de_Cuenta as object(
numero_deposito varchar(32),
numero_retiro varchar(32)
);
/
create or replace type Descripcion as object(
nombre varchar(32),
descripcion varchar(32),
fecha_incorporacion date
);
/
create or replace type Detalle as object(
cantidad int,
fecha_realizacion date,
tasa_de_canje int
);
/
create or replace type Condicion as object(
precio_limite int,
fecha_limite date,
tipo varchar(32)
);
/
create or replace type Pais as object(
nombre varchar(32),
codigo_iso varchar(32)
);
/
create or replace type Telefono as VARRAY(2) of Int;/
create or replace type Pasaporte as VARRAY(3) of Int;/
create or replace type Fundadores as VARRAY(2) of VARCHAR(40);/

create or replace type Pago_Tarjeta as Object(
tipo varchar(20),
numero int,
tarjetahabiente varchar(60),
fecha_vencimiento date
);
/
create or replace type Tarjeta as table of Pago_Tarjeta;
/ 
create sequence Seq_direccion Start with 1  Increment by 1;
create table Direccion (
dir_codigo int default seq_direccion.nextval not null primary key,
dir_calle varchar(20),
dir_avenida varchar(20),
dir_edificio varchar(20),
dir_ciudad varchar(20),
dir_pais Pais not null
);
 /
create sequence Seq_usuario Start with 1  Increment by 1;
create table Usuario (
usu_codigo int default seq_usuario.nextval not null unique primary key,
usu_nombre varchar(20) not null,
usu_apellido varchar(20) not null,
usu_clave varchar(20) not null,
usu_foto_pasaporte blob not null,
usu_pasaporte Pasaporte not null,
usu_telefono Telefono not null,
usu_tarjeta Tarjeta not null,
fk_dir_codigo int,
FOREIGN KEY (fk_dir_codigo) REFERENCES Direccion(dir_codigo)
);
/
create sequence Seq_billetera Start with 1  Increment by 1;
create table Billetera (
bil_codigo int default seq_billetera.nextval not null unique primary key,
bil_cantidad int  not null, 
bil_numero Numero_de_Cuenta not null,
fk_usu_codigo int,
fk_mon_codigo int,
FOREIGN KEY (fk_usu_codigo) REFERENCES Usuario(usu_codigo),
FOREIGN KEY (fk_mon_codigo) REFERENCES Moneda(mon_codigo)
);
/
create sequence Seq_ord_limit Start with 1  Increment by 1;
create table Orden_Limit(
ord_lim_codigo int default seq_ord_lim_codigo.nextval not null unique primary key,
ord_lim_detalle Detalle  not null,
ord_lim_fecha_inicio date  not null,
ord_lim_condicion Condicion  not null,
fk_usu_codigo int,
fk_mon_codigo int,
FOREIGN KEY (fk_usu_codigo) REFERENCES Usuario(usu_codigo),
FOREIGN KEY (fk_mon_codigo) REFERENCES Moneda(mon_codigo)
);
/
create sequence Seq_ord_market Start with 1  Increment by 1;
create table Orden_Market(
ord_mar_codigo int default seq_ord_market.nextval not null unique primary key,
ord_mar_detalle Detalle  not null,
ord_mar_fecha_inicio date  not null,
ord_mar_precio_actual_favorable int  not null,
fk_usu_codigo int,
fk_mon_codigo int,
FOREIGN KEY (fk_usu_codigo) REFERENCES Usuario(usu_codigo),
FOREIGN KEY (fk_mon_codigo) REFERENCES Moneda(mon_codigo)
);
/
create sequence Seq_mercado Start with 1  Increment by 1;
create table Mercado(
mer_codigo int default seq_mercado.nextval not null unique primary key,
mer_capacicidad int  not null,
mer_descripcion Descripcion  not null
);
/
create sequence Seq_moneda Start with 1  Increment by 1;
create table Moneda(
mon_codigo int default seq_moneda.nextval not null unique primary key,
mon_descripcion Descripcion not null,
mon_valor int not null,
mon_logo blob not null,
mon_pais_origen Pais,
mon_fundadores Fundadores
);
/
create sequence Seq_evento Start with 1  Increment by 1;
create table Evento(
eve_codigo int default seq_evento.nextval not null unique primary key,
eve_descripcion Descripcion not null,
eve_fecha_fin date not null,
eve_tipo_efecto varchar(10) not null,
fk_mon_codigo int,
FOREIGN KEY (fk_mon_codigo) REFERENCES Moneda(mon_codigo)
);
/
create sequence Seq_mer_mon Start with 1  Increment by 1;
create table Mer_Mon(
mer_mon_codigo int default seq_mer_mon.nextval not null unique primary key,
mer_mon_principal varchar(3) not null,
fk_mer_codigo int,
fk_mon_codigo int,
FOREIGN KEY (fk_mer_codigo) REFERENCES Mercado(mer_codigo),
FOREIGN KEY (fk_mon_codigo) REFERENCES Moneda(mon_codigo)
);
/
create sequence Seq_precio Start with 1 Increment by 1; 
create table Precio( 
pre_codigo int default seq_precio.nextval not null unique primary key,
pre_fecha date not null,
fk_mer_mon_codigo,
FOREIGN KEY (fk_mer_mon_codigo) REFERENCES Mer_Mon(mer_mon_codigo)
);
/
create sequence Seq_transaccion Start with 1  Increment by 1;
create table Transaccion(
tra_codigo int default seq_transaccion.nextval not null unique primary key,
tra_detalle Detalle not null,
tra_numeros_de_cuenta Numero_de_Cuenta not null
);
/
create sequence Seq_ord_tra Start with 1  Increment by 1;
create table Ord_Tra(
ord_tra_codigo int default seq_transaccion.nextval not null unique primary key,
fk_tra_codigo int not null,
fk_ord_lim_codigo int,
fk_ord_mar_codigo int,
FOREIGN KEY (fk_ord_lim_codigo) REFERENCES Orden_Limit(ord_lim_codigo),
FOREIGN KEY (fk_ord_mar_codigo) REFERENCES Orden_Market(ord_mar_codigo)
);
/
