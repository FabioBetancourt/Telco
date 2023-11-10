/************************************************************************************
    Descripción: OBJECT RESPONSIBLE FOR IMPROVING THE QUERY IN THE CAMPAIGN TABLE
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

CREATE INDEX IDX_CAMPAIGN_STATUS ON APP_DISCOUNT_TELCO.CAMPAIGN(STATUS);
