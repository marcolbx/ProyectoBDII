set serveroutput on;
create or replace procedure prueba 
is 
begin
 for row in (select * from Moneda) loop
  dbms_output.put_line(row.mon_codigo || ' ' || row.mon_descripcion.nombre);
 end loop;
end;
call prueba();
select * from Moneda;