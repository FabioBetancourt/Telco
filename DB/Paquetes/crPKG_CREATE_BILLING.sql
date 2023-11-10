CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_CREATE_BILLING AS
	/************************************************************************************
    Descripción: object responsible for creating a CUSTOMER WITH A SERVICE
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
    SUBTYPE tyrcCUSTOMER_SERVICES IS CUSTOMER_SERVICES%rowtype;
    SUBTYPE tyrcBILLING IS BILLING%rowtype;

    TYPE tytbBILLING IS TABLE OF tyrcBILLING INDEX BY binary_integer;
   

    PROCEDURE insCUSTOMER_SERVICES (iorc IN OUT NOCOPY tyrcCUSTOMER_SERVICES);
   
END PKG_CREATE_BILLING;