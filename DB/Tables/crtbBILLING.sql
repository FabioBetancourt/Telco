/***************************************************************************************************************
Description: The table in charge of storing billing information customers for a telecommunications company
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/


CREATE TABLE BILLING(
	ID_BILLING NUMBER PRIMARY KEY NOT NULL,
	FK_ID_SERVICE_CUSTOMER NUMBER NOT NULL,
	PAYMENT_STATUS VARCHAR2(50),
	PAYMENT_DATE DATE,
	VALUE NUMBER(10, 2) NOT NULL,
	DISCOUNT NUMBER(5, 2) NOT NULL,
	VALUE_DISCOUNT NUMBER(10, 2) NOT NULL
);


COMMENT ON TABLE BILLING IS 'Table that records customer payment information';

COMMENT ON COLUMN BILLING.ID_BILLING IS 'id autoincrement to identify a customer billing';

COMMENT ON COLUMN BILLING.FK_ID_SERVICE_CUSTOMER IS 'this is to assign a service-customer with a billing';

COMMENT ON COLUMN BILLING.PAYMENT_STATUS IS 'this is to show a status about payment';

COMMENT ON COLUMN BILLING.PAYMENT_DATE IS 'date to reference a date about the payment';

COMMENT ON COLUMN BILLING.VALUE IS 'value to pay, this value come from table service';

COMMENT ON COLUMN BILLING.DISCOUNT IS 'valuE to show if exist discount or no';

COMMENT ON COLUMN BILLING.VALUE_DISCOUNT IS 'value to show the total, value-discount';


/*  FIRST ALTER TABLE TO ASSIGN DEFAULT VALUE AT PAYMENT_DATE*/
--  DESCRIPTION: ASSIGN DEFAULT DAY LIKE 28 BUT MM AND YYYY IS CURRENT DATE
ALTER TABLE BILLING MODIFY PAYMENT_DATE DEFAULT TO_DATE(TO_CHAR(SYSDATE, 'MM') || '/28/' || TO_CHAR(SYSDATE, 'YYYY'), 'MM/DD/YYYY');
--  ASSIGN DEFAULT AT DISCOUNT LIKE 0 OR "NO DISCOUNT"
ALTER TABLE BILLING MODIFY DISCOUNT DEFAULT 0;

ALTER TABLE BILLING MODIFY PAYMENT_DATE DEFAULT
