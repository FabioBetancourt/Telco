/***************************************************************************************************************
Description: The table in charge of storing the company's services information for a telecommunications company
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

CREATE TABLE APP_DISCOUNT_TELCO.SERVICES (
	ID_SERVICE NUMBER,
	SERVICE_NAME VARCHAR2(100) NOT NULL,
	PRICE NUMBER(12,2) NOT NULL,
	INCORPORATION_DATE DATE,
	STATUS VARCHAR2(10)
);


COMMENT ON TABLE SERVICES IS 'Table to store companys service information';

COMMENT ON COLUMN SERVICES.ID_SERVICE IS 'id autoincrement to identify a service in the database';

COMMENT ON COLUMN SERVICES.SERVICE_NAME IS 'name that describes the service';

COMMENT ON COLUMN SERVICES.PRICE IS 'price of the service, maximum 10 digits and 2 decimals after the comma';

COMMENT ON COLUMN SERVICES.INCORPORATION_DATE IS 'date on which the service was registered';

COMMENT ON COLUMN SERVICES.STATUS IS 'service status like activo/inactivo';

