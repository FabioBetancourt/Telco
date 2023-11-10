package com.PortalTelco.repository.campaign;

import com.PortalTelco.dto.CampaignDTOSQL;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import java.sql.Types;
import java.util.Collections;
import java.util.Map;

@Repository
public class CampaignRepository {

    JdbcTemplate jdbcTemplate;
    SimpleJdbcCall addCampaignCall;

    public CampaignRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.addCampaignCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("APP_DISCOUNT_TELCO")
                .withCatalogName("PKG_APP_CREATE_CAMPAIGN")
                .withProcedureName("create_CAMPAIGN")
                .declareParameters(
                        new SqlParameter("iCampaign", Types.STRUCT, "TYRC_CAMPAIGN")
                );
    }

    public void addCampaign(final CampaignDTOSQL campaignDTOSQL) {
        Map<String, CampaignDTOSQL> in = Collections.singletonMap("iCampaign", campaignDTOSQL);
        addCampaignCall.executeObject(CampaignDTOSQL.class, in);
    }
}
