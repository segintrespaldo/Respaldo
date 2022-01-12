/*
|| Trigger TRG_OBLIGACION_CICLO sobre la Tabla OBLIGACION_CIA
*/
CREATE OR REPLACE TRIGGER trg_obligacion_ciclo
 AFTER
  INSERT OR DELETE OR UPDATE
 ON obligacion_cia
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE

  cRowOB OBLIGACION_CICLO%ROWTYPE := NULL;

BEGIN

 IF INSERTING THEN
    cRowOB.TipoDml     := 'I';
    cRowOB.stsoblig    := :NEW.stsoblig;
    cRowOB.stsoblignvo := :NEW.stsoblig;
    cRowOB.fecsts      := :NEW.fecsts;
    cRowOB.fecstsnvo   := :NEW.fecsts;
 ELSIF UPDATING THEN
    cRowOB.TipoDml     := 'U';
    cRowOB.stsoblig    := :OLD.stsoblig;
    cRowOB.stsoblignvo := :NEW.stsoblig;
    cRowOB.fecsts      := :OLD.fecsts;
    cRowOB.fecstsnvo   := :NEW.fecsts;
 ELSIF DELETING THEN
       cRowOB.numoblig           := :OLD.numoblig;           cRowOB.tipoid              := :OLD.tipoid; 
       cRowOB.numid              := :OLD.numid;              cRowOB.dvid                := :OLD.dvid;               
       cRowOB.tipooblig          := :OLD.tipooblig;          cRowOB.stsoblig            := :OLD.stsoblig;
       cRowOB.fecsts             := :OLD.fecsts;             cRowOB.fecgtiapago         := :OLD.fecgtiapago;
       cRowOB.fecstsnvo          := :OLD.fecsts;             cRowOB.stsoblignvo         := :OLD.stsoblig;
       /*cRowOB.textoblig          := :OLD.textoblig;*/      cRowOB.codmoneda           := :OLD.codmoneda;
       cRowOB.numprto            := :OLD.numprto;            cRowOB.numfracprto         := :OLD.numfracprto; 
       cRowOB.mtonetoobliglocal  := :OLD.mtonetoobliglocal;  cRowOB.mtobrutoobligmoneda := :OLD.mtobrutoobligmoneda; 
       cRowOB.mtonetoobligmoneda := :OLD.mtonetoobligmoneda; cRowOB.mtobrutoobliglocal  := :OLD.mtobrutoobliglocal; 
       cRowOB.dptoemi            := :OLD.dptoemi;            cRowOB.sldoobliglocal      := :OLD.sldoobliglocal; 
       cRowOB.sldoobligmoneda    := :OLD.sldoobligmoneda;    cRowOB.idesin              := :OLD.idesin; 
       cRowOB.codinterlider      := :OLD.codinterlider;      cRowOB.numreling           := :OLD.numreling;
       cRowOB.tipoprov           := :OLD.tipoprov;           cRowOB.idenotacred         := :OLD.idenotacred; 
       cRowOB.numoper            := :OLD.numoper;            cRowOB.indpago             := :OLD.indpago; 
       cRowOB.usuautpago         := :OLD.usuautpago;         cRowOB.instpago            := :OLD.instpago;
       cRowOB.nrocuenta          := :OLD.nrocuenta;          cRowOB.indpripago          := :OLD.indpripago; 
       cRowOB.codcia             := :OLD.codcia;             cRowOB.indeli              := :OLD.indeli; 
       cRowOB.fecemi             := :OLD.fecemi;             cRowOB.indpresupuesto      := :OLD.indpresupuesto;
       cRowOB.referencia         := :OLD.referencia;         cRowOB.codusrrev           := :OLD.codusrrev;
       cRowOB.numfact            := :OLD.numfact;            cRowOB.numctrolfact        := :OLD.numctrolfact; 
       cRowOB.fecfact            := :OLD.fecfact;            cRowOB.fecrecpfact         := :OLD.fecrecpfact;        
       cRowOB.tipoidter          := :OLD.tipoidter;          cRowOB.numidter            := :OLD.numidter; 
       cRowOB.dvidter            := :OLD.dvidter;
 END IF;

 IF INSERTING OR UPDATING THEN
       cRowOB.numoblig           := :OLD.numoblig;           cRowOB.tipoid              := :OLD.tipoid; 
       cRowOB.numid              := :OLD.numid;              cRowOB.dvid                := :OLD.dvid;               
       cRowOB.tipooblig          := :OLD.tipooblig;          cRowOB.stsoblig            := :OLD.stsoblig;
       cRowOB.fecsts             := :OLD.fecsts;             cRowOB.fecgtiapago         := :OLD.fecgtiapago;
       /*cRowOB.textoblig          := :OLD.textoblig;*/      cRowOB.codmoneda           := :OLD.codmoneda;
       cRowOB.numprto            := :OLD.numprto;            cRowOB.numfracprto         := :OLD.numfracprto; 
       cRowOB.mtonetoobliglocal  := :OLD.mtonetoobliglocal;  cRowOB.mtobrutoobligmoneda := :OLD.mtobrutoobligmoneda; 
       cRowOB.mtonetoobligmoneda := :OLD.mtonetoobligmoneda; cRowOB.mtobrutoobliglocal  := :OLD.mtobrutoobliglocal; 
       cRowOB.dptoemi            := :OLD.dptoemi;            cRowOB.sldoobliglocal      := :OLD.sldoobliglocal; 
       cRowOB.sldoobligmoneda    := :OLD.sldoobligmoneda;    cRowOB.idesin              := :OLD.idesin; 
       cRowOB.codinterlider      := :OLD.codinterlider;      cRowOB.numreling           := :OLD.numreling;
       cRowOB.tipoprov           := :OLD.tipoprov;           cRowOB.idenotacred         := :OLD.idenotacred; 
       cRowOB.numoper            := :OLD.numoper;            cRowOB.indpago             := :OLD.indpago; 
       cRowOB.usuautpago         := :OLD.usuautpago;         cRowOB.instpago            := :OLD.instpago;
       cRowOB.nrocuenta          := :OLD.nrocuenta;          cRowOB.indpripago          := :OLD.indpripago; 
       cRowOB.codcia             := :OLD.codcia;             cRowOB.indeli              := :OLD.indeli; 
       cRowOB.fecemi             := :OLD.fecemi;             cRowOB.indpresupuesto      := :OLD.indpresupuesto;
       cRowOB.referencia         := :OLD.referencia;         cRowOB.codusrrev           := :OLD.codusrrev;
       cRowOB.numfact            := :OLD.numfact;            cRowOB.numctrolfact        := :OLD.numctrolfact; 
       cRowOB.fecfact            := :OLD.fecfact;            cRowOB.fecrecpfact         := :OLD.fecrecpfact;        
       cRowOB.tipoidter          := :OLD.tipoidter;          cRowOB.numidter            := :OLD.numidter; 
       cRowOB.dvidter            := :OLD.dvidter;
 END IF;

  PR_OBLIGACION_CICLO.INSERT_OBLIGACION ( cRowOB );

EXCEPTION
  WHEN OTHERS THEN
       RAISE_APPLICATION_ERROR(-20100,'Obligacion '||:NEW.NumOblig||' '||sqlerrm);
END;
/


