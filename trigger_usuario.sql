CREATE or replace TRIGGER TR_USUARIO_BILLETERA
 AFTER INSERT ON USUARIO 
 FOR EACH ROW
 ENABLE
  Begin 
    INSERT INTO BILLETERA (bil_cantidad,bil_numero,fk_usu_codigo,fk_mon_codigo)
    VALUES (0,numero_de_cuenta('a','b'),:NEW.usu_codigo,1);
    END;