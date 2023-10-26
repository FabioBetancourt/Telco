CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_CREATE_CUSTOMER AS

/**********************************************************************************************************************/
	PROCEDURE insCUSTOMER (iorc IN OUT nocopy tyrcCUSTOMER) IS 
	
		BEGIN
			
			--initial values
			iorc.ID_CUSTOMER := SEQ_ID_CUSTOMER.NEXTVAL;
		
			INSERT INTO CUSTOMER VALUES /*+PKG_CREATE_CUSTOMER.insCUSTOMER*/ iorc;
		
		EXCEPTION
			WHEN VALUE_ERROR THEN
				raise_application_error(-20005, 'Dato no válido: Valor incorrecto proporcionado.');
			WHEN INVALID_NUMBER THEN
        		raise_application_error(-20007, 'Conversión numérica no válida.');
			WHEN DUP_VAL_ON_INDEX THEN
				raise_application_error(-20006, 'ya existe un cliente con ese ID');
			WHEN OTHERS THEN
				raise_application_error(-20002, 'Ocurrio un error en PKG_CREATE_CUSTOMER.insCUSTOMER: ' || SQLERRM);
	
	END insCUSTOMER;

/**********************************************************************************************************************/

	PROCEDURE getCUSTOMER_ID (id IN NUMBER, orc OUT nocopy tyrcCUSTOMER) IS
	
		CURSOR cuCUSTOMER IS
			SELECT /*+INDEX(CUSTOMER PK_CUSTOMER)*/
				CUSTOMER.ID_CUSTOMER ,CUSTOMER.DOCUMENT, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, 
				CUSTOMER.EMAIL, CUSTOMER.PHONE_NUMBER, CUSTOMER.ADDRESS 
			FROM CUSTOMER
			WHERE /*+PKG_CREATE_CUSTOMER.getCUSTOMER*/
			ID_CUSTOMER = id;
	BEGIN
		
		OPEN cuCUSTOMER;
		FETCH cuCUSTOMER INTO orc;
		CLOSE cuCUSTOMER;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
        	raise_application_error(-20008, 'No se encontró un cliente con el ID proporcionado.');
   		WHEN TOO_MANY_ROWS THEN
        	raise_application_error(-20009, 'Más de un cliente encontrado con el ID proporcionado.');
    	WHEN INVALID_CURSOR THEN
        	raise_application_error(-20010, 'Operación no válida en el cursor.');
    	WHEN CURSOR_ALREADY_OPEN THEN
        	raise_application_error(-20011, 'El cursor ya está abierto.');
    	WHEN OTHERS THEN
    		IF cuCUSTOMER%isopen THEN
        		CLOSE cuCUSTOMER;
      		END IF;   
        	raise_application_error(-20002, 'Ocurrió un error en PKG_CREATE_CUSTOMER.getCUSTOMER: ' || SQLERRM);
        
	END getCUSTOMER_ID;

/**********************************************************************************************************************/

	PROCEDURE getCUSTOMER_DOCUMENT(
	
	isbIdDocument IN NUMBER, 
	orc OUT NOCOPY tytbCUSTOMER
	
	) 
	
	IS
	
    v_index BINARY_INTEGER := 1;
   
	BEGIN
    	FOR v_rec IN (SELECT /*+INDEX(CUSTOMER IDX_CUSTOMER_DOCUMENT)*/
                      CUSTOMER.ID_CUSTOMER, CUSTOMER.DOCUMENT, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, 
                      CUSTOMER.EMAIL, CUSTOMER.PHONE_NUMBER, CUSTOMER.ADDRESS 
                  FROM CUSTOMER
                  WHERE /*+PKG_CREATE_CUSTOMER.getCUSTOMER_DOCUMENT*/
                  DOCUMENT = isbIdDocument) LOOP
                  
        orc(v_index) := v_rec;
        v_index := v_index + 1;
        
    END LOOP;
   
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
        	raise_application_error(-20008, 'No se encontró un cliente con el Documento proporcionado.');
    	WHEN OTHERS THEN
        	raise_application_error(-20002, 'Ocurrió un error en PKG_CREATE_CUSTOMER.getCUSTOMER_DOCUMENT: ' || SQLERRM);
        
	END getCUSTOMER_DOCUMENT;

END PKG_CREATE_CUSTOMER;
