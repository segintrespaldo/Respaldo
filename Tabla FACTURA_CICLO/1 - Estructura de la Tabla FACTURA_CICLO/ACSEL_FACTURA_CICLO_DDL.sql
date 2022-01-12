/*
|| Estructura de la Tabla FACTURA_CICLO
*/

CREATE TABLE factura_ciclo
    (idfactura                      NUMBER ,
    idefact                        NUMBER(14,0) NOT NULL,
    codfact                        VARCHAR2(3 BYTE),
    numfact                        NUMBER(10,0) NOT NULL,
    tipoid                         VARCHAR2(1 BYTE),
    numid                          NUMBER(10,0) NOT NULL,
    dvid                           VARCHAR2(1 BYTE),
    codmoneda                      VARCHAR2(3 BYTE) NOT NULL,
    mtofactlocal                   NUMBER(27,2) NOT NULL,
    codinter                       VARCHAR2(6 BYTE),
    mtofactmoneda                  NUMBER(27,2),
    stsfact                        VARCHAR2(3 BYTE) NOT NULL,
    stsfactnvo                     VARCHAR2(3 BYTE) NOT NULL,
    fecsts                         DATE NOT NULL,
    fecstsnvo                      DATE NOT NULL,
    codofifact                     VARCHAR2(6 BYTE) NOT NULL,
    tipocobrador                   VARCHAR2(3 BYTE) NOT NULL,
    codcobrador                    VARCHAR2(6 BYTE),
    fecvencfact                    DATE NOT NULL,
    codciafinc                     VARCHAR2(6 BYTE),
    numreling                      NUMBER(10,0),
    codmotvanul                    VARCHAR2(4 BYTE),
    textmotvanul                   VARCHAR2(250 BYTE),
    fecanul                        DATE,
    codcondcobro                   VARCHAR2(6 BYTE),
    fecnotif                       DATE,
    numrelingnot                   NUMBER(10,0),
    zonapostal                     VARCHAR2(4 BYTE),
    zonacobro                      VARCHAR2(4 BYTE),
    fecproxvisita                  DATE,
    proxmovin                      VARCHAR2(4 BYTE),
    numrelcob                      NUMBER(10,0),
    numoper                        NUMBER(14,0),
    codcia                         VARCHAR2(2 BYTE),
    idefactpol                     NUMBER(14,0),
    porcptopago                    NUMBER(6,2),
    tipodml                        VARCHAR2(1 BYTE),
    codusrdml                      VARCHAR2(10 BYTE),
    fecdml                         DATE,
    envuser_host                   VARCHAR2(256 BYTE),
    envuser_os_user                VARCHAR2(256 BYTE),
    envuser_ip_address             VARCHAR2(256 BYTE))
/


-- Primary Key de la Tabla FACTURA_CICLO

ALTER TABLE factura_ciclo
ADD CONSTRAINT pk_factura_ciclo PRIMARY KEY (idfactura)
/


