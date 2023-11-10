/***************************************************************************************************************
Description: The table in charge of storing billing information customers for a telecommunications company
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/


CREATE TABLE APP_DISCOUNT_TELCO.BILLING(
	ID_BILLING NUMBER NOT NULL,
	VALUE NUMBER(12,2) NOT NULL,
	DISCOUNT NUMBER(3),
	VALUE_DISCOUNT NUMBER(10, 2) NOT NULL,
	DISCOUNT_END_DATE DATE
);


COMMENT ON TABLE BILLING IS 'Table that records customer payment information';

COMMENT ON COLUMN BILLING.ID_BILLING IS 'this is to assign a service-customer with a billing';

COMMENT ON COLUMN BILLING.PAYMENT_STATUS IS 'this is to show a status about payment';

COMMENT ON COLUMN BILLING.PAYMENT_DATE IS 'date to reference a date about the payment';

COMMENT ON COLUMN BILLING.VALUE IS 'value to pay, this value come from table service';

COMMENT ON COLUMN BILLING.DISCOUNT IS 'valuE to show if exist discount or no';

COMMENT ON COLUMN BILLING.VALUE_DISCOUNT IS 'value to show the total, value-discount';

COMMENT ON COLUMN BILLING.DISCOUNT_END_DATE IS 'date that says when the discount ends';


/************************************************************************************
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15-10-2023    TCGB24         FABIO BETANCOURT        ASSIGN DEFAULT AT DISCOUNT LIKE 0  
    
    *************************************************************************************/
ALTER TABLE APP_DISCOUNT_TELCO.BILLING MODIFY DISCOUNT DEFAULT 0;

/************************************************************************************
    ------------------------------------------------------------------------------------
    Historial de modificaciones=>
    Fecha         Orden          Persona                 Acción        
    ------------------------------------------------------------------------------------
    15-10-2023    TCGB24         FABIO BETANCOURT        DELETE UNECESARY ATTRIBUTES      
    
    *************************************************************************************/
ALTER TABLE APP_DISCOUNT_TELCO.BILLING DROP COLUMN PAYMENT_STATUS;
ALTER TABLE APP_DISCOUNT_TELCO.BILLING DROP COLUMN PAYMENT_DATE;

