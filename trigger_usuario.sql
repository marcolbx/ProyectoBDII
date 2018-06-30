CREATE or replace TRIGGER TR_USUARIO_BILLETERA
 AFTER INSERT ON USUARIO 
 FOR EACH ROW
 ENABLE
  Begin 
     For i in( select mon_codigo from Moneda)loop
      INSERT INTO BILLETERA (bil_cantidad,bil_numero,fk_usu_codigo,fk_mon_codigo)
      VALUES (0,numero_de_cuenta('xhsjrhdb12839','hfdjdsksdj123jd'),:NEW.usu_codigo,i.mon_codigo);
      end loop;
    
    END;