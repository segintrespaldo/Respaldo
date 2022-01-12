/*
|| Trigger TRG_ORDEN_PAGO_CICLO sobre la Tabla ORDEN_PAGO_CIA
*/
CREATE OR REPLACE TRIGGER trg_orden_pago_ciclo
 AFTER
  INSERT OR DELETE OR UPDATE
 ON orden_pago_cia
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE

  cRowOp ORDEN_PAGO_CICLO%ROWTYPE := NULL;

BEGIN

 IF INSERTING THEN
    cRowOp.TipoDml         := 'I';
    cRowOp.stsordenpago    := :NEW.stsordenpago;
    cRowOp.stsordenpagonvo := :NEW.stsordenpago;
 ELSIF UPDATING THEN
    cRowOp.TipoDml         := 'U';
    cRowOp.stsordenpago    := :OLD.stsordenpago;
    cRowOp.stsordenpagonvo := :NEW.stsordenpago;
 ELSIF DELETING THEN
    cRowOp.idepago          := :OLD.idepago;       cRowOp.codordenpago  := :OLD.codordenpago; 
    cRowOp.numordenpago     := :OLD.numordenpago;  cRowOp.codmoneda     := :OLD.codmoneda;
    cRowOp.mtopagolocal     := :OLD.mtopagolocal;  cRowOp.mtopagomoneda := :OLD.mtopagomoneda; 
    cRowOp.numrelegre       := :OLD.numrelegre;    cRowOp.numoblig      := :OLD.numoblig;
    cRowOp.stsordenpago     := :OLD.stsordenpago;  cRowOp.codmotvanul   := :OLD.codmotvanul; 
    cRowOp.textomotvanul    := :OLD.textomotvanul; cRowOp.fecanul       := :OLD.fecanul;
    cRowOp.codcia           := :OLD.codcia;        cRowOp.fecemi        := :OLD.fecemi;
    cRowOp.stsordenpagonvo  := :OLD.stsordenpago;
 END IF;

 IF INSERTING OR UPDATING THEN
    cRowOp.idepago          := :OLD.idepago;       cRowOp.codordenpago  := :OLD.codordenpago; 
    cRowOp.numordenpago     := :OLD.numordenpago;  cRowOp.codmoneda     := :OLD.codmoneda;
    cRowOp.mtopagolocal     := :OLD.mtopagolocal;  cRowOp.mtopagomoneda := :OLD.mtopagomoneda; 
    cRowOp.numrelegre       := :OLD.numrelegre;    cRowOp.numoblig      := :OLD.numoblig;
    cRowOp.codmotvanul      := :OLD.codmotvanul;   cRowOp.textomotvanul := :OLD.textomotvanul; 
    cRowOp.fecanul          := :OLD.fecanul;       cRowOp.codcia        := :OLD.codcia;        
    cRowOp.fecemi           := :OLD.fecemi;
 END IF;

  PR_ORDEN_PAGO_CICLO.INSERT_ORDEN_PAGO ( cRowOp );

EXCEPTION
  WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,'Orden_Pago '||:NEW.numordenpago||' '||sqlerrm);
END;
/


