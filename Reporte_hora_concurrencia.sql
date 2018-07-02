--Reporte determinar la hora con mas concurrencia en el intercambio de transacciones en el dia anterior
--Solo se puede extraer hora de timestamp 

   SELECT EXTRACT(HOUR FROM TIMESTAMP '1999-01-01 10:00:00') FROM dual;

create or replace Procedure Procedure_hora_concurrencia
is
begin 
  
  

