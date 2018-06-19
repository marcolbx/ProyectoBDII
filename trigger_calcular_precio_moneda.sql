--Este trigger sirve para calcular el precio de una moneda en un mercado y actualizar el precio
--Agarra los precios de las ultimas transacciones;
CREATE or REPLACE TRIGGER TR_PRECIO_MONEDA_MERCADO
  BEFORE INSERT 
    ON TRANSACCION 
    FOR EACH ROW
  DECLARE precio_nuevo pls_integer;
  BEGIN
    select avg( TREAT(tran.tra_detalle as detalle).tasa_de_canje) into precio_nuevo  from Transaccion tran --obtener el avg actual
   where (TREAT(tra_detalle as Detalle).fecha_realizacion) > TRUNC(SYSDATE - 1) 
   AND tran.fk_mon_ofrecida_codigo = :NEW.fk_mon_ofrecida_codigo AND tran.fk_mon_solicitada_codigo = :NEW.fk_mon_solicitada_codigo
   ; --fecha del dia anterior
    INSERT INTO PRECIO(pre_fecha,pre_monto,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo)
    VALUES (SYSDATE,precio_nuevo,:NEW.fk_mon_ofrecida_codigo,:NEW.fk_mon_solicitada_codigo); -- insertar el precio nuevo 
  END;
