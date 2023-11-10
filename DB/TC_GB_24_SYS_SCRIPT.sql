-- TC_GB_24
-- By: Fabio Betancourt
-- Date: 10/11/2023
-- Description: creates schema and grants privileges for TC_GB_24

PROMPT TC_GB_24_SYS_SCRIPT.sql;

ALTER SESSION SET CURRENT_SCHEMA=SYSTEM;

PROMPT --------------CREATING SCHEMA AND GRANTING PRIVILEGES-------------------
PROMPT crGRANT_RESOURCE.sql
@Permisos\crGRANT_RESOURCE.sql
PROMPT ---------------------SCHEMA SUCCESSFULLY CREATED---------------------

PROMPT ------------------------------------------------
PROMPT END OF TC_GB_24_SYS_SCRIPT.sql
PROMPT ------------------------------------------------