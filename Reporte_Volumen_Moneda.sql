-- Reporte de volumen de intercambio de una moneda
 create or replace Function  --Funcion que devuelve el volumen de monedas cambiadas
  Functionvol (fecha_ini IN date, fecha_fin IN date,precio_min IN float, precio_max IN float,moneda IN number)
  return float 
  IS
  volumen float; 
    Begin 
    
      Select sum(t.tra_detalle.cantidad)
      INTO volumen
      from Transaccion t 
       where moneda = t.fk_mon_ofrecida_codigo
        AND (t.tra_detalle.fecha_realizacion < fecha_fin) AND (t.tra_detalle.fecha_realizacion >= fecha_ini)
        AND (t.tra_detalle.tasa_de_canje < precio_max) AND (t.tra_detalle.tasa_de_canje >= precio_min);
  
     return (volumen);
     EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
end Functionvol;

SELECT Functionvol('1/Jan/2018','1/Oct/2018',0,1,1) FROM Transaccion;

create or replace Function  --Funcion que me dara la descripcion de la moneda
  Functionmon(monedax IN number)
  return varchar
  is
  descripcionmon varchar(90);
  begin
   SELECT m.mon_descripcion.descripcion || ' Cuyo nombre es: ' || m.mon_descripcion.nombre 
   INTO descripcionmon 
   from Moneda m
   where m.mon_codigo = monedax;
   return descripcionmon;
   end Functionmon;

create or replace procedure Reporte_Volumen_Moneda(fecha_ini IN date, fecha_fin IN date,precio_min IN float, precio_max IN float,moneda IN number)
  is
  --nombre_mon varchar;
  begin
 -- select m. mon_descripcion.nombre
 -- into nombre_mon 
 -- from Moneda m where m.mon_codigo = moneda;
    dbms_output.put_line(' ');
    dbms_output.put_line('El volumen de la moneda seleccionada es: ' || Functionvol(fecha_ini,fecha_fin,precio_min,precio_max,moneda));
    dbms_output.put_line('Esta moneda ' || Functionmon(moneda));
    dbms_output.put_line(' ');
    dbms_output.put_line(' Ultimas transacciones completadas ');
    dbms_output.put_line('_____________________________________________________________________________________________');

    FOR i in (SELECT * 
         FROM Transaccion
         where fk_mon_ofrecida_codigo = moneda) loop
         dbms_output.put_line('Transaccion T' || i.tra_codigo || ' Cantidad ' || i.tra_detalle.cantidad || ' Fecha Realizacion: ' || i.tra_detalle.fecha_realizacion || ' Tasa de Canje ' || i.tra_detalle.tasa_de_canje);
         end loop;
         dbms_output.put_line('_____________________________________________________________________________________________');
end;
call Reporte_Volumen_Moneda('01/Jan/2018','01/Oct/2018',0,10000,1);

select * from Transaccion where fk_mon_ofrecida_codigo=1;


 call Functionvol(SYSDATE,SYSDATE+1,0,2,71); 
  
  set serveroutput on;
  EXECUTE dbms_output.put_line(Functionvol('1/Jan/2018','1/Oct/2018',0,2,71));
  
  Insert into Transaccion(tra_detalle,tra_numeros_de_cuenta,fk_mon_ofrecida_codigo,fk_mon_solicitada_codigo) 
  values(Detalle(14,SYSDATE,1),Numero_de_Cuenta('awf134','23rw3rs'),71,72);
  select * from Transaccion;
  select * from Moneda;