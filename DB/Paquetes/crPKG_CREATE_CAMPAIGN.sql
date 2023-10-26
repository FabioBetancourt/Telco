/************************************************************************************
    Descripción: object responsible for CREATING a campaign in table campaign
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/
CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_CREATE_CAMPAIGN AS
	/************************************************************************************
    Descripción: object responsible for creating a campaign
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/

	/* PUBLIC DATA */
    SUBTYPE tyrcCAMPAIGN IS CAMPAIGN%rowtype;

    TYPE tytbCAMPAIGN IS TABLE OF tyrcCAMPAIGN INDEX BY binary_integer;
   

    PROCEDURE insCAMPAIGN(iorc IN OUT NOCOPY tyrcCAMPAIGN);
   
    /************************************************************************************
    Descripción: object responsible for obtaining a CAMPAIGN by STATUS
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/
    PROCEDURE getCAMPAIGN_STATUS(id_status IN CAMPAIGN.STATUS%TYPE, orc OUT NOCOPY tytbCAMPAIGN);
   
 
   
   
END PKG_CREATE_CAMPAIGN;
