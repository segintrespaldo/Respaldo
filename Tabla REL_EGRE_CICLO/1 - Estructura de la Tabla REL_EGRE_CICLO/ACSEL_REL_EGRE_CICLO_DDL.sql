/*
|| Estructura de la Tabla REL_EGRE_CICLO
*/
CREATE TABLE rel_egre_ciclo
    (idrelegre                      NUMBER ,
    numrelegre                     NUMBER(10,0) NOT NULL,
    codcaja                        VARCHAR2(8 BYTE) NOT NULL,
    codcajero                      VARCHAR2(8 BYTE) NOT NULL,
    fecsts                         DATE NOT NULL,
    fecstsnvo                      DATE NOT NULL,
    horasts                        VARCHAR2(8 BYTE) NOT NULL,
    stsrelegre                     VARCHAR2(3 BYTE) NOT NULL,
    stsrelegrenvo                  VARCHAR2(3 BYTE) NOT NULL,
    codofirelegre                  VARCHAR2(6 BYTE) NOT NULL,
    tipoid                         VARCHAR2(1 BYTE) NOT NULL,
    numid                          NUMBER(10,0) NOT NULL,
    dvid                           VARCHAR2(1 BYTE) NOT NULL,
    textrelegre                    LONG,
    codmotvanul                    VARCHAR2(4 BYTE),
    textmotvanul                   VARCHAR2(250 BYTE),
    fecanul                        DATE,
    indingfin                      VARCHAR2(1 BYTE),
    codcia                         VARCHAR2(2 BYTE),
    tipodml                        VARCHAR2(1 BYTE),
    codusrdml                      VARCHAR2(10 BYTE),
    fecdml                         DATE,
    envuser_host                   VARCHAR2(256 BYTE),
    envuser_os_user                VARCHAR2(256 BYTE),
    envuser_ip_address             VARCHAR2(256 BYTE))
/


-- Primary Key de la Tabla REL_EGRE_CICLO

ALTER TABLE rel_egre_ciclo
ADD CONSTRAINT pk_rel_egre_ciclo PRIMARY KEY (idrelegre)
/

