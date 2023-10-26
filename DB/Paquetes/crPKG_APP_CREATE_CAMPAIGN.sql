CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_APP_CREATE_CAMPAIGN AS
/************************************************************************************
    Descripción: public object in charge of CREATE OR READ a CAMPAIGN
    Autor:       FABIO BETANCOURT
    Fecha:       25/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    25/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

/************************************************************************************
    Descripción: public object in charge of creating a CAMPAIGN
    Autor:       FABIO BETANCOURT
    Fecha:       25/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    25/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/


	PROCEDURE create_CAMPAIGN(iCampaign IN TYRC_CAMPAIGN);



END PKG_APP_CREATE_CAMPAIGN;