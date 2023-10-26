/************************************************************************************
    Descripción: OBJECT IN CHARGE OF IMPROVING THE QUERY IN THE CUSTOMER TABLE DOCUMENT FIELD
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

CREATE INDEX IDX_CUSTOMER_DOCUMENT ON APP_DISCOUNT_TELCO.CUSTOMER(DOCUMENT);
