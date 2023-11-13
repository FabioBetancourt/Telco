/************************************************************************************
    Descripción: object responsible for activating every 3 months and calling the discount package and resetting the discount
    Autor:       FABIO BETANCOURT
    Fecha:       6/11/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/


BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'discount_job',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'BEGIN
                          DISCOUNT_PACKAGE.APPLY_DISCOUNTS;
                          DISCOUNT_PACKAGE.RESET_EXPIRED_DISCOUNTS;
                          COMMIT;
                        END;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=MINUTELY; INTERVAL=5', --FREQ=MONTHLY; INTERVAL=3'
    end_date        => NULL,
    enabled         => TRUE,
    comments        => 'Job to apply and reset discounts every three months.'
  );
END;





