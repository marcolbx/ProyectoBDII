--Este trigger unira las ordenes de varios usuarios y genera las transacciones para la completacion de la solicitud(tabla q no existe).
--Es decir, si un usuario pide 10 btc x 1 ethereum, habiendo 2 usuarios q poseen 5 btc, se uniran ambas para satisfacer
drop table ordenes_temp;
create table ordenes_temp(ord_mar_codigo number, ord_mar_tasa float, fk_mon_ofrecida number, fk_mon_solicitada number, ord_mar_restantes float, ord_mar_cantidad number, usu_codigo number);
CREATE OR REPLACE TRIGGER TR_UNIR_ORDEN
AFTER INSERT ON ORDEN_MARKET
For each row
enable
DECLARE
restantes float;
  BEGIN                          
  EXECUTE IMMEDIATE    --Creo q no se esta llenando Ordenes_temp. http://www.java2s.com/Code/Oracle/PL-SQL/Callexecuteimmediatetodroptablecreatetableandinsertdata.htm
  ' 
      insert into Ordenes_temp (SELECT o.ord_mar_codigo, o.ord_mar_detalle.tasa_de_canje, o.fk_mon_ofrecida_codigo, o.fk_mon_solicitada_codigo, o.ord_mar_monedas_por_cambiar, o.ord_mar_detalle.cantidad, o.fk_usu_codigo FROM Orden_Market o
      where(o.ord_mar_detalle.tasa_de_canje = 1/:1) AND (o.ord_mar_codigo != :2) AND (o.fk_mon_ofrecida_codigo = :3) AND (o.fk_mon_solicitada_codigo = :4) AND (o.ord_mar_monedas_por_cambiar > 0) AND (0 < :5)        )
  '       --.1                               --.2                 --.3                         --.4                        --.5
      Using :NEW.ord_mar_detalle.tasa_de_canje,:NEW.ord_mar_codigo,:NEW.fk_mon_solicitada_codigo,:NEW.fk_mon_ofrecida_codigo,:NEW.ord_mar_monedas_por_cambiar;
      
        restantes := :NEW.ord_mar_detalle.cantidad;
        Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(:NEW.ord_mar_detalle.cantidad,SYSDATE,:NEW.ord_mar_detalle.tasa_de_canje),:NEW.fk_mon_solicitada_codigo,:NEW.fk_mon_ofrecida_codigo);
        Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum = 1),null,:NEW.ord_mar_codigo);
    
          for i in ( select * from Ordenes_temp) loop
            if restantes > i.ord_mar_cantidad then
             Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(i.ord_mar_cantidad,SYSDATE,i.ord_mar_tasa),i.fk_mon_ofrecida,i.fk_mon_solicitada); --Ponerle bien los paramentros
             
             Insert into Ord_Tra(fk_tra_codigo,fk_ord_lim_codigo,fk_ord_mar_codigo) values ((Select tra_codigo from(select tra_codigo from Transaccion order by tra_codigo desc) where rownum =1 ),null,i.ord_mar_codigo); --Agarro la ultima transaccion(es decir, la de arriba)
             
             restantes:= restantes - i.ord_mar_cantidad;
            
             Update Orden_Market set ord_mar_monedas_por_cambiar = (i.ord_mar_restantes - i.ord_mar_cantidad) where (i.ord_mar_codigo = ord_mar_codigo);
             Update Billetera set bil_cantidad = (bil_cantidad + i.ord_mar_cantidad) where (fk_mon_codigo = i.fk_mon_solicitada) AND (fk_usu_codigo = i.usu_codigo);          
            end if;
          end loop;
END;


/*
create or replace procedure temporal
is
BEGIN
  EXECUTE IMMEDIATE '
CREATE TABLE Moneda2 as
SELECT * from Moneda';

EXECUTE IMMEDIATE '
DROP TABLE Moneda2';
--UNIR_ORDENES;
END;
call temporal();

drop table moneda2;

CREATE OR REPLACE TRIGGER TR_UNIR_ORDEN
AFTER INSERT ON ORDEN_MARKET
BEGIN
EXECUTE IMMEDIATE '
CREATE TABLE Moneda2 as
SELECT * from Moneda';
--UNIR_ORDENES;
END;

  
 --DESDE AQUI 
  create or replace type t_table as table of t_record;
/
  CREATE OR REPLACE TYPE t_table as table of t_record;
  
CREATE OR REPLACE PROCEDURE UNIR_ORDENES return
t_table as table_requerida t_table;

  Begin
 END; 
  CREATE TABLE new_table 
  AS (SELECT * FROM Orden_Market 
      where(ord_mar.ord_mar_detalle.tasa_de_canje = 1/:NEW.ord_mar.ord_mar_detalle.tasa_de_canje)  --chequeo q sea la misma tasa de canje que la nueva ingresada
      AND (ord_mar_codigo != :New.ord_mar_codigo) AND (fk_mon_ofrecida == :NEW.fk_mon_solicitada) AND (fk_mon_solicitada == :NEW.fk_mon_ofrecida) --Chequep que no sea la misma moneda, que las monedas ofrecidas vs solicitadas sean correspondientes
      )  
  END;    
  */    
      --Usar update para las billeteras
      --1) Primero hay q ver quienes tienen la misma tasa de canje.. uno tendra tasa de canje n y el otro 1/n 
      --2) Se debe registrar la transaccion (New Transaccion), al registrarla debo hacer update en ambas billeteras. 
      -- se debe comprobar q no queden en saldo negativo.
      --3) Si todavia no se ha cumplido la cantidad de monedas a cambiar, se debe volver a llamar al procedure