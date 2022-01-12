/*
|| Package & Package Body de la Tabla REL_EGRE_CICLO
*/

CREATE OR REPLACE 
PACKAGE pr_rel_egre_ciclo AS

FUNCTION N_IDRELEGRE RETURN NUMBER;

PROCEDURE INSERT_REL_EGRE ( cpRe IN OUT rel_egre_ciclo%ROWTYPE  );

END PR_rel_egre_ciclo;
/

CREATE OR REPLACE 
PACKAGE BODY pr_rel_egre_ciclo AS


FUNCTION N_IDRELEGRE RETURN NUMBER IS

  nIdrelegre NUMBER;

BEGIN

   SELECT sq_rel_egre_ciclo.NEXTVAL
   INTO   nIdRelEgre
   FROM   DUAL;

   RETURN ( nIdRelEgre ) ;

END N_IDRELEGRE;

PROCEDURE INSERT_REL_EGRE ( cpRe IN OUT rel_egre_ciclo%ROWTYPE  ) IS

BEGIN

   cpRe.Idrelegre := pr_rel_egre_ciclo.N_IDRELEGRE;

  BEGIN
   INSERT INTO rel_egre_ciclo
           ( idrelegre, numrelegre, codcaja, codcajero, fecsts,
             fecstsnvo, horasts, stsrelegre, stsrelegrenvo,
             codofirelegre, tipoid, numid, dvid, textrelegre,
             codmotvanul, textmotvanul, fecanul, indingfin, codcia,
             tipodml, codusrdml, fecdml, envuser_host,
             envuser_os_user, envuser_ip_address )
   VALUES  ( cpRe.idrelegre, cpRe.numrelegre, cpRe.codcaja, cpRe.codcajero, cpRe.fecsts,
             cpRe.fecstsnvo, cpRe.horasts, cpRe.stsrelegre, cpRe.stsrelegrenvo,
             cpRe.codofirelegre, cpRe.tipoid, cpRe.numid, cpRe.dvid, cpRe.textrelegre,
             cpRe.codmotvanul, cpRe.textmotvanul, cpRe.fecanul, cpRe.indingfin, cpRe.codcia,
             cpRe.tipodml,
             SYS_CONTEXT('USERENV','CURRENT_USER'), NVL(cpRe.FecDml,SYSDATE),
             SYS_CONTEXT('USERENV','HOST'),SYS_CONTEXT('USERENV','OS_USER'),
             SYS_CONTEXT('USERENV','IP_ADDRESS'));
   EXCEPTION
     WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,' REL_EGRE '||cpRe.NumRelEgre||' '||SQLERRM);
   END;


END INSERT_REL_EGRE;

END pr_rel_egre_ciclo;
/


