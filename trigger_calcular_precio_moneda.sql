--Este trigger sirve para calcular el precio de una moneda en un mercado y actualizar el precio
--Agarra los precios de las ultimas transacciones;
CREATE or replace trigger TR_PRECIO_MONEDA_MERCADO

 AFTER INSERT on Transaccion 
 declare
 precio_nuevo pls_integer;
 BEGIN
 select avg (TREAT(tra_detalle).tasa_de_canje) into precio_nuevo from Transaccion where (ROWNUM <=10) ORDER BY tra_codigo desc;
 INSERT INTO PRECIO(pre_fecha,pre_monto,fk_mon_ofertada_codigo,fk_mon_solicitada_codigo) VALUES (SYSDATE,precio_nuevo,2,3);
 END;