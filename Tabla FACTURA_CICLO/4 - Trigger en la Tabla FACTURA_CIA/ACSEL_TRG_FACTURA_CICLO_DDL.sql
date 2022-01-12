/*
|| Trigger TRG_FACTURA_CICLO en la Tabla FACTURA_CIA
*/

CREATE OR REPLACE TRIGGER trg_factura_ciclo
 AFTER
  INSERT OR DELETE OR UPDATE
 ON factura_cia
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE

  cRowFA FACTURA_CICLO%ROWTYPE := NULL;

BEGIN

 IF INSERTING THEN
    cRowFA.TipoDml    := 'I';
    cRowFA.stsfact    := :NEW.stsfact;
    cRowFA.stsfactnvo := :NEW.stsfact;
    cRowFA.fecsts     := :NEW.fecsts;
    cRowFA.fecstsnvo  := :NEW.fecsts;
 ELSIF UPDATING THEN
    cRowFA.TipoDml    := 'U';
    cRowFA.stsfact    := :OLD.stsfact;
    cRowFA.stsfactnvo := :NEW.stsfact;
    cRowFA.fecsts     := :OLD.fecsts;
    cRowFA.fecstsnvo  := :NEW.fecsts;
 ELSIF DELETING THEN
    cRowFA.idefact       := :OLD.idefact;       cRowFA.codfact       := :OLD.codfact;      
    cRowFA.numfact       := :OLD.numfact;       cRowFA.tipoid        := :OLD.tipoid;        
    cRowFA.numid         := :OLD.numid;         cRowFA.dvid          := :OLD.dvid; 
    cRowFA.codmoneda     := :OLD.codmoneda;     cRowFA.mtofactlocal  := :OLD.mtofactlocal; 
    cRowFA.codinter      := :OLD.codinter;      cRowFA.mtofactmoneda := :OLD.mtofactmoneda;
    cRowFA.stsfact       := :OLD.stsfact;       cRowFA.stsfactnvo    := :OLD.stsfact;   
    cRowFA.fecsts        := :OLD.fecsts;        cRowFA.fecstsnvo     := :OLD.fecsts;        
    cRowFA.codofifact    := :OLD.codofifact;    cRowFA.tipocobrador  := :OLD.tipocobrador; 
    cRowFA.codcobrador   := :OLD.codcobrador;   cRowFA.fecvencfact   := :OLD.fecvencfact;  
    cRowFA.codciafinc    := :OLD.codciafinc;    cRowFA.numreling     := :OLD.numreling;     
    cRowFA.codmotvanul   := :OLD.codmotvanul;   cRowFA.textmotvanul  := :OLD.textmotvanul;
    cRowFA.fecanul       := :OLD.fecanul;       cRowFA.codcondcobro  := :OLD.codcondcobro; 
    cRowFA.fecnotif      := :OLD.fecnotif;      cRowFA.numrelingnot  := :OLD.numrelingnot;  
    cRowFA.zonapostal    := :OLD.zonapostal;    cRowFA.zonacobro     := :OLD.zonacobro; 
    cRowFA.fecproxvisita := :OLD.fecproxvisita; cRowFA.proxmovin     := :OLD.proxmovin;    
    cRowFA.numrelcob     := :OLD.numrelcob;     cRowFA.numoper       := :OLD.numoper;       
    cRowFA.codcia        := :OLD.codcia;        cRowFA.idefactpol    := :OLD.idefactpol; 
    cRowFA.porcptopago   := :OLD.porcptopago;
 END IF;

 IF INSERTING OR UPDATING THEN
    cRowFA.TipoDml       := 'D';
    cRowFA.idefact       := :OLD.idefact;       cRowFA.codfact       := :OLD.codfact;      
    cRowFA.numfact       := :OLD.numfact;       cRowFA.tipoid        := :OLD.tipoid;        
    cRowFA.numid         := :OLD.numid;         cRowFA.dvid          := :OLD.dvid; 
    cRowFA.codmoneda     := :OLD.codmoneda;     cRowFA.mtofactlocal  := :OLD.mtofactlocal; 
    cRowFA.codinter      := :OLD.codinter;      cRowFA.mtofactmoneda := :OLD.mtofactmoneda;
    cRowFA.codofifact    := :OLD.codofifact;    cRowFA.tipocobrador  := :OLD.tipocobrador; 
    cRowFA.codcobrador   := :OLD.codcobrador;   cRowFA.fecvencfact   := :OLD.fecvencfact;  
    cRowFA.codciafinc    := :OLD.codciafinc;    cRowFA.numreling     := :OLD.numreling;     
    cRowFA.codmotvanul   := :OLD.codmotvanul;   cRowFA.textmotvanul  := :OLD.textmotvanul;
    cRowFA.fecanul       := :OLD.fecanul;       cRowFA.codcondcobro  := :OLD.codcondcobro; 
    cRowFA.fecnotif      := :OLD.fecnotif;      cRowFA.numrelingnot  := :OLD.numrelingnot;  
    cRowFA.zonapostal    := :OLD.zonapostal;    cRowFA.zonacobro     := :OLD.zonacobro; 
    cRowFA.fecproxvisita := :OLD.fecproxvisita; cRowFA.proxmovin     := :OLD.proxmovin;    
    cRowFA.numrelcob     := :OLD.numrelcob;     cRowFA.numoper       := :OLD.numoper;       
    cRowFA.codcia        := :OLD.codcia;        cRowFA.idefactpol    := :OLD.idefactpol; 
    cRowFA.porcptopago   := :OLD.porcptopago;
 END IF;

  PR_FACTURA_CICLO.INSERT_FACTURA ( cRowFA );

EXCEPTION
  WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,'Factura '||:NEW.IdeFact||' '||sqlerrm);
END;
/


