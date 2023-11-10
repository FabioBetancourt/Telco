/************************************************************************************
    Descripción: object responsible for create/read a customer
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/
CREATE OR REPLACE PACKAGE APP_DISCOUNT_TELCO.PKG_CREATE_CUSTOMER AS
	/************************************************************************************
    Descripción: object responsible for creating a client
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
    SUBTYPE tyrcCUSTOMER IS CUSTOMER%rowtype;
    TYPE tytbCUSTOMER IS TABLE OF tyrcCUSTOMER INDEX BY binary_integer;
   

    PROCEDURE insCUSTOMER(iorc IN OUT NOCOPY tyrcCUSTOMER);
   
    /************************************************************************************
    Descripción: object responsible for obtaining a client by id
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/
    PROCEDURE getCUSTOMER_ID(id IN NUMBER, orc OUT NOCOPY tyrcCUSTOMER);
   
   
   /************************************************************************************
    Descripción: object responsible for obtaining a client by document it can be higher than 1 
    Autor:       FABIO BETANCOURT
    Fecha:       18/10/2023
    IdGestión:   TCGB24  
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    18/10/2023    TCGB24         FABIO BETANCOURT       Creation  
    ************************************************************************************/
   

    PROCEDURE getCUSTOMER_DOCUMENT(isbIdDocument IN NUMBER, orc OUT NOCOPY tytbCUSTOMER);
   
   
END PKG_CREATE_CUSTOMER;
