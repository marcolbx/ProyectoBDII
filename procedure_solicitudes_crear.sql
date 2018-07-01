--Este procedure genera un numero de solicitudes (limit o market) al azar de usuarios. 
--Falta variar el precio de cada moneda

CREATE or replace PROCEDURE P_Generacion_Solicitudes(num_solicitudes IN number,mon_ofrecidas IN number,mon_solicitadas IN number, precio_min IN float, precio_max IN float)
 IS 
  usuario pls_integer;
  mon_cantidad float;
  tipo_orden pls_integer;
  cambio float;
  mon_valor float;
  cantidad_usuarios number;
  i pls_integer;
  sentido pls_integer;
 BEGIN
    i:=0;
    loop 
      usuario := dbms_random.value(1,30); -- (1, 500.000)
      mon_cantidad := dbms_random.value(0,10);
      select count (*) into cantidad_usuarios from Usuario where (usu_codigo = usuario);
      if cantidad_usuarios = 1 then
         tipo_orden := dbms_random.value(0,2);
         if(tipo_orden = 1) then
            select pre_monto into cambio from precio where rownum=1 and fk_mon_ofrecida_codigo = mon_ofrecidas and fk_mon_solicitada_codigo = mon_solicitadas order by pre_fecha;
            sentido := dbms_random.value(0,2);
            if (sentido=1) then insert into Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo,ord_mar_monedas_por_cambiar) values (Detalle(mon_cantidad,SYSDATE,cambio),SYSDATE,cambio,usuario,mon_solicitadas,mon_ofrecidas,mon_cantidad);
            else insert into Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo,ord_mar_monedas_por_cambiar) values (Detalle(mon_cantidad,SYSDATE,1/cambio),SYSDATE,1/cambio,usuario,mon_ofrecidas,mon_solicitadas,mon_cantidad);
            end if;
            i:=i+1;
         else
            cambio:= dbms_random.value(precio_min,precio_max);
            sentido := dbms_random.value(0,2);
            if (sentido=1) then insert into Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo,ord_mar_monedas_por_cambiar) values (Detalle(mon_cantidad,SYSDATE,cambio),SYSDATE,cambio,usuario,mon_solicitadas,mon_ofrecidas,mon_cantidad);
            else insert into Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo,ord_mar_monedas_por_cambiar) values (Detalle(mon_cantidad,SYSDATE,1/cambio),SYSDATE,1/cambio,usuario,mon_ofrecidas,mon_solicitadas,mon_cantidad);
            end if;
            i:=i+1;
          end if;
      end if;
      exit when i>=num_solicitudes;
    end loop;
End;

call P_Generacion_Solicitudes(10000,1,7,1.00001,1.00002);
 