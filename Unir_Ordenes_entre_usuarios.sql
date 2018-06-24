--Este trigger unira las ordenes de varios usuarios y genera las transacciones para la completacion de la solicitud(tabla q no existe).
--Es decir, si un usuario pide 10 btc x 1 ethereum, habiendo 2 usuarios q poseen 5 btc, se uniran ambas para satisfacer

CREATE OR REPLACE TRIGGER TR_UNIR_ORDEN
AFTER INSERT ON ORDEN_MARKET
DECLARE
condicion int;
BEGIN
EXECUTE IMMEDIATE '
DROP TABLE Ordenes_temp as
SELECT * from Moneda';
EXCEPTION when others then 
  IF SQLCODE != -959 then 
  RAISE;
  END IF;                          --Valido q: la tasa de canje sea la inversa, las monedas ofrecidas vs solicitadas sean iguales, monedas_por_cambiar > 0. 
  EXECUTE IMMEDIATE '
CREATE TABLE Ordenes_temp AS (SELECT * FROM Orden_Market 
      where(ord_mar.ord_mar_detalle.tasa_de_canje = 1/:1)
      AND (ord_mar_codigo != :2) AND (fk_mon_ofrecida == :3) AND (fk_mon_solicitada == :4) 
      AND (ord_mar_monedas_por_cambiar > 0) AND (0 < :5
      )  '
      Using :NEW.ord_mar.ord_mar_detalle.tasa_de_canje,NEW.ord_mar_codigo,NEW.fk_mon_solicitada,NEW.fk_mon_ofrecida,New.ord_mar_monedas_por_cambiar
      ;
      Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(:NEW.ord_mar_detalle.cantidad,SYSDATE,:NEW.ord_mar_detalle.tasa_de_canje));
      Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(ord_mar_detalle.cantidad,SYSDATE,ord_mar_detalle.tasa_de_canje)); --Ponerle bien los paramentros
      
      Update Orden_Market SET ord_mar_monedas_por_cambiar = ord_mar_monedas_por_cambiar - :NEW.ord_mar_monedas_por_cambiar  --TASA DE CANJE poner *
      where ord_mar_codigo = ord_mar_codigo;

--UNIR_ORDENES;
  
END;



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
      
      --Usar update para las billeteras
      --1) Primero hay q ver quienes tienen la misma tasa de canje.. uno tendra tasa de canje n y el otro 1/n 
      --2) Se debe registrar la transaccion (New Transaccion), al registrarla debo hacer update en ambas billeteras. 
      -- se debe comprobar q no queden en saldo negativo.
      --3) Si todavia no se ha cumplido la cantidad de monedas a cambiar, se debe volver a llamar al procedure