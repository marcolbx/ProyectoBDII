-- Blob upload by : https://community.oracle.com/message/14603283#14603283
-- 2da forma: http://sureshvaishya.blogspot.com/2009/08/insert-blob-image-file-into-database.html       
--3era forma: https://dba.stackexchange.com/questions/120765/updating-blob-columns

CREATE DIRECTORY MY_DIR AS 'C:\Users\marco\Documents\GitHub\ProyectoBDII';

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