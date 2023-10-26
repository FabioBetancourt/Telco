/************************************************************************************
Descripción: OBJECT RESPONSIBLE FOR DEFINING THE INFORMATION REQUIRED FOR A CAMPAIGN
Autor:       FABIO BETANCOURT
Fecha:       18/10/2023
IdGestión:   TCGB24
************************************************************************************/

CREATE OR REPLACE TYPE APP_DISCOUNT_TELCO.TYRC_CAMPAIGN AS OBJECT
(
	NUMBER_OF_SERVICES NUMBER,
	CUSTOMER_SENIORITY NUMBER,
	DISCOUNT NUMBER(3,0),
	DISCOUNT_START_DATE DATE,
	DISCOUNT_END_DATE DATE
);