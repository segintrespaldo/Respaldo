/*
|| Estructura de la Tabla OBLIGACION_CICLO
*/
CREATE TABLE obligacion_ciclo
    (idoblig                        NUMBER ,
    numoblig                       NUMBER(14,0) NOT NULL,
    tipoid                         VARCHAR2(1 BYTE),
    numid                          NUMBER(10,0) NOT NULL,
    dvid                           VARCHAR2(1 BYTE),
    tipooblig                      VARCHAR2(3 BYTE) NOT NULL,
    stsoblig                       VARCHAR2(3 BYTE) NOT NULL,
    stsoblignvo                    VARCHAR2(3 BYTE) NOT NULL,
    fecsts                         DATE NOT NULL,
    fecstsnvo                      DATE NOT NULL,
    fecgtiapago                    DATE NOT NULL,
    textoblig                      LONG,
    codmoneda                      VARCHAR2(3 BYTE) NOT NULL,
    numprto                        VARCHAR2(16 BYTE),
    numfracprto                    NUMBER(3,0),
    mtonetoobliglocal              NUMBER(27,2) NOT NULL,
    mtobrutoobligmoneda            NUMBER(27,2),
    mtonetoobligmoneda             NUMBER(27,2),
    mtobrutoobliglocal             NUMBER(27,2) NOT NULL,
    dptoemi                        VARCHAR2(6 BYTE) NOT NULL,
    sldoobliglocal                 NUMBER(27,2) NOT NULL,
    sldoobligmoneda                NUMBER(27,2),
    idesin                         NUMBER(14,0),
    codinterlider                  VARCHAR2(6 BYTE),
    numreling                      NUMBER(10,0),
    tipoprov                       VARCHAR2(2 BYTE),
    idenotacred                    NUMBER(14,0),
    numoper                        NUMBER(14,0),
    indpago                        VARCHAR2(1 BYTE),
    usuautpago                     VARCHAR2(8 BYTE),
    instpago                       VARCHAR2(8 BYTE),
    nrocuenta                      VARCHAR2(25 BYTE),
    indpripago                     NUMBER(2,0),
    codcia                         VARCHAR2(2 BYTE),
    indeli                         VARCHAR2(1 BYTE),
    fecemi                         DATE,
    indpresupuesto                 VARCHAR2(1 BYTE),
    referencia                     VARCHAR2(30 BYTE),
    codusrrev                      VARCHAR2(14 BYTE),
    numfact                        VARCHAR2(20 BYTE),
    numctrolfact                   VARCHAR2(20 BYTE),
    fecfact                        DATE,
    fecrecpfact                    DATE,
    tipoidter                      VARCHAR2(1 BYTE),
    numidter                       NUMBER(10,0),
    dvidter                        VARCHAR2(1 BYTE),
    tipodml                        VARCHAR2(1 BYTE),
    codusrdml                      VARCHAR2(10 BYTE),
    fecdml                         DATE,
    envuser_host                   VARCHAR2(256 BYTE),
    envuser_os_user                VARCHAR2(256 BYTE),
    envuser_ip_address             VARCHAR2(256 BYTE))
/


-- Primary Key de la Tabla OBLIGACION_CICLO

ALTER TABLE obligacion_ciclo
ADD PRIMARY KEY (idoblig)
/

