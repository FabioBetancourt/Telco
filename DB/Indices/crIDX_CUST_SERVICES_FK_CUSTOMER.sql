/************************************************************************************
    Descripción: OBJECT IN CHARGE OF IMPROVING THE QUERY IN THE CUSTOMER_SERVICE TABLE FK_ID_CUSTOMER FIELD
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

CREATE INDEX IDX_CUST_SERVICES_FK_CUSTOMER ON APP_DISCOUNT_TELCO.CUSTOMER_SERVICES(FK_ID_CUSTOMER);