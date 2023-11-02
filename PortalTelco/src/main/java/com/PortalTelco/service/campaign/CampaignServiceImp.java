package com.PortalTelco.service.campaign;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.model.Campaign;
import com.PortalTelco.repository.campaign.CampaignRepository;
import com.PortalTelco.repository.campaign.CampaignRepositoryInterfaceJPA;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Optional;


@Service
public class CampaignServiceImp implements CampaignService{


    private final CampaignRepository campaignRepository;
    private final CampaignRepositoryInterfaceJPA campaignRepositoryInterfaceJPA;

    public CampaignServiceImp(CampaignRepository campaignRepository, CampaignRepositoryInterfaceJPA campaignRepositoryInterfaceJPA) {
        this.campaignRepository = campaignRepository;
        this.campaignRepositoryInterfaceJPA = campaignRepositoryInterfaceJPA;
    }

    /*******************************************JDBC***********************************************/

    @Override
    public ResponseEntity<String> createCampaign (@RequestBody CampaignDTOSQL campaignDTOSQL){
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

    @Override
    public Optional<Campaign> getCampaignById(Long id) {
        return campaignRepositoryInterfaceJPA.findById(id);
    }


    /*******************************************JPA***********************************************/
    @Override
    public List<Campaign> getCampaignByStatus(String status) {
        return campaignRepositoryInterfaceJPA.findByStatus(status);
    }


    @Override
    public Optional<Campaign> editCampaign(Long id, Campaign campaignDetails) {
        Optional<Campaign> campaignOptional = campaignRepositoryInterfaceJPA.findById(id);
        if (campaignOptional.isEmpty()) {
            return Optional.empty();
        }
        Campaign campaign = campaignOptional.get();
        campaign.setNumberOfServices(campaignDetails.getNumberOfServices());
        campaign.setCustomerSeniority(campaignDetails.getCustomerSeniority());
        campaign.setDiscount(campaignDetails.getDiscount());
        campaign.setDiscountStartDate(campaignDetails.getDiscountStartDate());
        campaign.setDiscountEndDate(campaignDetails.getDiscountEndDate());
        campaignRepositoryInterfaceJPA.save(campaign);
        return Optional.of(campaign);
    }

}
