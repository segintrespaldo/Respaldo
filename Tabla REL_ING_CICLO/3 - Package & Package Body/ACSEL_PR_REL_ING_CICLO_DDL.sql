/*
|| Package y Package Body de la Tabla REL_ING_CICLO
*/

CREATE OR REPLACE 
PACKAGE pr_rel_ing_ciclo AS

FUNCTION N_IDRELING RETURN NUMBER;

PROCEDURE INSERT_RELING ( cpRI IN OUT rel_ing_ciclo%ROWTYPE  );

END PR_rel_ing_ciclo;
/

CREATE OR REPLACE 
PACKAGE BODY pr_rel_ing_ciclo AS


FUNCTION N_IDRELING RETURN NUMBER IS

  nIdRelIng NUMBER;

BEGIN

   SELECT sq_rel_ing_ciclo.NEXTVAL
   INTO   nIdRelIng
   FROM   DUAL;

   RETURN ( nIdRelIng ) ;

END N_IDRELING;

PROCEDURE INSERT_RELING ( cpRI IN OUT rel_ing_ciclo%ROWTYPE  ) IS

BEGIN

   cpRi.IdRelIng := pr_rel_ing_ciclo.N_IDRELING;

  BEGIN
   INSERT INTO REL_ING_CICLO
           ( idreling, numreling, stsreling, stsrelingnvo, codofiing, codcaja,
             codcajero, fecstsreling, fecstsrelingnvo, horareling, nomterreling,
             numacrefalt, numobligsobr, codmotvanul, textmotvanul,
             numing, numrelingtemp, tipoid, numid, dvid,
             codmoneda, mtomoramoneda, mtoppagomoneda, indingoch,
             codcia, indweb, ideciecaja, numobligrelpago, tipodml,
             codusrdml, fecdml,envuser_host, envuser_os_user, envuser_ip_address )
   VALUES  ( cpRi.idreling, cpRi.numreling, cpRi.stsreling, cpRi.stsrelingnvo, cpRi.codofiing, cpRi.codcaja,
             cpRi.codcajero, cpRi.fecstsreling, cpRi.fecstsrelingnvo, cpRi.horareling, cpRi.nomterreling,
             cpRi.numacrefalt, cpRi.numobligsobr, cpRi.codmotvanul, cpRi.textmotvanul,
             cpRi.numing, cpRi.numrelingtemp, cpRi.tipoid, cpRi.numid, cpRi.dvid,
             cpRi.codmoneda, cpRi.mtomoramoneda, cpRi.mtoppagomoneda, cpRi.indingoch,
             cpRi.codcia, cpRi.indweb, cpRi.ideciecaja, cpRi.numobligrelpago, cpRi.tipodml,
             SYS_CONTEXT('USERENV','CURRENT_USER'), NVL(cpRi.FecDml,SYSDATE),
             SYS_CONTEXT('USERENV','HOST'),SYS_CONTEXT('USERENV','OS_USER'),
             SYS_CONTEXT('USERENV','IP_ADDRESS'));
   EXCEPTION
     WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,' RELING '||cpRi.numreling||' '||SQLERRM);
   END;


END INSERT_RELING;

END pr_rel_ing_ciclo;
/


