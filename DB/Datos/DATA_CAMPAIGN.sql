INSERT INTO APP_DISCOUNT_TELCO.CAMPAIGN 
(ID_CAMPAIGN, CAMPAIGN_JOIN_DATE, NUMBER_OF_SERVICES, CUSTOMER_SENIORITY, DISCOUNT, DISCOUNT_START_DATE, DISCOUNT_END_DATE, STATUS) 
VALUES(SEQ_ID_CAMPAIGN.NEXTVAL, SYSTIMESTAMP, 1, 5, 20, SYSTIMESTAMP, ADD_MONTHS(SYSTIMESTAMP, 12), 'activo');

INSERT INTO APP_DISCOUNT_TELCO.CAMPAIGN 
(ID_CAMPAIGN, CAMPAIGN_JOIN_DATE, NUMBER_OF_SERVICES, CUSTOMER_SENIORITY, DISCOUNT, DISCOUNT_START_DATE, DISCOUNT_END_DATE, STATUS) 
VALUES(SEQ_ID_CAMPAIGN.NEXTVAL, SYSTIMESTAMP, 2, 5, 40, SYSTIMESTAMP, ADD_MONTHS(SYSTIMESTAMP, 12), 'activo');
