--Este trigger sirve para calcular el precio de una moneda en un mercado y actualizar el precio
--Agarra los precios de las ultimas transacciones;
CREATE or REPLACE PROCEDURE P_CALCULAR_PRECIO_MONEDA(mon_ofrecida IN number, mon_solicitada in number)
  IS precio_nuevo pls_integer;
  BEGIN
    select avg( TREAT(tran.tra_detalle as detalle).tasa_de_canje) into precio_nuevo  from Transaccion tran --obtener el avg actual
   where (TREAT(tra_detalle as Detalle).fecha_realizacion) > TRUNC(SYSDATE - 1) 
   AND tran.fk_mon_ofrecida_codigo = mon_ofrecida AND tran.fk_mon_solicitada_codigo = mon_solicitada
   ; --fecha del dia anterior
    INSERT INTO PRECIO(pre_fecha,pre_monto,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo)
    VALUES (SYSDATE,precio_nuevo,mon_ofrecida,mon_solicitada); -- insertar el precio nuevo 
  END;
  
call p_calcular_precio_moneda(2,1);
