delete from mer_mon;
delete from moneda;
delete from mercado;

INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Bitcoin','Creada por Satoshi','03/01/09'),5851, Pais('China','p1'), Fundadores('Satoshi Nakamoto',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ethereum','Creada por Vitalik','30/07/15'),421, Pais('Suiza','p3'), Fundadores('Vitalik Buterin',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Litecoin','Creada por Lee','07/09/11'),74, Pais('N/A','p0'), Fundadores('Charlie Lee',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ripple','Creada por Arthur Britto','15/05/18'),0.482422, Pais('N/A','p0'), Fundadores('Arthur Britto','David Schwartz'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Dash','Creada por Evan Duffield','18/01/14'),240.95, Pais('N/A','p0'), Fundadores('Evan Duffield',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Dogecoin','Creada por Billy Markus','06/12/13'),0.002558, Pais('N/A','p0'), Fundadores('Billy Markus','Jackson Palmer'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Peercoin','Creada por Scott Nadal','12/08/12'),1.48, Pais('N/A','p0'), Fundadores('Scott Nadal','Sunny King'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Namecoin','Creada por Vinced','18/04/11'),1.34, Pais('N/A','p0'), Fundadores('Vincent Durham',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Primecoin','Creada por Rhett Creighton','07/07/13'),1.24, Pais('N/A','p0'), Fundadores('Rhett Creighton',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Lisk','Creada por Max Kordek','24/05/16'),5.56, Pais('N/A','p0'), Fundadores('Max Kordek',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Solarcoin','Creada por Fondation SolarCoin','12/01/14'),0.188945, Pais('N/A','p0'), Fundadores('Fondation SolarCoin',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Stellar','Creada por Jed McCaleb','31/07/14'),0.198462, Pais('N/A','p0'), Fundadores('Jed McCaleb','Joyce Kim'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Zcash','Creada por Zooko Wilcox-OHearn','28/09/16'),166.74, Pais('N/A','p0'), Fundadores('Matthew D. Green','Zooko Wilcox-OHearn'));


INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Bitcoin','mercado de bitcoin', '03/01/09'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Ethereum','mercado de Ethereum', '30/07/15'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Litecoin','mercado de Litecoin', '07/09/11'));

INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('si', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin0'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'PrimeCoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Bitcoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('si', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'PrimeCoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Ethereum'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('si', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ripple'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dash'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Dogecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Peercoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Namecoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'PrimeCoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Lisk'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Solarcoin'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Stellar'));
INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('no', (SELECT mer_codigo FROM Mercado m WHERE m.mer_descripcion.nombre = 'Litecoin'), (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Zcash'));

--Bitcoin por todas las demas
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 14.176055, (SELECT mon_codigo FROM Moneda m  WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Ethereum'));
INSERT INTO Precio(pre_fecha, pre_monto, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (
	SYSDATE, 79.602909, (SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Bitcoin'), 
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
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
	(SELECT mon_codigo FROM Moneda m WHERE m.mon_descripcion.nombre = 'Litecoin'));
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