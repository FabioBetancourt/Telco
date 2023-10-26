CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_APP_CREATE_CUSTOMER AS
/************************************************************************************
    Descripción: public object in charge of CREATE OR READ a client
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
    Descripción: public object in charge of creating a client
    Autor:       FABIO BETANCOURT
    Fecha:       25/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    25/10/2023    TCGB24         FABIO BETANCOURT       Creación  
    ************************************************************************************/


	PROCEDURE create_CUSTOMER(iCustomer IN TYRC_CUSTOMER);


END PKG_APP_CREATE_CUSTOMER;



