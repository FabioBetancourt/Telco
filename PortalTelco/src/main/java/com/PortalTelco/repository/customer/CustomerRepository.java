package com.PortalTelco.repository.customer;

import com.PortalTelco.dto.CustomerDTOSQL;

import java.sql.Types;
import java.util.Collections;
import java.util.Map;

import org.springframework.jdbc.core.*;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerRepository {


    JdbcTemplate jdbcTemplate;
    SimpleJdbcCall addCustomerCall;

    public CustomerRepository(JdbcTemplate jdbcTemplate){
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
        Map<String, CustomerDTOSQL> in = Collections.singletonMap("iCustomer", customerDTOSQL);
        addCustomerCall.executeObject(CustomerDTOSQL.class, in);
    }

}
