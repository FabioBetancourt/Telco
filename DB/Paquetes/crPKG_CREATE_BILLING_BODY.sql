CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_CREATE_BILLING AS

	PROCEDURE insCUSTOMER_SERVICES (iorc IN OUT nocopy tyrcCUSTOMER_SERVICES) IS 
	
		v_customer_id CUSTOMER_SERVICES.FK_ID_CUSTOMER%TYPE;
		v_service_id CUSTOMER_SERVICES.FK_ID_SERVICE%TYPE;
		v_service_value SERVICES.PRICE%TYPE;
		v_exists NUMBER;
	
		BEGIN  
			-- Verificar si el cliente ya tiene el servicio contratado
		    SELECT COUNT(*)
		    INTO v_exists
		    FROM CUSTOMER_SERVICES
		    WHERE FK_ID_CUSTOMER = iorc.FK_ID_CUSTOMER
		    AND FK_ID_SERVICE = iorc.FK_ID_SERVICE;
		    
		    IF v_exists > 0 THEN
		        raise_application_error(-20013, 'El cliente ya tiene contratado este servicio.');
		    END IF;
		   
			--initial values
			iorc.ID_CUSTOMER_SERVICE := SEQ_ID_CUSTOMER_SERVICE.NEXTVAL;
			iorc.CONTRACT_DATE := sysdate;
			
			BEGIN
        		SELECT ID_CUSTOMER INTO v_customer_id
        		FROM CUSTOMER
        		WHERE ID_CUSTOMER = iorc.FK_ID_CUSTOMER;
    		EXCEPTION
        		WHEN NO_DATA_FOUND THEN
            		raise_application_error(-20012, 'Dato no válido: ID de cliente no existente.');
    		END;
    	
    		BEGIN
        		SELECT ID_SERVICE, PRICE INTO v_service_id, v_service_value
        		FROM SERVICES
        		WHERE ID_SERVICE = iorc.FK_ID_SERVICE;
    		EXCEPTION
        		WHEN NO_DATA_FOUND THEN
            		raise_application_error(-20012, 'Dato no válido: ID de servicio no existente.');
    		END;
			
			INSERT INTO CUSTOMER_SERVICES VALUES /*+PKG_CREATE_CUSTOMER_SERVICES_BILLING.insCUSTOMER_SERVICES*/ iorc;
			
			INSERT INTO BILLING (ID_BILLING, VALUE, VALUE_DISCOUNT) VALUES (iorc.ID_CUSTOMER_SERVICE, v_service_value, v_service_value);
		
		EXCEPTION
			WHEN VALUE_ERROR THEN
				raise_application_error(-20005, 'Dato no válido: Valor incorrecto proporcionado.');
			WHEN INVALID_NUMBER THEN
        		raise_application_error(-20007, 'Conversión numérica no válida.');
			WHEN DUP_VAL_ON_INDEX THEN
				raise_application_error(-20006, 'ya existe un cliente con ese ID');
			WHEN OTHERS THEN
				raise_application_error(-20002, 'Ocurrio un error en PKG_CREATE_CUSTOMER_SERVICES_BILLING.insCUSTOMER_SERVICES: ' || SQLERRM);
	
	END insCUSTOMER_SERVICES;

END PKG_CREATE_BILLING;