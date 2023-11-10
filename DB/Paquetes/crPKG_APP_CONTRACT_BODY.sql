CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_APP_CONTRACT AS
/****************************************************************************************/
	--procedure with param TYRC_CUSTOMER_SERVICES look folder "types"
	PROCEDURE create_CUSTOMER_SERVICE(iCustomerService IN TYRC_CUSTOMER_SERVICES) IS 
		contract PKG_CREATE_BILLING.tyrcCUSTOMER_SERVICES;
		custom_exception EXCEPTION;
	
	BEGIN
		contract.FK_ID_CUSTOMER := iCustomerService.FK_ID_CUSTOMER;
    	contract.FK_ID_SERVICE := iCustomerService.FK_ID_SERVICE;
    
    	PKG_CREATE_BILLING.insCUSTOMER_SERVICES(contract);
    
    EXCEPTION
    	WHEN custom_exception THEN
    		raise_application_error(-20001, 'Custom error');
    	WHEN OTHERS THEN 
    		raise_application_error(SQLCODE, SQLERRM, TRUE);
	END create_CUSTOMER_SERVICE;
/******************************************************************************************/
END PKG_APP_CONTRACT;