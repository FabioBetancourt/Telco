 /************************************************************************************
    Descripción: object in charge of handling all the logic necessary for discounts
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.DISCOUNT_PACKAGE AS

 /************************************************************************************
    Descripción: object in charge of verifying which clients meet the discount condition and applying them to the billing table
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/

    PROCEDURE APPLY_DISCOUNTS;
   
    /************************************************************************************
    Descripción: object in charge of resetting the discount date of customers who have already completed their 
    			 6 months and setting the discounted value to its normal value.
    Autor:       FABIO BETANCOURT
    Fecha:       15/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/
    PROCEDURE RESET_EXPIRED_DISCOUNTS;
   
END DISCOUNT_PACKAGE;