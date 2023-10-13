/***************************************************************************************************************
Description: table for the relationship between a client and a service with a contract date
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

CREATE TABLE CUSTOMER_SERVICES (
	ID_SERVICE_CUSTOMER NUMBER PRIMARY KEY NOT NULL,
	FK_ID_CUSTOMER NUMBER NOT NULL,
	FK_ID_SERVICE NUMBER NOT NULL,
	CONTRACT_DATE DATE 
);
	
COMMENT ON TABLE CUSTOMER_SERVICES IS 'table for the relationship between a client and a service';

COMMENT ON COLUMN CUSTOMER_SERVICES.ID_SERVICE_CUSTOMER IS 'id autoincrement to identify a customer-service';

COMMENT ON COLUMN CUSTOMER_SERVICES.FK_ID_CUSTOMER IS 'this is to assign a constraint from id_customer table customer';

COMMENT ON COLUMN CUSTOMER_SERVICES.FK_ID_SERVICE IS 'this is to assign a constraint from id_service table service';

COMMENT ON COLUMN CUSTOMER_SERVICES.CONTRACT_DATE IS 'date to reference the start of the contracted service';


/*  FIRST ALTER TABLE TO ASSIGN DEFAULT VALUE IN CONTRACT_DATE */
ALTER TABLE CUSTOMER_SERVICES MODIFY CONTRACT_DATE DEFAULT SYSDATE;