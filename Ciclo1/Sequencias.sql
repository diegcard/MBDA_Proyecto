-- Secuencia de id venta
CREATE SEQUENCE SEQ_idPersona
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOCYCLE
CACHE 10;


/*XSequence*/
DROP SEQUENCE SEQ_idVenta;


-- Necestivo volver a iniciar la SEQ_idPersona en 1
ALTER SEQUENCE SEQ_idPersona RESTART WITH 1;