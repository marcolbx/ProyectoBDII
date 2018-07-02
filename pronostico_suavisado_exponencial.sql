SET SERVEROUTPUT ON;
create table pronostico_suavizado(id number GENERATED by default as IDENTITY,valor_real float, prediccion float, error_cuadrado float);
create or replace function msn(alfa IN float,num_transacciones IN number, mon_ofrecida IN number, mon_solicitada IN number)
return float
is
anterior float;
prediccion_anterior float;
cont number;
resultado float;
begin
    delete from pronostico_suavizado;
    for i in ((select val from (select t.tra_detalle.tasa_de_canje as val from transaccion t 
    where t.fk_mon_solicitada_codigo = mon_solicitada and t.fk_mon_ofrecida_codigo= mon_ofrecida order by t.tra_detalle.fecha_realizacion desc) 
    where rownum<num_transacciones)) loop
    insert into pronostico_suavizado(valor_real) values(i.val);
    end loop;
    cont := 0;
  for i in (select * from pronostico_suavizado order by id desc)loop
    if(cont<1) then
        prediccion_anterior := i.valor_real;
    else 
        prediccion_anterior := alfa* anterior + (1-alfa)*prediccion_anterior;
        update pronostico_suavizado set prediccion = prediccion_anterior, error_cuadrado = power(valor_real-prediccion_anterior,2)where id=i.id;
    end if;
    anterior := i.valor_real;
    cont := cont+1;
  end loop;
  select sum(error_cuadrado)into resultado from pronostico_suavizado;
  return resultado;
end;
create or replace procedure suavizado_exponencial(avance in float, num_transacciones IN number, mon_ofrecida IN number, mon_solicitada IN number)
is
msn1 float;
msn2 float;
alfa float;
mejor_alfa float;
pronostico float;
anterior float;
pronostico_anterior float;
begin
  alfa := 0.5;
  mejor_alfa :=0.5;
  while alfa<1 loop
    msn1 := msn(alfa,num_transacciones,mon_ofrecida,mon_solicitada);
    alfa := alfa+avance;
    msn2 := msn(alfa,num_transacciones,mon_ofrecida,mon_solicitada);
    if(msn2<msn1) then 
      mejor_alfa := alfa;
    end if;
  end loop;
  msn2 := msn(mejor_alfa,num_transacciones,mon_ofrecida,mon_solicitada)/(num_transacciones-1);
  select valor_real into anterior from pronostico_suavizado where rownum=1;
  select prediccion into pronostico_anterior from pronostico_suavizado where rownum=1;
  pronostico := mejor_alfa*anterior + (1-mejor_alfa)*pronostico_anterior;
  dbms_output.put_line(' ');
  dbms_output.put_line('El pronostico esperado es: '|| pronostico);
  dbms_output.put_line(' ');
  dbms_output.put_line('Con un alfa: '|| mejor_alfa);
  dbms_output.put_line('Y un error cuadrado medio de: '|| msn2); 
end;
call suavizado_exponencial(0.05, 100, 2, 1);
select * from pronostico_suavizado;
