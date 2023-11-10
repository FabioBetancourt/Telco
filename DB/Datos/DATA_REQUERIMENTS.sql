DECLARE
  i NUMBER;
  fk_id_customer NUMBER;
  fk_id_service NUMBER;
  id_customer_service NUMBER;
BEGIN
  FOR i IN 1..10000 LOOP
    -- Insertar cliente
    INSERT INTO APP_DISCOUNT_TELCO.CUSTOMER (ID_CUSTOMER, DOCUMENT, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS) 
    SELECT 
      SEQ_ID_CUSTOMER.NEXTVAL, -- ID de cliente generado automáticamente
      1000000 + i, -- Número de documento
      'Cliente', -- Nombre
      'Nuevo' || i, -- Apellido
      'cliente' || i || '@email.com', -- Correo electrónico
      '+57 98765432', -- Número de teléfono
      'Calle ' || i -- Dirección
    FROM dual RETURNING ID_CUSTOMER INTO fk_id_customer;

    -- Determinar FK_ID_SERVICE y VALUE
    fk_id_service := MOD(i, 4) + 1;
    id_customer_service := SEQ_CUSTOMER_SERVICE.NEXTVAL;

    -- Insertar servicio contratado para el cliente
    INSERT INTO APP_DISCOUNT_TELCO.CUSTOMER_SERVICES (ID_CUSTOMER_SERVICE, FK_ID_CUSTOMER, FK_ID_SERVICE, CONTRACT_DATE) 
    VALUES (id_customer_service, fk_id_customer, fk_id_service, TO_DATE('01-01-2000', 'DD-MM-YYYY') + (DBMS_RANDOM.VALUE * (SYSDATE - TO_DATE('01-01-2000', 'DD-MM-YYYY'))));

    -- Insertar factura para el servicio contratado
    INSERT INTO APP_DISCOUNT_TELCO.BILLING (ID_BILLING, VALUE, DISCOUNT, VALUE_DISCOUNT) 
    VALUES (id_customer_service, CASE fk_id_service WHEN 1 THEN 20000 WHEN 2 THEN 30000 WHEN 3 THEN 35000 WHEN 4 THEN 90000 END, 0, 0);
  END LOOP;
END;
