/***************************************************************************************************************
Description: object in charge of referencing a customer with a service in the customer-service table
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

ALTER TABLE APP_DISCOUNT_TELCO.CUSTOMER_SERVICES ADD CONSTRAINT PK_CUSTOMER_SERVICE PRIMARY KEY (ID_CUSTOMER_SERVICE);