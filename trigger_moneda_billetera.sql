--Este trigger genera una billetera por cada usuario existente al crear una nueva moneda
CREATE or replace TRIGGER TR_MONEDA_BILLETERA
AFTER INSERT ON Moneda 
For each row 
 ENABLE
 BEGIN 
      For i in( select usu_codigo from Usuario)loop
        INSERT INTO Billetera (bil_cantidad,bil_numero,fk_usu_codigo,fk_mon_codigo)
        VALUES (0,numero_de_cuenta('a','b'),i.usu_codigo,:NEW.mon_codigo);
      end loop;
  END;
  