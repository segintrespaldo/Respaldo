/*
|| Package & Package Body de la Tabla ORDEN_PAGO_CICLO
*/
CREATE OR REPLACE 
PACKAGE pr_orden_pago_ciclo AS

FUNCTION N_IDORDENPAGO RETURN NUMBER;

PROCEDURE INSERT_ORDEN_PAGO ( cpOp IN OUT ORDEN_PAGO_ciclo%ROWTYPE  );

END PR_ORDEN_PAGO_ciclo;
/

CREATE OR REPLACE 
PACKAGE BODY pr_orden_pago_ciclo AS


FUNCTION N_IDORDENPAGO RETURN NUMBER IS

  nIdordenpago NUMBER;

BEGIN

   SELECT sq_orden_pago_ciclo.NEXTVAL
   INTO   nIdOrdenPago
   FROM   DUAL;

   RETURN ( nIdOrdenPago ) ;

END N_IDORDENPAGO;

PROCEDURE INSERT_ORDEN_PAGO ( cpOp IN OUT orden_pago_ciclo%ROWTYPE  ) IS

BEGIN

   cpOp.IdOrden := pr_orden_pago_ciclo.N_IDORDENPAGO;

  BEGIN
   INSERT INTO orden_pago_ciclo
           ( idorden, idepago, codordenpago, numordenpago,
             codmoneda, mtopagolocal, mtopagomoneda, numrelegre,
             numoblig, stsordenpago, stsordenpagonvo, codmotvanul,
             textomotvanul, fecanul, codcia, fecemi, tipodml,
             codusrdml, fecdml, envuser_host, envuser_os_user,
             envuser_ip_address )
   VALUES  ( cpOp.idorden, cpOp.idepago, cpOp.codordenpago, cpOp.numordenpago,
             cpOp.codmoneda, cpOp.mtopagolocal, cpOp.mtopagomoneda, cpOp.numrelegre,
             cpOp.numoblig, cpOp.stsordenpago, cpOp.stsordenpagonvo, cpOp.codmotvanul,
             cpOp.textomotvanul, cpOp.fecanul, cpOp.codcia, cpOp.fecemi, cpOp.tipodml,
             SYS_CONTEXT('USERENV','CURRENT_USER'), NVL(cpOp.FecDml,SYSDATE),
             SYS_CONTEXT('USERENV','HOST'),SYS_CONTEXT('USERENV','OS_USER'),
             SYS_CONTEXT('USERENV','IP_ADDRESS'));
   EXCEPTION
     WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,' ORDEN_PAGO '||cpOp.numordenpago||' '||SQLERRM);
   END;


END INSERT_ORDEN_PAGO;

END pr_orden_pago_ciclo;
/


