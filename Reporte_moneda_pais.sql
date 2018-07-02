create or replace procedure Procedure_Reporte_monedas_paises(monedax in number,fecha_ini date) 
is
paises varchar(100);
  begin
  
  For i in (Select d.dir_pais.nombre  as resultado,sum(m.ord_mar_detalle.cantidad) as suma from Direccion d, Usuario u, Orden_Market m
  where u.fk_dir_codigo = d.dir_codigo AND m.fk_usu_codigo = u.usu_codigo AND fecha_ini< m.ord_mar_fecha_inicio
  AND m.fk_mon_ofrecida_codigo = monedax
  Group by d.dir_pais.nombre
   Order by suma desc
  )loop
  dbms_output.put_line(i.resultado || ': ' || i.suma);
  end loop;
  end;
    call Procedure_Reporte_monedas_paises(1,'01/Jan/2018');
  
  set serveroutput on;
  
  Select d.dir_pais.nombre  as resultado,sum(m.ord_mar_detalle.cantidad) as suma from Direccion d, Usuario u, Orden_Market m
  where u.fk_dir_codigo = d.dir_codigo AND m.fk_usu_codigo = u.usu_codigo AND '01/Jan/2018'< m.ord_mar_fecha_inicio
  AND m.fk_mon_ofrecida_codigo = 1
  Group by d.dir_pais.nombre
   Order by suma desc;
   
   insert into Direccion(dir_pais) values (pais('Estados Unidos','1'));
  insert into Direccion(dir_pais) values (pais('Mexico','2'));
  insert into Direccion(dir_pais) values (pais('Venezuela','3'));
  insert into Direccion(dir_pais) values (pais('Rusia','4'));
  insert into Direccion(dir_pais) values (pais('Colombia','5'));
  
  update usuario set fk_dir_codigo = 1;
  update usuario set fk_dir_codigo = 2 where usu_codigo <5;