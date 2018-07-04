--Filtrar por moneda(moneda) la cantidad de transacciones realizadas por un usuario(usuario)
--ordenados de mayor a menor en cuanto a cantidad de transacciones a partir de una fecha inicial(fecha_ini). 

--ESTE ES EL REPORTE # 5

create or replace procedure Proc_Reporte_monedas_usuario(fecha_ini date,usuario in number) 
is
  begin
  
  For i in (Select m.mon_descripcion.nombre  as resultado,count(t.tra_codigo) as contador 
    from Moneda m, Usuario u, Transaccion t, Orden_Market om, Ord_Tra ot
    where  fecha_ini< t.tra_detalle.fecha_realizacion   --Valido fecha
    AND t.fk_mon_ofrecida_codigo = om.fk_mon_ofrecida_codigo AND om.ord_mar_codigo = ot.fk_ord_mar_codigo --Valido la moneda = a la moneda, relaciono orden market con ord tra
    AND om.fk_usu_codigo = u.usu_codigo --relaciono la orden market con el usuaario
    AND t.fk_mon_ofrecida_codigo = m.mon_codigo
    AND u.usu_codigo = usuario
  Group by m.mon_descripcion.nombre
   Order by contador desc
  )loop
  dbms_output.put_line(i.resultado || ': ' || i.contador);
  end loop;
  end;
   set serveroutput on;
  call Proc_Reporte_monedas_usuario('01/01/2018',11);
  select * from Ord_Tra;
  select * from Orden_Market where fk_usu_codigo = 11;
  select * from Orden_Market;