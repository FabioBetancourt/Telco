-- TC_GB_24
-- By: Fabio Betancourt
-- Date: 10/11/2023
-- Description: creates schema objects for TC_GB_24

PROMPT TC_GB_24_SCHEMA_SCRIPT.sql;

ALTER SESSION SET CURRENT_SCHEMA=APP_DISCOUNT_TELCO;
/

PROMPT --------------CREATING TABLES -------------------

PROMPT crtbCUSTOMER.sql
@\Tablas\crtbCUSTOMER.sql
/

PROMPT crtbSERVICES.sql
@\Tablas\crtbSERVICES.sql
/

PROMPT crtbCAMPAIGN.sql
@\Tablas\crtbCAMPAIGN.sql
/

PROMPT crtbCUSTOMER-SERVICE.sql
@\Tablas\crtbCUSTOMER-SERVICE.sql
/

PROMPT crtbBILLING.sql
@\Tablas\crtbBILLING.sql
/


PROMPT --------------CREATING SEQUENCES-----------------

PROMPT crsqSEQ_ID_CUSTOMER.sql
@\Secuencias\crsqSEQ_ID_CUSTOMER.sql
/

PROMPT crsqSEQ_ID_SERVICE.sql
@\Secuencias\crsqSEQ_ID_SERVICE.sql
/

PROMPT crsqSEQ_ID_CAMPAIGN.sql
@\Secuencias\crsqSEQ_ID_CAMPAIGN.sql
/

PROMPT crsqSEQ_ID_CUSTOMER_SERVICE.sql
@\Secuencias\crsqSEQ_ID_CUSTOMER_SERVICE.sql
/

PROMPT --------------CREATING INDEXES-------------------

PROMPT crIDX_BILLING_DISCOUNT.sql
@\Secuencias\crIDX_BILLING_DISCOUNT.sql
/

PROMPT crIDX_BILLING_DISCOUNT_END_DATE.sql
@\Secuencias\crIDX_BILLING_DISCOUNT_END_DATE.sql
/

PROMPT crIDX_CAMPAIGN_SATUS.sql
@\Secuencias\crIDX_CAMPAIGN_SATUS.sql
/

PROMPT crIDX_CUST_SERVICES_CONTRACT_DATE.sql
@\Secuencias\crIDX_CUST_SERVICES_CONTRACT_DATE.sql
/

PROMPT crIDX_CUST_SERVICES_FK_CUSTOMER.sql
@\Secuencias\crIDX_CUST_SERVICES_FK_CUSTOMER.sql
/

PROMPT crIDX_CUSTOMER_DOCUMENT.sql
@\Secuencias\crIDX_CUSTOMER_DOCUMENT.sql
/

PROMPT crPK_CUSTOMER.sql
@\Indices\crPK_CUSTOMER.sql
/

PROMPT crPK_SERVICE.sql
@\Indices\crPK_SERVICE.sql
/

PROMPT crPK_CAMPAIGN.sql
@\Indices\crPK_CAMPAIGN.sql
/

PROMPT crPK_CUSTOMER_SERVICE.sql
@\Indices\crPK_CUSTOMER_SERVICE.sql
/

PROMPT crPK_BILLING.sql
@\Indices\crPK_BILLING.sql
/

PROMPT --------------CREATING REFERENCES-------------------

PROMPT crFK_BILLING_ID_BILLING.sql
@\Referencias\crFK_BILLING_ID_BILLING.sql
/

PROMPT crFK_CUSTOMER_SERVICE_FK_ID_CUSTOMER.sql
@\Referencias\crFK_CUSTOMER_SERVICE_FK_ID_CUSTOMER.sql
/

PROMPT crFK_CUSTOMER_SERVICE_FK_ID_SERVICE.sql
@\Referencias\crFK_CUSTOMER_SERVICE_FK_ID_SERVICE.sql
/

PROMPT --------------CREATING TYPES-------------------

PROMPT crTYRC_BILLING.sql
@\Tipos\crTYRC_BILLING.sql
/

