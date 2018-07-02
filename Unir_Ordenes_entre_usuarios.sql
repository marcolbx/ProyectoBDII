--Este trigger unira las ordenes de varios usuarios y genera las transacciones para la completacion de la solicitud(tabla q no existe).
--Es decir, si un usuario pide 10 btc x 1 ethereum, habiendo 2 usuarios q poseen 5 btc, se uniran ambas para satisfacer

--Esta es la tabla necesaria
drop table ordenes_temp;
create table ordenes_temp(ord_mar_codigo number, ord_mar_tasa float, fk_mon_ofrecida number, fk_mon_solicitada number, ord_mar_restantes float, ord_mar_cantidad number, usu_codigo number);
CREATE INDEX moneda_ofre_temp ON Ordenes_temp (fk_mon_ofrecida,fk_mon_solicitada);

CREATE OR REPLACE TRIGGER TR_UNIR_ORDEN
AFTER INSERT ON ORDEN_MARKET
For each row
enable
DECLARE
restantes float;
  BEGIN                          
      restantes := :NEW.ord_mar_detalle.cantidad;
      for i in ( select * from Ordenes_temp where fk_mon_ofrecida= :NEW.fk_mon_solicitada_codigo and fk_mon_solicitada = :NEW.fk_mon_ofrecida_codigo and ord_mar_tasa = 1/:NEW.ord_mar_precio_actual) loop
         if (restantes = i.ord_mar_restantes*i.ord_mar_tasa and restantes>0) then
           Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(restantes,SYSDATE,:NEW.ord_mar_precio_actual),i.fk_mon_ofrecida,i.fk_mon_solicitada,Numero_de_cuenta('','')); --Ponerle bien los paramentros
           Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,:new.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
           Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(restantes,SYSDATE,i.ord_mar_tasa),i.fk_mon_solicitada,i.fk_mon_ofrecida,Numero_de_cuenta('','')); --Ponerle bien los paramentros
           Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,i.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
           Update Billetera set bil_cantidad = (bil_cantidad + restantes*i.ord_mar_tasa) where (fk_mon_codigo = i.fk_mon_ofrecida) AND (fk_usu_codigo = :new.fk_usu_codigo);          
           Update Billetera set bil_cantidad = (bil_cantidad + restantes) where (fk_mon_codigo = i.fk_mon_solicitada) AND (fk_usu_codigo = i.usu_codigo);          
        
           restantes:= 0;
           update ordenes_temp set ord_mar_restantes = 0 where ord_mar_codigo = i.ord_mar_codigo;
           --Update Orden_Market set ord_mar_monedas_por_cambiar = (i.ord_mar_restantes - i.ord_mar_cantidad) where (i.ord_mar_codigo = ord_mar_codigo);
         elsif(restantes > i.ord_mar_restantes*i.ord_mar_tasa and restantes>0) then
            Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(i.ord_mar_restantes,SYSDATE,:NEW.ord_mar_precio_actual),i.fk_mon_ofrecida,i.fk_mon_solicitada,Numero_de_cuenta('','')); --Ponerle bien los paramentros
            Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,:new.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
            Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(i.ord_mar_restantes,SYSDATE,i.ord_mar_tasa),i.fk_mon_solicitada,i.fk_mon_ofrecida,Numero_de_cuenta('','')); --Ponerle bien los paramentros
            Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,i.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
            Update Billetera set bil_cantidad = (bil_cantidad + i.ord_mar_restantes) where (fk_mon_codigo = i.fk_mon_ofrecida) AND (fk_usu_codigo = :new.fk_usu_codigo);          
            Update Billetera set bil_cantidad = (bil_cantidad + i.ord_mar_restantes*i.ord_mar_tasa) where (fk_mon_codigo = i.fk_mon_solicitada) AND (fk_usu_codigo = i.usu_codigo);  restantes:= restantes - i.ord_mar_restantes*i.ord_mar_tasa;
            update ordenes_temp set ord_mar_restantes = 0 where ord_mar_codigo = i.ord_mar_codigo;
          elsif (restantes < i.ord_mar_restantes*i.ord_mar_tasa and restantes>0) then
           Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(restantes,SYSDATE,:NEW.ord_mar_precio_actual),i.fk_mon_ofrecida,i.fk_mon_solicitada,Numero_de_cuenta('','')); --Ponerle bien los paramentros
           Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,:new.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
           Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo,tra_numeros_de_cuenta) values(Detalle(restantes,SYSDATE,i.ord_mar_tasa),i.fk_mon_solicitada,i.fk_mon_ofrecida,Numero_de_cuenta('','')); --Ponerle bien los paramentros
           Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,i.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
           Update Billetera set bil_cantidad = (bil_cantidad + restantes*i.ord_mar_tasa) where (fk_mon_codigo = i.fk_mon_ofrecida) AND (fk_usu_codigo = :new.fk_usu_codigo);          
           Update Billetera set bil_cantidad = (bil_cantidad + restantes) where (fk_mon_codigo = i.fk_mon_solicitada) AND (fk_usu_codigo = i.usu_codigo);          
        
            update ordenes_temp set ord_mar_restantes = ord_mar_restantes - restantes*ord_mar_tasa where ord_mar_codigo = i.ord_mar_codigo;
            restantes:=0;
          end if;
        end loop;
        EXECUTE IMMEDIATE    --Creo q no se esta llenando Ordenes_temp. http://www.java2s.com/Code/Oracle/PL-SQL/Callexecuteimmediatetodroptablecreatetableandinsertdata.htm
          'insert into Ordenes_temp values (:1,:2,:3,:4,:5,:6,:7)'                            --.2                 --.3                         --.4                        --.5
          Using :NEW.ord_mar_codigo,:NEW.ord_mar_detalle.tasa_de_canje,:NEW.fk_mon_ofrecida_codigo,:NEW.fk_mon_solicitada_codigo,restantes,:NEW.ord_mar_detalle.cantidad,:NEW.fk_usu_codigo;
        delete from ordenes_temp where ord_mar_restantes <=0;
END;

select * from orden_market;
insert into orden_market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_monedas_por_cambiar, fk_usu_codigo, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo, ord_mar_precio_actual) values (Detalle(9,sysdate,1),sysdate,9,13,1,3,1);
insert into orden_market(ord_mar_detalle,ord_mar_fecha_inicio,ord_mar_monedas_por_cambiar, fk_usu_codigo, fk_mon_ofrecida_codigo, fk_mon_solicitada_codigo, ord_mar_precio_actual) values (Detalle(9,sysdate,1),sysdate,9,11,3,1,1);
  
      --Usar update para las billeteras
      --1) Primero hay q ver quienes tienen la misma tasa de canje.. uno tendra tasa de canje n y el otro 1/n 
      --2) Se debe registrar la transaccion (New Transaccion), al registrarla debo hacer update en ambas billeteras. 
      -- se debe comprobar q no queden en saldo negativo.
      --3) Si todavia no se ha cumplido la cantidad de monedas a cambiar, se debe volver a llamar al procedure