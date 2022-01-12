/*
|| Trigger TRG_REL_ING_CICLO en la Tabla REL_ING_CIA
*/

CREATE OR REPLACE TRIGGER trg_rel_ing_ciclo
 AFTER
  INSERT OR DELETE OR UPDATE
 ON rel_ing_cia
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE

  cRowRI REL_ING_CICLO%ROWTYPE := NULL;

BEGIN

 IF INSERTING THEN
    cRowRI.TipoDml         := 'I';
    cRowRI.stsreling       := :NEW.stsreling;
    cRowRI.stsrelingnvo    := :NEW.stsreling;
    cRowRI.fecstsreling    := :NEW.fecstsreling;
    cRowRI.fecstsrelingnvo := :NEW.fecstsreling;
 ELSIF UPDATING THEN
    cRowRI.TipoDml         := 'U';
    cRowRI.stsreling       := :OLD.stsreling;
    cRowRI.stsrelingnvo    := :NEW.stsreling;
    cRowRI.fecstsreling    := :OLD.fecstsreling;
    cRowRI.fecstsrelingnvo := :NEW.fecstsreling;
 ELSIF DELETING THEN
    cRowRI.TipoDml        := 'D';
    cRowRI.numreling      := :OLD.numreling;     cRowRI.stsreling       := :OLD.stsreling; 
    cRowRI.stsrelingnvo   := :OLD.stsreling;     cRowRI.codofiing       := :OLD.codofiing;    
    cRowRI.codcaja        := :OLD.codcaja;       cRowRI.codcajero       := :OLD.codcajero; 
    cRowRI.fecstsreling   := :OLD.fecstsreling;  cRowRI.fecstsrelingnvo := :OLD.fecstsreling;
    cRowRI.horareling     := :OLD.horareling;    cRowRI.nomterreling    := :OLD.nomterreling;
    cRowRI.numacrefalt    := :OLD.numacrefalt;   cRowRI.numobligsobr    := :OLD.numobligsobr; 
    cRowRI.codmotvanul    := :OLD.codmotvanul;   cRowRI.textmotvanul    := :OLD.textmotvanul;
    cRowRI.numing         := :OLD.numing;        cRowRI.numrelingtemp   := :OLD.numrelingtemp; 
    cRowRI.tipoid         := :OLD.tipoid;        cRowRI.numid           := :OLD.numid; 
    cRowRI.dvid           := :OLD.dvid;          cRowRI.codmoneda       := :OLD.codmoneda;
    cRowRI.mtomoramoneda  := :OLD.mtomoramoneda; cRowRI.mtoppagomoneda  := :OLD.mtoppagomoneda; 
    cRowRI.indingoch      := :OLD.indingoch;     cRowRI.codcia          := :OLD.codcia;
    cRowRI.indweb         := :OLD.indweb;        cRowRI.ideciecaja      := :OLD.ideciecaja; 
    cRowRI.numobligrelpago:= :OLD.numobligrelpago;         
 END IF;

 IF INSERTING OR UPDATING THEN
    cRowRI.numreling      := :NEW.numreling;     cRowRI.codofiing       := :NEW.codofiing;
    cRowRI.codcaja        := :NEW.codcaja;       cRowRI.codcajero       := :NEW.codcajero; 
    cRowRI.horareling     := :NEW.horareling;    cRowRI.nomterreling    := :NEW.nomterreling;
    cRowRI.numacrefalt    := :NEW.numacrefalt;   cRowRI.numobligsobr    := :NEW.numobligsobr; 
    cRowRI.codmotvanul    := :NEW.codmotvanul;   cRowRI.textmotvanul    := :NEW.textmotvanul;
    cRowRI.numing         := :NEW.numing;        cRowRI.numrelingtemp   := :NEW.numrelingtemp; 
    cRowRI.tipoid         := :NEW.tipoid;        cRowRI.numid           := :NEW.numid; 
    cRowRI.dvid           := :NEW.dvid;          cRowRI.codmoneda       := :NEW.codmoneda;
    cRowRI.mtomoramoneda  := :NEW.mtomoramoneda; cRowRI.mtoppagomoneda  := :NEW.mtoppagomoneda; 
    cRowRI.indingoch      := :NEW.indingoch;     cRowRI.codcia          := :NEW.codcia;
    cRowRI.indweb         := :NEW.indweb;        cRowRI.ideciecaja      := :NEW.ideciecaja; 
    cRowRI.numobligrelpago:= :NEW.numobligrelpago;
 END IF;

  PR_REL_ING_CICLO.INSERT_RELING ( cRowRI );

EXCEPTION
  WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,'NumRelIng '||:NEW.NumRelIng||' '||sqlerrm);
END;
/

