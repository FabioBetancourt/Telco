/***************************************************************************************************************
Description: The table in charge of storing campaign information for a telecommunications company
Author: FABIO BETANCOURT
Date: 12-10-23
IdManagement: TCGB24
*****************************************************************************************************************/


CREATE TABLE APP_DISCOUNT_TELCO.CAMPAIGN (
	    ID_CAMPAIGN NUMBER,
	    CAMPAIGN_JOIN_DATE DATE,
	    NUMBER_OF_SERVICES NUMBER NOT NULL,
	    CUSTOMER_SENIORITY NUMBER NOT NULL,
	    DISCOUNT NUMBER(3) NOT NULL,
	    DISCOUNT_START_DATE DATE NOT NULL,
	    DISCOUNT_END_DATE DATE NOT NULL,
	    STATUS VARCHAR2(9)
	);


COMMENT ON TABLE CAMPAIGN IS 'Table that definy the control about discount dates';

COMMENT ON COLUMN CAMPAIGN.ID_CAMPAIGN IS 'id autoincrement to identify a campaign';

COMMENT ON COLUMN CAMPAIGN.CAMPAIGN_JOIN_DATE IS 'Control when a campaign is inserted';

COMMENT ON COLUMN CAMPAIGN.NUMBER_OF_SERVICES IS 'rule of how many minimum services are needed for the discount';

COMMENT ON COLUMN CAMPAIGN.CUSTOMER_SENIORITY IS 'rule of how many years in the company are needed for the discount';

COMMENT ON COLUMN CAMPAIGN.DISCOUNT IS 'promotional value';

COMMENT ON COLUMN CAMPAIGN.DISCOUNT_START_DATE IS 'date when the campaign should start';

COMMENT ON COLUMN CAMPAIGN.DISCOUNT_END_DATE IS 'date when the campaign should end';

COMMENT ON COLUMN CAMPAIGN.STATUS IS 'define if campaign is active or no';




