package com.PortalTelco.repository.campaign;

import com.PortalTelco.model.Campaign;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CampaignRepositoryInterfaceJPA extends JpaRepository<Campaign, Long> {

    //Necessary to find a campaign by status
    List<Campaign> findByStatus (String status);
}
