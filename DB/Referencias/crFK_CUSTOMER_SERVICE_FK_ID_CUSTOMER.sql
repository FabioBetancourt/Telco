/***************************************************************************************************************
Description: FOREING KEY TO RELATIONET TABLE CUSTOMER WITH TABLE CUSTOMER-SERVICE
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

ALTER TABLE APP_DISCOUNT_TELCO.CUSTOMER_SERVICES ADD CONSTRAINT FK_CS_FK_ID_CUSTOMER FOREIGN KEY (FK_ID_CUSTOMER) REFERENCES CUSTOMER(ID_CUSTOMER);




