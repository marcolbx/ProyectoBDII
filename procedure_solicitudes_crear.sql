--Este procedure genera un numero de solicitudes (limit o market) al azar de usuarios. 
--Falta variar el precio de cada moneda

CREATE or replace PROCEDURE P_Generacion_Solicitudes(num_solicitudes IN number,mon_ofrecidas IN number,mon_solicitadas IN number)
 IS 
  usuario pls_integer;
  mon_cantidad pls_integer;
  tipo_orden pls_integer;
  ultimo_precio pls_integer;
  cambio pls_integer;
  mon_valor number;
  cantidad_usuarios number;
  i number;
 BEGIN
    i:=0;
    loop 
      usuario := dbms_random.value(1,3); -- (1, 500.000)
      mon_cantidad := dbms_random.value(1,100);
      select count (*) into cantidad_usuarios from Usuario where (usu_codigo = usuario);
      --dbms_output.put_line(cantidad_usuarios);
  --    return cantidad_usuarios;
      if cantidad_usuarios = 1 then
       tipo_orden := dbms_random.value(1,2);
       if(tipo_orden = 1) then
        insert into Orden_Market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_precio_actual_favorable,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (Detalle(mon_cantidad,SYSDATE,10),SYSDATE,9,usuario,mon_solicitadas,mon_ofrecidas);
       else
       insert into Orden_Limit(ord_lim_detalle,ord_lim_fecha_inicio,ord_lim_condicion,fk_usu_codigo,fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo) values (Detalle(mon_cantidad,SYSDATE,10),SYSDATE,Condicion(10,SYSDATE,'tipo'),usuario,mon_solicitadas,mon_ofrecidas);
        i:=i+1;
        end if;
      end if;
      
      exit when i>=num_solicitudes;
    end loop;
End;

call P_Generacion_Solicitudes(10,1,2);
 