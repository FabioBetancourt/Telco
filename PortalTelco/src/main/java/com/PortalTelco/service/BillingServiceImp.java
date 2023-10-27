package com.PortalTelco.service;

import com.PortalTelco.model.Billing;
import com.PortalTelco.repository.BillingRepositoryInterfaceJPA;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillingServiceImp implements BillingService{

    private final BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA;

    public BillingServiceImp(BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA) {
        this.billingRepositoryInterfaceJPA = billingRepositoryInterfaceJPA;
    }

    @Override
    public List<Billing> findByIdBilling(Long id) {
        return billingRepositoryInterfaceJPA.getByIdBilling(id);
    }
}
