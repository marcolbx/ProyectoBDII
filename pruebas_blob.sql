-- Blob upload by : https://community.oracle.com/message/14603283#14603283
-- 2da forma: http://sureshvaishya.blogspot.com/2009/08/insert-blob-image-file-into-database.html       
--3era forma: https://dba.stackexchange.com/questions/120765/updating-blob-columns

CREATE or replace DIRECTORY  MY_DIR AS 'C:\Users\Veronica Hevia\Documents\2)UCAB\7mo\Bases2';

CREATE or replace PROCEDURE cargar_pasaportes
IS
v_lob     BLOB;
l_bfile   bfile;
amt       NUMBER;
BEGIN
    l_bfile := bfilename( 'MY_DIR', 'pas2.jpg' );
    
    SELECT usu_foto_pasaporte INTO v_lob FROM usuario WHERE usu_codigo=1;
    
    amt := dbms_lob.getlength( l_bfile );
    dbms_lob.fileopen( l_bfile ,dbms_lob.file_readonly);
    dbms_lob.loadfromfile( v_lob, l_bfile ,amt);
    
    dbms_lob.fileclose( l_bfile );
END;
call cargar_pasaportes();
/*
DECLARE
  src_bfile BFILE := BFILENAME('MY_DIR','foto.jpg');
  dest_blob BLOB;
  
  BEGIN
  SELECT usu_foto_pasaporte into dest_blob FROM Usuario where usu_codigo = 1;

  DBMS_LOB.FILEOPEN(src_bfile, DBMS_LOB.file_readonly);
  DBMS_LOB.LoadFromFile(dest_blob,
                         src_bfile,
                        DBMS_LOB.GETLENGTH(src_bfile) );
  DBMS_LOB.FILECLOSE(src_bfile);

  COMMIT;
END;


/
/*
  BEGIN
  SELECT BLOBCOL into dest_blob FROM BLOBTABLE WHERE ROWID = 'ROWIDVALUE';

  DBMS_LOB.OPEN(src_bfile, DBMS_LOB.LOB_READONLY);
  DBMS_LOB.LoadFromFile( DEST_LOB => dest_blob,
                         SRC_LOB  => src_bfile,
                         AMOUNT   => DBMS_LOB.GETLENGTH(src_bfile) );
  DBMS_LOB.CLOSE(src_lob);

  COMMIT;
END;*/