CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_APP_CREATE_CUSTOMER AS
/****************************************************************************************/
	--procedure with param TYRC_CUSTOMER look folder "types"
	PROCEDURE create_CUSTOMER(iCustomer IN TYRC_CUSTOMER) IS 
		customer PKG_CREATE_CUSTOMER.tyrcCUSTOMER;
		custom_exception EXCEPTION;
	
	BEGIN
		customer.DOCUMENT := iCustomer.DOCUMENT;
    	customer.FIRST_NAME := iCustomer.FIRST_NAME;
    	customer.LAST_NAME := iCustomer.LAST_NAME;
    	customer.EMAIL := iCustomer.EMAIL;
    	customer.PHONE_NUMBER := iCustomer.PHONE_NUMBER;
    	customer.ADDRESS := iCustomer.ADDRESS;
    
    	PKG_CREATE_CUSTOMER.insCUSTOMER(customer);
    
    EXCEPTION
    	WHEN custom_exception THEN
    		raise_application_error(-20001, 'Custom error');
    	WHEN OTHERS THEN 
    		raise_application_error(SQLCODE, SQLERRM, TRUE);
	END create_CUSTOMER;
/******************************************************************************************/



/******************************************************************************************/
   
   
   
END PKG_APP_CREATE_CUSTOMER;
