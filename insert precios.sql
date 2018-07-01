--Bitcoin por todas las demas
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 14.176055, (SELECT mon_codigo FROM Moneda m  WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 79.602909, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'LiteCoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 13840.623077, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 26.934769, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 2551833.427859, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00021745, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00020895, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00019045, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00086850, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00000195, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00000038, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.02680295, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

--Todas en el mercado de Bitcoin
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/13840.623077, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/26.934769, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/2551833.427859, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00021745, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00020895, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00019045, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00086850, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00000195, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00000038, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.02680295, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));

--Ethereum por todas las demas
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.070801, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 5.608726, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'LiteCoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 975.660795, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1.906344, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 180671.780899, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 331.606011, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00020795, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 376.731211, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00026850, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.00000145, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 2356.422603, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 2.761318, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

--Todas en el mercado de Ethereum
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/975.660795, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/1.906344, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/180671.780899, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/331.606011, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00020795, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/376.731211, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00026850, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.00000145, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/2356.422603, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/2.761318, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));

--Litecoin por todas las demas
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.012712, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.179034, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 175.307957, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.341929, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 32658.687317, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 59.368899, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 61.768384, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 67.447865, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 15.254980, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 491.106290, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 421.880822, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 0.494371, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

--Todas en el mercado de Litecoin
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/175.307957, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.341929, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/32658.687317, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/59.368899, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/61.768384, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/67.447865, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Primecoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/15.254980, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/491.106290, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/421.880822, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 1/0.494371, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
