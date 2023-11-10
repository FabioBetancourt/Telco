CREATE OR REPLACE PACKAGE BODY DISCOUNT_PACKAGE AS

/***************************************************************************************************************************/
    PROCEDURE APPLY_DISCOUNTS IS
        v_service_count NUMBER;  --DECLARE variable 
    BEGIN
	    --select in campaign table where status = 'activo'
        FOR camp IN (SELECT ID_CAMPAIGN, CUSTOMER_SENIORITY, DISCOUNT, NUMBER_OF_SERVICES
                     FROM APP_DISCOUNT_TELCO.CAMPAIGN
                     WHERE STATUS = 'activo') LOOP
			
            FOR cust_service IN (--Do you have the required seniority of customer_seniority?
                SELECT cs.FK_ID_CUSTOMER, cs.ID_CUSTOMER_SERVICE
                FROM APP_DISCOUNT_TELCO.CUSTOMER_SERVICES cs
                WHERE MONTHS_BETWEEN(SYSDATE, cs.CONTRACT_DATE) >= camp.CUSTOMER_SENIORITY*12
            ) LOOP

                BEGIN
                    SELECT COUNT(*)
                    INTO v_service_count
                    FROM APP_DISCOUNT_TELCO.CUSTOMER_SERVICES
                    WHERE FK_ID_CUSTOMER = cust_service.FK_ID_CUSTOMER
                    AND MONTHS_BETWEEN(SYSDATE, CONTRACT_DATE) >= camp.CUSTOMER_SENIORITY*12;
                END;

                IF v_service_count = camp.NUMBER_OF_SERVICES THEN
                    -- Apply the discount only to invoices for services that meet the required age
                    UPDATE APP_DISCOUNT_TELCO.BILLING b
                    SET DISCOUNT = camp.DISCOUNT,
                        VALUE_DISCOUNT = (b.VALUE * ((100-camp.DISCOUNT)/100)),
                        DISCOUNT_END_DATE = ADD_MONTHS(SYSDATE, 6) -- It will only last 6 months
                    WHERE b.ID_BILLING  = cust_service.ID_CUSTOMER_SERVICE;
                END IF;
            END LOOP;
        END LOOP;
       
       EXCEPTION  --handling important exceptions
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20003, 'No data found for the given criteria.');
        WHEN TOO_MANY_ROWS THEN
            raise_application_error(-20004, 'Multiple rows found when only one was expected.');
       	WHEN VALUE_ERROR THEN
            raise_application_error(-20005, 'A value error occurred.');
        WHEN DUP_VAL_ON_INDEX THEN
            raise_application_error(-20006, 'Attempted to insert a duplicate value.');
        WHEN OTHERS THEN
            raise_application_error(-20002, 'Error in APPLY_DISCOUNTS: ' || SQLERRM);
    END APPLY_DISCOUNTS;
/********************************************************************************************************************************/
    PROCEDURE RESET_EXPIRED_DISCOUNTS IS --normalizes the invoice price after time has passed
	BEGIN
    	UPDATE APP_DISCOUNT_TELCO.BILLING b
    	SET DISCOUNT = 0, 
        	VALUE_DISCOUNT = b.VALUE 
    	WHERE DISCOUNT_END_DATE < SYSDATE;
	 EXCEPTION 
        WHEN OTHERS THEN
            raise_application_error(-20007, 'Error in RESET_EXPIRED_DISCOUNTS: ' || SQLERRM);
    END RESET_EXPIRED_DISCOUNTS;
/*******************************************************************************************************************************/
END DISCOUNT_PACKAGE;
