--Determinar la cantidad de ordenes de tipo market de una moneda(moneda) en el intercambio de un rango de días (fecha inicio – fecha fin)
--con un tasa de canje(tasa) mayor a la especificada de usuarios de un país especifico(pais).
  
create or replace Function  --Funcion que devuelve la cantidad de ordenes y me devuelve un int
  Functionvol1 (fecha_ini IN date, fecha_fin IN date,tasa IN float, pais IN varchar,moneda IN number)
  return int 
  IS
  numero_transacciones int; 
    Begin 
    
      Select count(o.ord_mar_codigo)
      INTO numero_transacciones
      from Orden_Market o, Usuario u, Direccion d
       where moneda = o.fk_mon_ofrecida_codigo
        AND (o.ord_mar_detalle.fecha_realizacion < fecha_fin) AND (o.ord_mar_fecha_inicio >= fecha_ini)
        AND (o.ord_mar_detalle.tasa_de_canje >= tasa) AND (o.fk_usu_codigo = u.usu_codigo) AND (u.fk_dir_codigo = dir_codigo)
        AND (d.dir_pais.nombre = pais)
        ;
  
     return (numero_transacciones);
     EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
end Functionvol1;

create or replace Function  --Funcion que me dara la descripcion de la moneda
  Functionmon1(monedax IN number)
  return varchar
  is
  descripcionmon varchar(90);
  begin
   SELECT m.mon_descripcion.descripcion || ' Cuyo nombre es: ' || m.mon_descripcion.nombre 
   INTO descripcionmon 
   from Moneda m
   where m.mon_codigo = monedax;
   return descripcionmon;
   end Functionmon1;

create or replace procedure Reporte_Ordenes_Pais(fecha_ini IN date, fecha_fin IN date,tasa IN float, pais IN varchar,moneda IN number)
  is
  begin
    dbms_output.put_line('---------------------------------------------------------------------- ');
    dbms_output.put_line(' ');
    dbms_output.put_line('La cantidad de ordenes tipo market es: ' || Functionvol1(fecha_ini,fecha_fin,tasa,pais,moneda));
    dbms_output.put_line('Esta moneda ' || Functionmon(moneda));
    dbms_output.put_line(' ');
    dbms_output.put_line(' Ordenes de Tipo Market por los usuarios del pais :  '|| pais);
    dbms_output.put_line('_____________________________________________________________________________________________________________________________________________________________________________');

    FOR i in (SELECT * 
         FROM orden_market
         where fk_mon_ofrecida_codigo = moneda and rownum<15) loop
         dbms_output.put_line('Orden O' || i.ord_mar_codigo || ' Cantidad ' || i.ord_mar_detalle.cantidad || ' Fecha Realizacion: ' || i.ord_mar_detalle.fecha_realizacion || ' Tasa de Canje ' || i.ord_mar_detalle.tasa_de_canje);
         end loop;
         dbms_output.put_line('________________________________________________________________________________________________________________________________________________________________________');
end;

call Reporte_Ordenes_Pais('05-06-2015',SYSDATE,0,'Venezuela',1);

set serveroutput on;
select * from Moneda;
select * from orden_market;
select * from Usuario where usu_codigo =1 ; 