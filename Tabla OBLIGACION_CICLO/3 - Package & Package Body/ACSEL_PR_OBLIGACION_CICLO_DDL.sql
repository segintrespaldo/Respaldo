/*
|| Package & Package Body de PR_OBLIGACION_CICLO
*/
CREATE OR REPLACE 
PACKAGE pr_obligacion_ciclo AS

FUNCTION N_IDOBLIGACION RETURN NUMBER;

PROCEDURE INSERT_OBLIGACION ( cpOb IN OUT obligacion_ciclo%ROWTYPE  );

END PR_obligacion_ciclo;
/

CREATE OR REPLACE 
PACKAGE BODY pr_obligacion_ciclo AS


FUNCTION N_IDOBLIGACION RETURN NUMBER IS

  nIdobligacion NUMBER;

BEGIN

   SELECT sq_obligacion_ciclo.NEXTVAL
   INTO   nIdObligacion
   FROM   DUAL;

   RETURN ( nIdObligacion ) ;

END N_IDOBLIGACION;

PROCEDURE INSERT_OBLIGACION ( cpOb IN OUT obligacion_ciclo%ROWTYPE  ) IS

BEGIN

   cpOb.IdOblig := pr_obligacion_ciclo.N_IDOBLIGACION;

  BEGIN
   INSERT INTO obligacion_ciclo
           ( idoblig, numoblig, tipoid, numid, dvid, tipooblig,
             stsoblig, stsoblignvo, fecsts, fecstsnvo, fecgtiapago,
             textoblig, codmoneda, numprto, numfracprto,
             mtonetoobliglocal, mtobrutoobligmoneda, mtonetoobligmoneda,
             mtobrutoobliglocal, dptoemi, sldoobliglocal,
             sldoobligmoneda, idesin, codinterlider, numreling,
             tipoprov, idenotacred, numoper, indpago, usuautpago,
             instpago, nrocuenta, indpripago, codcia, indeli,
             fecemi, indpresupuesto, referencia, codusrrev, numfact,
             numctrolfact, fecfact, fecrecpfact, tipoidter,
             numidter, dvidter, tipodml, codusrdml, fecdml,
             envuser_host, envuser_os_user, envuser_ip_address )
   VALUES  ( cpOb.idoblig, cpOb.numoblig, cpOb.tipoid, cpOb.numid, cpOb.dvid, cpOb.tipooblig,
             cpOb.stsoblig, cpOb.stsoblignvo, cpOb.fecsts, cpOb.fecstsnvo, cpOb.fecgtiapago,
             cpOb.textoblig, cpOb.codmoneda, cpOb.numprto, cpOb.numfracprto,
             cpOb.mtonetoobliglocal, cpOb.mtobrutoobligmoneda, cpOb.mtonetoobligmoneda,
             cpOb.mtobrutoobliglocal, cpOb.dptoemi, cpOb.sldoobliglocal,
             cpOb.sldoobligmoneda, cpOb.idesin, cpOb.codinterlider, cpOb.numreling,
             cpOb.tipoprov, cpOb.idenotacred, cpOb.numoper, cpOb.indpago, cpOb.usuautpago,
             cpOb.instpago, cpOb.nrocuenta, cpOb.indpripago, cpOb.codcia, cpOb.indeli,
             cpOb.fecemi, cpOb.indpresupuesto, cpOb.referencia, cpOb.codusrrev, cpOb.numfact,
             cpOb.numctrolfact, cpOb.fecfact, cpOb.fecrecpfact, cpOb.tipoidter,
             cpOb.numidter, cpOb.dvidter, cpOb.tipodml,
             SYS_CONTEXT('USERENV','CURRENT_USER'), NVL(cpOb.FecDml,SYSDATE),
             SYS_CONTEXT('USERENV','HOST'),SYS_CONTEXT('USERENV','OS_USER'),
             SYS_CONTEXT('USERENV','IP_ADDRESS'));
   EXCEPTION
     WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,' OBLIGACION '||cpOb.NumOblig||' '||SQLERRM);
   END;


END INSERT_OBLIGACION;

END pr_obligacion_ciclo;
/

