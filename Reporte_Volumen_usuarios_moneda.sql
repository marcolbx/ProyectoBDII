create or replace Function  --Funcion que devuelve el volumen de usuarios cambiando una moneda con precio tope
  Functionvolusu (moneda IN number)
  return int 
  IS
  volumen int; 
    Begin 
    
      SELECT count(DISTINCT t.fk_usu_codigo) 
      INTO volumen
      from orden_market t
      where t.ORD_MAR_DETALLE.fecha_realizacion BETWEEN TRUNC(SYSDATE - 1) AND TRUNC(SYSDATE +1)
      AND t.ORD_MAR_DETALLE.tasa_de_canje = (
        Select MAX(m.ord_mar_detalle.tasa_de_canje) as maximo 
        from orden_market m
        where moneda = m.FK_MON_OFRECIDA_CODIGO);
  
     return (volumen);
     
     end Functionvolusu;
     
  CREATE OR REPLACE Procedure volusu( moneda IN number)
  is
  begin 
    dbms_output.put_line('El volumen de usuarios cambiando ' || moneda || ' es ' || Functionvolusu(moneda) );
        
  end;
  
  call volusu (7);
  
SELECT m.ord_mar_detalle.tasa_de_canje from orden_market m;
Select o.ord_mar_codigo from orden_market o where o.fk_mon_ofrecida_codigo = 71 AND o.ORD_MAR_DETALLE.fecha_realizacion BETWEEN TRUNC(SYSDATE - 1) AND TRUNC(SYSDATE +1);