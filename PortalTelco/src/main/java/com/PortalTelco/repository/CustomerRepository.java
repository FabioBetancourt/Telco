package com.PortalTelco.repository;

import com.PortalTelco.dto.CustomerDTOSQL;
import java.sql.Types;
import java.util.Collections;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;


    SimpleJdbcCall addCustomerCall;


    CustomerRepository(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
        this.addCustomerCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("APP_DISCOUNT_TELCO")
                .withCatalogName("PKG_APP_CREATE_CUSTOMER")
                .withProcedureName("create_CUSTOMER")
                .declareParameters(
                        new SqlParameter("iCustomer", Types.STRUCT, "TYRC_CUSTOMER")
                );
    }

    public void addCustomer(final CustomerDTOSQL customerDTOSQL) {
        Map in = Collections.singletonMap("iCustomer", customerDTOSQL);
        addCustomerCall.executeObject(CustomerDTOSQL.class, in);
    }


}
