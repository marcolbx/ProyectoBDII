INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Bitcoin','Creada por Satoshi','03/01/09'),'5851', Pais('China','p1'), Fundadores('Satoshi Nakamoto',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ethereum','Creada por Vitalik','30/07/15'),'421', Pais('Suiza','p3'), Fundadores('Vitalik Buterin',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('LiteCoin','Creada por Lee','07/09/11'),'74', Pais('N/A','p0'), Fundadores('Charlie Lee',''));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('Ripple','Creada por Arthur Britto','15/05/18'),'0.482422', Pais('N/A','p0'), Fundadores('Arthur Britto','David Schwartz'));
INSERT INTO Moneda(mon_descripcion, mon_valor, mon_pais_origen, mon_fundadores) values (
	Descripcion('DeepOnion','Creada por Arthur Britto','15/05/18'),'0.733339', Pais('N/A','p0'), Fundadores('Arthur Britto','David Schwartz'));


INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	'100000', Descripcion('Bitcoin','mercado de bitcoin', '03/01/09'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	'100000', Descripcion('Ethereum','mercado de Ethereum', '30/07/15'));
INSERT INTO Mercado(mer_capacidad, mer_descripcion) values (
	'100000', Descripcion('LiteCoin','mercado de LiteCoin', '07/09/11'));

INSERT INTO Mer_Mon(mer_mon_principal, fk_mer_codigo, fk_mon_codigo) values ('si', SELECT mer_codigo FROM Mercado WHERE mer_nombre = 'Bitcoin', SELECT mon_codigo FROM Moneda WHERE mon_nombre = 'Bitcoin');

