/************************************************************************************
Descripción: OBJECT RESPONSIBLE FOR DEFINING THE INFORMATION REQUIRED FOR A CUSTOMER
Autor:       FABIO BETANCOURT
Fecha:       18/10/2023
IdGestión:   TCGB24
************************************************************************************/

CREATE OR REPLACE TYPE APP_DISCOUNT_TELCO.TYRC_CUSTOMER AS OBJECT
(
	DOCUMENT NUMBER,
	FIRST_NAME VARCHAR2(50),
	LAST_NAME VARCHAR2(50),
	EMAIL VARCHAR2(100),
	PHONE_NUMBER VARCHAR2(20),
	ADDRESS VARCHAR2(150)
);