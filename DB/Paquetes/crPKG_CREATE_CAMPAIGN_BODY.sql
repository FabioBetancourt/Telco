CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_CREATE_CAMPAIGN AS

/**********************************************************************************************************************/
	PROCEDURE insCAMPAIGN (iorc IN OUT nocopy tyrcCAMPAIGN) IS 
	
		BEGIN
			
			--initial values
			iorc.ID_CAMPAIGN := SEQ_ID_CAMPAIGN.NEXTVAL;
			iorc.CAMPAIGN_JOIN_DATE := sysdate;
			
			IF TRUNC(iorc.DISCOUNT_START_DATE) <= TRUNC(SYSDATE) AND TRUNC(IORC.DISCOUNT_END_DATE) >= TRUNC(SYSDATE) THEN 
				iorc.status := LOWER(TRIM('ACTIVO'));
			ELSE 
				iorc.status := LOWER(TRIM('inactivo'));
			END IF;
		
			INSERT INTO CAMPAIGN VALUES /*+PKG_CREATE_CAMPAIGN.insCAMPAIGN*/ iorc;
		
		EXCEPTION
			WHEN VALUE_ERROR THEN
				raise_application_error(-20005, 'Dato no válido: Valor incorrecto proporcionado.');
			WHEN INVALID_NUMBER THEN
        		raise_application_error(-20007, 'Conversión numérica no válida.');
			WHEN DUP_VAL_ON_INDEX THEN
				raise_application_error(-20006, 'ya existe una campaña con ese ID');
			WHEN OTHERS THEN
				raise_application_error(-20002, 'Ocurrio un error en PKG_CREATE_CAMPAIGN.insCAMPAIGN: ' || SQLERRM);
	
	END insCAMPAIGN;

/**********************************************************************************************************************/


	PROCEDURE getCAMPAIGN_STATUS(
	
	id_status IN CAMPAIGN.STATUS%type, 
	orc OUT NOCOPY tytbCAMPAIGN
	
	) 
	
	IS
	
    v_index BINARY_INTEGER := 1;
   
	BEGIN
    	FOR v_rec IN (SELECT /*+INDEX(CUSTOMER IDX_CAMPAIGN_STATUS)*/
	                    CAMPAIGN.ID_CAMPAIGN,
					    CAMPAIGN.CAMPAIGN_JOIN_DATE,
					    CAMPAIGN.NUMBER_OF_SERVICES,
					    CAMPAIGN.CUSTOMER_SENIORITY,
					    CAMPAIGN.DISCOUNT,
					    CAMPAIGN.DISCOUNT_START_DATE,
					    CAMPAIGN.DISCOUNT_END_DATE,
					    CAMPAIGN.STATUS
                  FROM CAMPAIGN
                  WHERE /*+PKG_CREATE_CAMPAIGN.getCAMPAIGN_STATUS*/
                  STATUS = LOWER(TRIM(id_status))) LOOP
                  
        orc(v_index) := v_rec;
        v_index := v_index + 1;
        
    END LOOP;
   
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
        	raise_application_error(-20008, 'No se encontró una campaña con el estado proporcionado.');
    	WHEN OTHERS THEN
        	raise_application_error(-20002, 'Ocurrió un error en PKG_CREATE_CAMPAIGN.getCAMPAIGN_STATUS: ' || SQLERRM);
        
	END getCAMPAIGN_STATUS;

END PKG_CREATE_CAMPAIGN;
