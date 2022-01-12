/*
|| Package & Package Body de FACTURA_CICLO
*/

CREATE OR REPLACE 
PACKAGE pr_factura_ciclo AS

FUNCTION N_IDFACTURA RETURN NUMBER;

PROCEDURE INSERT_FACTURA ( cpFa IN OUT factura_ciclo%ROWTYPE  );

END PR_factura_ciclo;
/

CREATE OR REPLACE 
PACKAGE BODY pr_factura_ciclo AS


FUNCTION N_IDFACTURA RETURN NUMBER IS

  nIdfactura NUMBER;

BEGIN

   SELECT sq_factura_ciclo.NEXTVAL
   INTO   nIdFactura
   FROM   DUAL;

   RETURN ( nIdFactura ) ;

END N_IDFACTURA;

PROCEDURE INSERT_FACTURA ( cpFa IN OUT factura_ciclo%ROWTYPE  ) IS

BEGIN

   cpFa.IdFactura := pr_factura_ciclo.N_IDFACTURA;

  BEGIN
   INSERT INTO FACTURA_CICLO
           ( idfactura, idefact, codfact, numfact, tipoid, numid,
             dvid, codmoneda, mtofactlocal, codinter, mtofactmoneda,
             stsfact, stsfactnvo, fecsts, fecstsnvo, codofifact,
             tipocobrador, codcobrador, fecvencfact, codciafinc,
             numreling, codmotvanul, textmotvanul, fecanul,
             codcondcobro, fecnotif, numrelingnot, zonapostal,
             zonacobro, fecproxvisita, proxmovin, numrelcob,
             numoper, codcia, idefactpol, porcptopago, tipodml,
             codusrdml, fecdml, envuser_host, envuser_os_user,
             envuser_ip_address )
   VALUES  ( cpFa.idfactura, cpFa.idefact, cpFa.codfact, cpFa.numfact, cpFa.tipoid, cpFa.numid,
             cpFa.dvid, cpFa.codmoneda, cpFa.mtofactlocal, cpFa.codinter, cpFa.mtofactmoneda,
             cpFa.stsfact, cpFa.stsfactnvo, cpFa.fecsts, cpFa.fecstsnvo, cpFa.codofifact,
             cpFa.tipocobrador, cpFa.codcobrador, cpFa.fecvencfact, cpFa.codciafinc,
             cpFa.numreling, cpFa.codmotvanul, cpFa.textmotvanul, cpFa.fecanul,
             cpFa.codcondcobro, cpFa.fecnotif, cpFa.numrelingnot, cpFa.zonapostal,
             cpFa.zonacobro, cpFa.fecproxvisita, cpFa.proxmovin, cpFa.numrelcob,
             cpFa.numoper, cpFa.codcia, cpFa.idefactpol, cpFa.porcptopago, cpFa.tipodml,
             SYS_CONTEXT('USERENV','CURRENT_USER'), NVL(cpFa.FecDml,SYSDATE),
             SYS_CONTEXT('USERENV','HOST'),SYS_CONTEXT('USERENV','OS_USER'),
             SYS_CONTEXT('USERENV','IP_ADDRESS'));
   EXCEPTION
     WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,' FACTURA '||cpFa.idefact||' '||SQLERRM);
   END;


END INSERT_FACTURA;

END pr_factura_ciclo;
/


