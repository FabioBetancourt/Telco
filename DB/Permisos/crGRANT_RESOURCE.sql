/************************************************************************************
Descripción: object in charge of managing the database (administrator permission)
Autor:       Fabio Betancourt
Fecha:       16-10-2023
IdGestión:   TCGB24
************************************************************************************/

CREATE USER APP_DISCOUNT_TELCO IDENTIFIED BY oracle;
GRANT RESOURCE, CONNECT TO APP_DISCOUNT_TELCO;
GRANT ALL PRIVILEGES TO APP_DISCOUNT_TELCO;

