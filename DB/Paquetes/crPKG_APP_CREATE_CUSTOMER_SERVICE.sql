CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_APP_CREATE_CUSTOMER_SERVICE AS
/************************************************************************************
    Descripción: public object in charge of CREATE OR READ a contract relationed with
    			 customer table and service table
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
    Descripción: public object in charge of creating a contract relationed with
    			 customer table and service table
    Autor:       FABIO BETANCOURT
    Fecha:       25/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    25/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/


	PROCEDURE create_CUSTOMER_SERVICE(iCustomerService IN TYRC_CUSTOMER_SERVICES);



END PKG_APP_CREATE_CUSTOMER_SERVICE;