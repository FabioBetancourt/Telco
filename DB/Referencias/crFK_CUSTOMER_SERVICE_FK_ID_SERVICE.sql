/***************************************************************************************************************
Description: FOREING KEY TO RELATIONET TABLE SERVICES WITH TABLE CUSTOMER-SERVICE
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

ALTER TABLE APP_DISCOUNT_TELCO.CUSTOMER_SERVICES ADD CONSTRAINT FK_CUSTOMER_SERVICE_FK_ID_SERVICE FOREIGN KEY (FK_ID_SERVICE) REFERENCES SERVICES(ID_SERVICE);