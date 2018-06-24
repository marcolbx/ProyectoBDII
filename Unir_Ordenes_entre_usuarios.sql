--Este trigger unira las ordenes de varios usuarios y genera las transacciones para la completacion de la solicitud(tabla q no existe).
--Es decir, si un usuario pide 10 btc x 1 ethereum, habiendo 2 usuarios q poseen 5 btc, se uniran ambas para satisfacer

CREATE OR REPLACE TRIGGER TR_UNIR_ORDEN
AFTER INSERT ON ORDEN_MARKET
BEGIN
EXECUTE IMMEDIATE '
DROP TABLE Ordenes_temp as
SELECT * from Moneda';
EXCEPTION when others then 
  IF SQLCODE != -959 then 
  RAISE;
  END IF;
  EXECUTE IMMEDIATE '
CREATE TABLE Ordenes_temp AS (SELECT * FROM Orden_Market 
      where(ord_mar.ord_mar_detalle.tasa_de_canje = 1/:NEW.ord_mar.ord_mar_detalle.tasa_de_canje)
      AND (ord_mar_codigo != :NEW.ord_mar_codigo) AND (fk_mon_ofrecida == :NEW.fk_mon_solicitada) AND (fk_mon_solicitada == :NEW.fk_mon_ofrecida) 
      )  ';
      Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(:NEW.ord_mar_detalle.cantidad,SYSDATE,:NEW.ord_mar_detalle.tasa_de_canje));
      Insert into Transaccion(tra_detalle,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) values(Detalle(ord_mar_detalle.cantidad,SYSDATE,ord_mar_detalle.tasa_de_canje)); --Ponerle bien los paramentros
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
      --3) Si todavia no se ha cumplido la cantidad de monedas a cambiar, se debe volver a llamar al procedure
      -- SE creara una funcion que me validara las condiciones, si se cumplen devuelve el trigger que genera el procedimiento de updates de las monedas en las billeteras.