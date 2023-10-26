package com.PortalTelco.controller;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.repository.CampaignRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("campaign")
public class CampaignController {

    private final CampaignRepository campaignRepository;

    public CampaignController(CampaignRepository campaignRepository) {
        this.campaignRepository = campaignRepository;
    }

    @PostMapping
    public ResponseEntity<String> create (@RequestBody CampaignDTOSQL campaignDTOSQL){
        try{
            campaignRepository.addCampaign(campaignDTOSQL);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body("La campaña con fecha de registro: "+ campaignDTOSQL.getDiscountStartDate() +
                            " ha sido creado exitosamente");
        }catch (Exception e){
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Halgo salio mal, Error ocurrido: " + e);
        }
    }
}
