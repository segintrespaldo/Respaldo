/*
|| Extract DLL de la Tabla REL_ING_CICLO
*/

CREATE TABLE rel_ing_ciclo
    (idreling                       NUMBER ,
    numreling                      NUMBER(10,0) NOT NULL,
    stsreling                      VARCHAR2(3 BYTE) NOT NULL,
    stsrelingnvo                   VARCHAR2(3 BYTE) NOT NULL,
    codofiing                      VARCHAR2(6 BYTE) NOT NULL,
    codcaja                        VARCHAR2(8 BYTE) NOT NULL,
    codcajero                      VARCHAR2(8 BYTE) NOT NULL,
    fecstsreling                   DATE NOT NULL,
    fecstsrelingnvo                DATE NOT NULL,
    horareling                     VARCHAR2(8 BYTE) NOT NULL,
    nomterreling                   VARCHAR2(120 BYTE) NOT NULL,
    numacrefalt                    NUMBER(14,0),
    numobligsobr                   NUMBER(14,0),
    codmotvanul                    VARCHAR2(4 BYTE),
    textmotvanul                   VARCHAR2(250 BYTE),
    numing                         NUMBER(10,0),
    numrelingtemp                  NUMBER(14,0),
    tipoid                         VARCHAR2(1 BYTE),
    numid                          NUMBER(10,0),
    dvid                           VARCHAR2(1 BYTE),
    codmoneda                      VARCHAR2(3 BYTE),
    mtomoramoneda                  NUMBER(27,5),
    mtoppagomoneda                 NUMBER(27,5),
    indingoch                      VARCHAR2(1 BYTE),
    codcia                         VARCHAR2(2 BYTE),
    indweb                         VARCHAR2(1 BYTE),
    ideciecaja                     NUMBER(14,0),
    numobligrelpago                NUMBER(14,0),
    tipodml                        VARCHAR2(1 BYTE) NOT NULL,
    codusrdml                      VARCHAR2(10 BYTE) NOT NULL,
    fecdml                         DATE NOT NULL,
    envuser_host                   VARCHAR2(256 BYTE),
    envuser_os_user                VARCHAR2(256 BYTE),
    envuser_ip_address             VARCHAR2(256 BYTE))
/


-- Constraints for REL_ING_CICLO

ALTER TABLE rel_ing_ciclo
ADD CONSTRAINT pk_rel_ing_ciclo PRIMARY KEY (idreling)
/


