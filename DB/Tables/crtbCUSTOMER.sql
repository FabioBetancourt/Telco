/***************************************************************************************************************
Description: The table in charge of storing the customer's personal information for a telecommunications company
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/

CREATE TABLE CUSTOMER (
	ID_CUSTOMER NUMBER PRIMARY KEY NOT NULL,
	DOCUMENT NUMBER NOT NULL,
	FIRST_NAME VARCHAR2(50) NOT NULL,
	LAST_NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	PHONE_NUMBER VARCHAR2(20) NOT NULL,
	ADDRESS VARCHAR2(150) NOT NULL,
	JOIN_DATE DATE
);


COMMENT ON TABLE CUSTOMER IS 'Table to store customers personal information';

COMMENT ON COLUMN CUSTOMER.ID_CUSTOMER IS 'id autoincrement to identify a customer';

COMMENT ON COLUMN CUSTOMER.DOCUMENT IS 'customers document client like DNI, CC, ID';

COMMENT ON COLUMN CUSTOMER.FIRST_NAME IS 'customers first name';

COMMENT ON COLUMN CUSTOMER.LAST_NAME IS 'customers last name';

COMMENT ON COLUMN CUSTOMER.EMAIL IS 'customers email like code@mail.com';

COMMENT ON COLUMN CUSTOMER.PHONE_NUMBER IS 'customers phone number like 2586975423 or +51 8956985452';

COMMENT ON COLUMN CUSTOMER.ADDRESS IS 'customers residential address';

COMMENT ON COLUMN CUSTOMER.JOIN_DATE IS 'date of customer entry into the database';


/*  FIRST ALTER TABLE TO ASSIGN DEFAULT VALUE IN JOIN_DATE */
ALTER TABLE CUSTOMER MODIFY JOIN_DATE DEFAULT SYSDATE;



