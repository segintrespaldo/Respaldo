/*
|| Estructura de la Tabla ACREENCIA_CICLO
*/

CREATE TABLE acreencia_ciclo
    (idacre                         NUMBER NOT NULL,
    numacre                        NUMBER(14,0) NOT NULL,
    stsacre                        VARCHAR2(3 BYTE) NOT NULL,
    fecsts                         DATE NOT NULL,
    stsacrenvo                     VARCHAR2(3 BYTE) NOT NULL,
    fecstsnvo                      DATE NOT NULL,
    tipoacre                       VARCHAR2(3 BYTE) NOT NULL,
    codmoneda                      VARCHAR2(3 BYTE) NOT NULL,
    mtoacrelocal                   NUMBER(27,2) NOT NULL,
    mtoacremoneda                  NUMBER(27,2),
    fecvencacre                    DATE NOT NULL,
    sldoacrelocal                  NUMBER(27,2) NOT NULL,
    sldoacremoneda                 NUMBER(27,2) NOT NULL,
    codinterlider                  VARCHAR2(6 BYTE),
    tipoid                         VARCHAR2(1 BYTE),
    numid                          NUMBER(10,0) NOT NULL,
    dvid                           VARCHAR2(1 BYTE),
    idefact                        NUMBER(14,0),
    dptoemi                        VARCHAR2(6 BYTE),
    codcondcobro                   VARCHAR2(6 BYTE),
    fecnotif                       DATE,
    codcia                         VARCHAR2(2 BYTE),
    tipodml                        VARCHAR2(1 BYTE) NOT NULL,
    codusrdml                      VARCHAR2(10 BYTE) NOT NULL,
    fecdml                         DATE NOT NULL)
/


-- Primary Key de la Tabla ACREENCIA_CICLO

ALTER TABLE acreencia_ciclo
ADD CONSTRAINT pk_acreenca_ciclo PRIMARY KEY (idacre)
/


