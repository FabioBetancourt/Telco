/************************************************************************************
Descripción: OBJECT RESPONSIBLE FOR DEFINING THE INFORMATION REQUIRED FOR A CUSTOMER
			 BILLING
			 WITH A SERVICE
Autor:       FABIO BETANCOURT
Fecha:       18/10/2023
IdGestión:   TCGB24
************************************************************************************/

CREATE OR REPLACE TYPE APP_DISCOUNT_TELCO.TYRC_BILLING AS OBJECT
(
	ID_BILLING        NUMBER,
    VALUE             NUMBER(12,2),
    DISCOUNT          NUMBER(3),
    VALUE_DISCOUNT    NUMBER(10, 2),
    DISCOUNT_END_DATE DATE
);