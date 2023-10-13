/***************************************************************************************************************
Description: FOREING KEY TO RELATIONET TABLE CUSTOMER_SERVICE WITH TABLE BILLING
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

ALTER TABLE APP_DISCOUNT_TELCO.BILLING ADD CONSTRAINT FK_BILLING_FK_ID_SERVICE_CUSTOMER FOREIGN KEY (FK_ID_SERVICE_CUSTOMER) REFERENCES CUSTOMER_SERVICES(ID_CUSTOMER_SERVICE);

