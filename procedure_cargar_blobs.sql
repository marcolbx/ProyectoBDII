CREATE or replace DIRECTORY  MY_DIR AS 'C:\Users\Veronica Hevia\Documents\2)UCAB\7mo\Bases2';
update usuario set usu_foto_pasaporte = empty_blob();
CREATE or replace PROCEDURE cargar_pasaportes
IS
v_lob     BLOB;
l_bfile   bfile;
amt       NUMBER;
BEGIN
  for i in(select usu_codigo from usuario where rownum<500) loop
    l_bfile := bfilename( 'MY_DIR', 'pas2.jpg' );
    
    SELECT usu_foto_pasaporte INTO v_lob FROM usuario WHERE usu_codigo=i.usu_codigo for update;
    
    amt := dbms_lob.getlength( l_bfile );
    dbms_lob.fileopen( l_bfile ,dbms_lob.file_readonly);
    dbms_lob.loadfromfile( v_lob, l_bfile ,amt);
    
    dbms_lob.fileclose( l_bfile );
    end loop;
END;

CREATE or replace PROCEDURE cargar_direcciones
IS
BEGIN
  update usuario set fk_dir_codigo = dbms_random.value(1,5) where rownum<500;
END;
call cargar_pasaportes();
call cargar_direcciones();
select * from usuario;