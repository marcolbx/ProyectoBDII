-- Ultimas transacciones de 2 monedas
select t.TRA_DETALLE.cantidad, t.TRA_DETALLE.tasa_de_canje from transaccion t where
  t.fk_mon_ofrecida_codigo = 1 and
  t.fk_mon_solicitada_codigo = 3
    order by t.TRA_DETALLE.fecha_realizacion desc;
    
select t.ord_mar_DETALLE.cantidad, t.ord_mar_DETALLE.tasa_de_canje from orden_market t where
  t.fk_mon_ofrecida_codigo = 3 and
  t.fk_mon_solicitada_codigo = 1
  order by t.ORD_MAR_DETALLE.fecha_realizacion;

select count(*) from orden_market;    
select count(*) from ordenes_temp;
select count(*) from transaccion;
select count(*) from usuario;

select * from precio where FK_MON_solicitada_CODIGO=6 or FK_MON_ofrecida_CODIGO=6 order by FK_MON_OFRECIDA_CODIGO,FK_MON_SOLICITADA_CODIGO;
  