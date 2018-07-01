delete from mer_mon;
delete from moneda;
delete from mercado;

INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Bitcoin','Creada por Satoshi','03/Jan/09'),5851, Pais('China','p1'), Fundadores('Satoshi Nakamoto',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ethereum','Creada por Vitalik','30/Mar/15'),421, Pais('Suiza','p3'), Fundadores('Vitalik Buterin',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Litecoin','Creada por Lee','07/Nov/11'),74, Pais('N/A','p0'), Fundadores('Charlie Lee',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ripple','Creada por Arthur Britto','15/Apr/18'),0.482422, Pais('N/A','p0'), Fundadores('Arthur Britto','David Schwartz'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Dash','Creada por Evan Duffield','18/Jan/14'),240.95, Pais('N/A','p0'), Fundadores('Evan Duffield',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Dogecoin','Creada por Billy Markus','06/Dec/13'),0.002558, Pais('N/A','p0'), Fundadores('Billy Markus','Jackson Palmer'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Peercoin','Creada por Scott Nadal','12/Jul/12'),1.48, Pais('N/A','p0'), Fundadores('Scott Nadal','Sunny King'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Namecoin','Creada por Vinced','18/Apr/11'),1.34, Pais('N/A','p0'), Fundadores('Vincent Durham',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Primecoin','Creada por Rhett Creighton','07/May/13'),1.24, Pais('N/A','p0'), Fundadores('Rhett Creighton',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Lisk','Creada por Max Kordek','24/Mar/16'),5.56, Pais('N/A','p0'), Fundadores('Max Kordek',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Solarcoin','Creada por Fondation SolarCoin','12/Feb/14'),0.188945, Pais('N/A','p0'), Fundadores('Fondation SolarCoin',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Stellar','Creada por Jed McCaleb','25/Feb/14'),0.198462, Pais('N/A','p0'), Fundadores('Jed McCaleb','Joyce Kim'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Zcash','Creada por Zooko Wilcox-OHearn','28/Oct/16'),166.74, Pais('N/A','p0'), Fundadores('Matthew D. Green','Zooko Wilcox-OHearn'));


INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Bitcoin','mercado de bitcoin', '03/Jan/09'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Ethereum','mercado de Ethereum', '30/Oct/15'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	100000, Descripcion('Litecoin','mercado de Litecoin', '07/Aug/11'));

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