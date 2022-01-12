/*
|| Estructura de la Tabla ORDEN_PAGO_CICLO
*/
CREATE TABLE orden_pago_ciclo
    (idorden                        NUMBER ,
    idepago                        NUMBER(14,0) NOT NULL,
    codordenpago                   VARCHAR2(3 BYTE) NOT NULL,
    numordenpago                   NUMBER(10,0) NOT NULL,
    codmoneda                      VARCHAR2(3 BYTE) NOT NULL,
    mtopagolocal                   NUMBER(27,5) NOT NULL,
    mtopagomoneda                  NUMBER(27,5),
    numrelegre                     NUMBER(10,0),
    numoblig                       NUMBER(14,0) NOT NULL,
    stsordenpago                   VARCHAR2(3 BYTE),
    stsordenpagonvo                VARCHAR2(3 BYTE),
    codmotvanul                    VARCHAR2(4 BYTE),
    textomotvanul                  VARCHAR2(250 BYTE),
    fecanul                        DATE,
    codcia                         VARCHAR2(2 BYTE),
    fecemi                         DATE,
    tipodml                        VARCHAR2(1 BYTE),
    codusrdml                      VARCHAR2(10 BYTE),
    fecdml                         DATE,
    envuser_host                   VARCHAR2(256 BYTE),
    envuser_os_user                VARCHAR2(256 BYTE),
    envuser_ip_address             VARCHAR2(256 BYTE))
/


-- Primary Key de la tabla ORDEN_PAGO_CICLO

ALTER TABLE orden_pago_ciclo
ADD CONSTRAINT pk_orden_pago_ciclo PRIMARY KEY (idorden)
/


