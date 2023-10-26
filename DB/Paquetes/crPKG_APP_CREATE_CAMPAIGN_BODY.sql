CREATE OR REPLACE PACKAGE BODY APP_DISCOUNT_TELCO.PKG_APP_CREATE_CAMPAIGN AS
/****************************************************************************************/
	--procedure with param TYRC_CAMPAIGN look folder "types"
	PROCEDURE create_CAMPAIGN(iCampaign IN TYRC_CAMPAIGN) IS 
		campaign PKG_CREATE_CAMPAIGN.tyrcCAMPAIGN;
		custom_exception EXCEPTION;
	
	BEGIN
		campaign.NUMBER_OF_SERVICES := iCampaign.NUMBER_OF_SERVICES;
    	campaign.CUSTOMER_SENIORITY := iCampaign.CUSTOMER_SENIORITY;
    	campaign.DISCOUNT := iCampaign.DISCOUNT;
    	campaign.DISCOUNT_START_DATE := iCampaign.DISCOUNT_START_DATE;
    	campaign.DISCOUNT_END_DATE := iCampaign.DISCOUNT_END_DATE;
    
    	PKG_CREATE_CAMPAIGN.insCAMPAIGN(campaign);
    
    EXCEPTION
    	WHEN custom_exception THEN
    		raise_application_error(-20001, 'Custom error');
    	WHEN OTHERS THEN 
    		raise_application_error(SQLCODE, SQLERRM, TRUE);
	END create_CAMPAIGN;
/******************************************************************************************/
END PKG_APP_CREATE_CAMPAIGN;