/*
|| Trigger TRG_REL_EGRE_CICLO sobre la Tabla REL_EGRE
*/

CREATE OR REPLACE TRIGGER trg_rel_egre_ciclo
 AFTER
  INSERT OR DELETE OR UPDATE
 ON rel_egre_cia
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE

  cRowRe REL_EGRE_CICLO%ROWTYPE := NULL;

BEGIN

 IF INSERTING THEN
    cRowRe.TipoDml       := 'I';
    cRowRe.stsrelegre    := :NEW.stsrelegre;
    cRowRe.stsrelegrenvo := :NEW.stsrelegre;
    cRowRe.fecsts        := :NEW.fecsts;
    cRowRe.fecstsnvo     := :NEW.fecsts;
 ELSIF UPDATING THEN
    cRowRe.TipoDml     := 'U';
    cRowRe.stsrelegre    := :OLD.stsrelegre;
    cRowRe.stsrelegrenvo := :NEW.stsrelegre;
    cRowRe.fecsts        := :OLD.fecsts;
    cRowRe.fecstsnvo     := :NEW.fecsts;
 ELSIF DELETING THEN
       cRowRe.numrelegre    := :OLD.numrelegre;    cRowRe.codcaja     := :OLD.codcaja; 
       cRowRe.codcajero     := :OLD.codcajero;     cRowRe.fecsts      := :OLD.fecsts; 
       cRowRe.horasts       := :OLD.horasts;       cRowRe.stsrelegre  := :OLD.stsrelegre; 
       cRowRe.codofirelegre := :OLD.codofirelegre; cRowRe.tipoid      := :OLD.tipoid; 
       cRowRe.numid         := :OLD.numid;         cRowRe.dvid        := :OLD.dvid;
       /*cRowRe.textrelegre   := :OLD.textrelegre;*/   cRowRe.codmotvanul := :OLD.codmotvanul; 
       cRowRe.textmotvanul  := :OLD.textmotvanul;  cRowRe.fecanul     := :OLD.fecanul;
       cRowRe.indingfin     := :OLD.indingfin;     cRowRe.codcia      := :OLD.codcia;
       cRowRe.stsrelegrenvo := :OLD.stsrelegre;    cRowRe.fecstsnvo   := :OLD.fecsts;
 END IF;

 IF INSERTING OR UPDATING THEN
       cRowRe.numrelegre    := :OLD.numrelegre;    cRowRe.codcaja     := :OLD.codcaja; 
       cRowRe.codcajero     := :OLD.codcajero;     
       cRowRe.horasts       := :OLD.horasts;        
       cRowRe.codofirelegre := :OLD.codofirelegre; cRowRe.tipoid      := :OLD.tipoid; 
       cRowRe.numid         := :OLD.numid;         cRowRe.dvid        := :OLD.dvid;
       /*cRowRe.textrelegre   := :OLD.textrelegre;*/   cRowRe.codmotvanul := :OLD.codmotvanul; 
       cRowRe.textmotvanul  := :OLD.textmotvanul;  cRowRe.fecanul     := :OLD.fecanul;
       cRowRe.indingfin     := :OLD.indingfin;     cRowRe.codcia      := :OLD.codcia;
 END IF;

  PR_REL_EGRE_CICLO.INSERT_REL_EGRE ( cRowRe );

EXCEPTION
  WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,'RelEgreso '||:NEW.NumRelEgre||' '||sqlerrm);
END;
/

