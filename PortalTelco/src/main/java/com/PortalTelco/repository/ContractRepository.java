package com.PortalTelco.repository;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.dto.ContractDTOSQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import java.sql.Types;
import java.util.Collections;
import java.util.Map;

@Repository
public class ContractRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    SimpleJdbcCall addCustomerServiceCall;


    public ContractRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.addCustomerServiceCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("APP_DISCOUNT_TELCO")
                .withCatalogName("PKG_APP_CREATE_CUSTOMER_SERVICE")
                .withProcedureName("create_CUSTOMER_SERVICE")
                .declareParameters(
                        new SqlParameter("iCustomerService", Types.STRUCT, "TYRC_CUSTOMER_SERVICES")
                );
    }

    public void AddCustomerService(final ContractDTOSQL contractDTOSQL) {
        Map<String, ContractDTOSQL> in = Collections.singletonMap("iCustomerService", contractDTOSQL);
        addCustomerServiceCall.executeObject(CampaignDTOSQL.class, in);
    }
}
