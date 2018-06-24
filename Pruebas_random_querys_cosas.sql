
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Bitcoin','Creada por Satoshi',SYSDATE),'13');
INSERT INTO Usuario(usu_nombre,usu_apellido) values ('Marco','cuo');
Update Usuario set usu_telefono= Telefono(0412112312,04241898933) where usu_codigo = 2;
Select * from Billetera;
Select * from Moneda;
Select * from Usuario;
Select * from Orden_Limit;
Select * from Orden_Market;
Select * from Precio;
Select * from Transaccion;
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Ethereum','Creada por Satoshi',SYSDATE),'17');
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Ripple','Creada por Satoshi',SYSDATE),'1');
INSERT INTO Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual_favorable) values (Detalle(4,SYSDATE,1),SYSDATE,1);
CREATE or replace TABLE Moneda2 as
SELECT * from Moneda;
INSERT INTO Transaccion(tra_detalle,tra_numeros_de_cuenta,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo)
values(Detalle(4,SYSDATE,1000),Numero_De_Cuenta('xxx','tus cochinadas'),3,4);