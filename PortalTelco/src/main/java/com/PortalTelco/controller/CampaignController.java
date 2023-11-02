package com.PortalTelco.controller;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.model.Campaign;
import com.PortalTelco.service.campaign.CampaignService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("campaign")
public class CampaignController {

    private final CampaignService campaignService;

    public CampaignController(CampaignService campaignService) {
        this.campaignService = campaignService;
    }

    @PostMapping("/create")
    public ResponseEntity<String> createCampaign(@RequestBody CampaignDTOSQL campaignDTOSQL) {
        return campaignService.createCampaign(campaignDTOSQL);
    }

    @GetMapping("/get-by-id/{id}")
    public Optional<Campaign> getCampaignById(@PathVariable Long id){
        return campaignService.getCampaignById(id);
    }

    @PutMapping("/edit-campaign/{id}")
    public ResponseEntity<Campaign> editCampaignById(@PathVariable Long id, @RequestBody Campaign campaignDetails){
        Optional<Campaign> updateCampaign = campaignService.editCampaign(id, campaignDetails);
        return updateCampaign.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

}