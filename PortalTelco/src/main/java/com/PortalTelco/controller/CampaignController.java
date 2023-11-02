package com.PortalTelco.controller;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Campaign;
import com.PortalTelco.service.campaign.CampaignService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("campaign")
@CrossOrigin(origins = "http://localhost:4200")
public class CampaignController {

    private final CampaignService campaignService;

    public CampaignController(CampaignService campaignService) {
        this.campaignService = campaignService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, String>> createCampaign(@RequestBody CampaignDTOSQL campaignDTOSQL) {
        String message = String.valueOf(campaignService.createCampaign(campaignDTOSQL));
        Map<String, String> response = new HashMap<>();
        response.put("message", message);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/get-by-id/{id}")
    public Optional<Campaign> getCampaignById(@PathVariable Long id){
        return campaignService.getCampaignById(id);
    }

    @GetMapping("/get-by-status/{status}")
    public ResponseEntity<List<Campaign>> getCustomerByDocument(@PathVariable String status) {
        List<Campaign> campaigns = campaignService.getCampaignByStatus(status);
        if(campaigns.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(campaigns);
    }


    @PutMapping("/edit-campaign/{id}")
    public ResponseEntity<Campaign> editCampaignById(@PathVariable Long id, @RequestBody Campaign campaignDetails){
        Optional<Campaign> updateCampaign = campaignService.editCampaign(id, campaignDetails);
        return updateCampaign.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

}