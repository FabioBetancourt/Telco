/************************************************************************************
    Descripción: OBJECT IN CHARGE OF IMPROVING THE QUERY IN THE BILLING TABLE DISCOUNT FIELD
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

CREATE INDEX IDX_BILLING_DISCOUNT ON APP_DISCOUNT_TELCO.BILLING(DISCOUNT);
