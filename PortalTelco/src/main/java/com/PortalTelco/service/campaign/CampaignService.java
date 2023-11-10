package com.PortalTelco.service.campaign;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.model.Campaign;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Optional;

public interface CampaignService {
    //POST
    ResponseEntity<String> createCampaign (@RequestBody CampaignDTOSQL campaignDTOSQL);
    //GET BY ID
    Optional<Campaign> getCampaignById (Long id);
    //GET BY STATUS
    List<Campaign> getCampaignByStatus (String status);
    //PUT BY ID
    Optional<Campaign> editCampaign (Long id, Campaign campaignDetails);


}
