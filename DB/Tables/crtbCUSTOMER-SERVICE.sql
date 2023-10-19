/***************************************************************************************************************
Description: table for the relationship between a client and a service with a contract date
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

CREATE TABLE APP_DISCOUNT_TELCO.CUSTOMER_SERVICES (
	ID_CUSTOMER_SERVICE NUMBER,
	FK_ID_CUSTOMER NUMBER NOT NULL,
	FK_ID_SERVICE NUMBER NOT NULL,
	CONTRACT_DATE DATE 
);
	
COMMENT ON TABLE CUSTOMER_SERVICES IS 'table for the relationship between a customer and a service';

COMMENT ON COLUMN CUSTOMER_SERVICES.ID_CUSTOMER_SERVICE IS 'id autoincrement to identify a customer-service';

COMMENT ON COLUMN CUSTOMER_SERVICES.FK_ID_CUSTOMER IS 'this is to assign a constraint from id_customer table customer';

COMMENT ON COLUMN CUSTOMER_SERVICES.FK_ID_SERVICE IS 'this is to assign a constraint from id_service table service';

COMMENT ON COLUMN CUSTOMER_SERVICES.CONTRACT_DATE IS 'date to reference the start of the contracted service';