PROMPT crTYRC_CAMPAIGN.sql
@\Tipos\crTYRC_CAMPAIGN.sql
/

PROMPT crTYRC_CUSTOMER.sql
@\Tipos\crTYRC_CUSTOMER.sql
/

PROMPT crTYRC_CUSTOMER_SERVICE.sql
@\Tipos\crTYRC_CUSTOMER_SERVICE.sql
/

PROMPT ---------------------CREATING PACKAGES-------------------------

PROMPT crpckDISCOUNT_PACKAGE.sql
@\Paquetes\crpckDISCOUNT_PACKAGE.sql
/

PROMPT PKG_EMERGENCIES_REPORTS_BODY.sql
@\Paquetes\crpckDISCOUNT_PACKAGE_BODY.sql
/

PROMPT crPKG_APP_CREATE_CAMPAIGN.sql
@\Paquetes\crPKG_APP_CREATE_CAMPAIGN.sql
/

PROMPT crPKG_APP_CREATE_CAMPAIGN_BODY.sql
@\Paquetes\crPKG_APP_CREATE_CAMPAIGN_BODY.sql
/

PROMPT crPKG_APP_CREATE_CUSTOMER.sql
@\Paquetes\crPKG_APP_CREATE_CUSTOMER.sql
/

PROMPT crPKG_APP_CREATE_CUSTOMER_BODY.sql
@\Paquetes\crPKG_APP_CREATE_CUSTOMER_BODY.sql
/

PROMPT crPKG_APP_CREATE_CUSTOMER_SERVICE.sql
@\Paquetes\crPKG_APP_CREATE_CUSTOMER_SERVICE.sql
/

PROMPT crPKG_APP_CREATE_CUSTOMER_SERVICE_BODY.sql
@\Paquetes\crPKG_APP_CREATE_CUSTOMER_SERVICE_BODY.sql
/

PROMPT crPKG_CREATE_CAMPAIGN.sql
@\Paquetes\crPKG_CREATE_CAMPAIGN.sql
/

PROMPT crPKG_CREATE_CAMPAIGN_BODY.sql
@\Paquetes\crPKG_CREATE_CAMPAIGN_BODY.sql
/

PROMPT crPKG_CREATE_CUSTOMER.sql
@\Paquetes\crPKG_CREATE_CUSTOMER.sql
/

PROMPT crPKG_CREATE_CUSTOMER_BODY.sql
@\Paquetes\crPKG_CREATE_CUSTOMER_BODY.sql
/


PROMPT crPKG_CUSTOMER_SERVICES_BILLING.sql
@\Paquetes\crPKG_CUSTOMER_SERVICES_BILLING.sql
/

PROMPT crPKG_CUSTOMER_SERVICES_BILLING_BODY.sql
@\Paquetes\crPKG_CREATE_CUSTOMER_BODY.sql
/


PROMPT crPKG_DISCOUNT_PACKAGE.sql
@\Paquetes\crPKG_CUSTOMER_SERVICES_BILLING_BODY.sql
/

PROMPT crPKG_DISCOUNT_PACKAGE_BODY.sql
@\Paquetes\crPKG_CREATE_CUSTOMER_BODY.sql
/

PROMPT --------------INSERTING DATA INTO SOME TABLES-------------------

PROMPT DATA_CAMPAIGN.sql
@\Datos\DATA_CAMPAIGN.sql
/

PROMPT DATA_SERVICES.sql
@\Datos\DATA_SERVICES.sql
/

PROMPT DATA_REQUERIMENTS.sql
@\Datos\DATA_REQUERIMENTS.sqls
/

PROMPT --------------CREATING JOB-------------------

PROMPT crjobDISCOUNT_JOB.sql
@\Job\crjobDISCOUNT_JOB.sql
/


PROMPT --------------ALL OBJECTS SUCCESSFULLY CREATED------------------

PROMPT ----------------------------------------------------------------
PROMPT END OF TC_GB_24_SCHEMA_SCRIPT.sql
PROMPT ----------------------------------------------------------------