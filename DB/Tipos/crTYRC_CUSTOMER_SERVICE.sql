/************************************************************************************
Descripción: OBJECT RESPONSIBLE FOR DEFINING THE INFORMATION REQUIRED FOR A CUSTOMER 
			 WITH A SERVICE
Autor:       FABIO BETANCOURT
Fecha:       18/10/2023
IdGestión:   TCGB24
************************************************************************************/

CREATE OR REPLACE TYPE APP_DISCOUNT_TELCO.TYRC_CUSTOMER_SERVICES AS OBJECT
(
	FK_ID_CUSTOMER NUMBER,
	FK_ID_SERVICE NUMBER
);