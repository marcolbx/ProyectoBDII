
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Bitcoin','Creada por Satoshi',SYSDATE),'13');
INSERT INTO Usuario(usu_nombre,usu_apellido) values ('Marco','cuo');
Update Usuario set usu_telefono= Telefono(0412112312,04241898933) where usu_codigo = 2;
Select * from Billetera;
Select * from Moneda;
Select * from Usuario;
Select * from Orden_Limit;
Select * from Orden_Market;
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Ethereum','Creada por Satoshi',SYSDATE),'17');
INSERT INTO Moneda(mon_descripcion,mon_valor) values (Descripcion('Ripple','Creada por Satoshi',SYSDATE),'1');
