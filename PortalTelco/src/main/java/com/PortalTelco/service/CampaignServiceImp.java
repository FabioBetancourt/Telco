package com.PortalTelco.service;

import com.PortalTelco.dto.CampaignDTOSQL;
import com.PortalTelco.repository.CampaignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class CampaignServiceImp implements CampaignService{


    @Autowired
    private EntityManager entityManager;

    private final CampaignRepository campaignRepository;

    @Autowired
    public CampaignServiceImp(CampaignRepository campaignRepository) {
        this.campaignRepository = campaignRepository;
    }

    @Override
    public void CreateCampaign(CampaignDTOSQL campaignDTOSQL) {
        campaignRepository.addCampaign(campaignDTOSQL);
    }
}
